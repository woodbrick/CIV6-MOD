-- ===========================================================================
--
--	Loading screen as player goes from shell to game state.
--
-- ===========================================================================

include( "InputSupport" );
include( "InstanceManager" );
include( "SupportFunctions" );
include( "Civ6Common" );


-- ===========================================================================
--	Action Hotkeys
-- ===========================================================================
local m_actionHotkeyStartGame		:number = Input.GetActionId("StartGame");
local m_actionHotkeyStartGameAlt	:number = Input.GetActionId("StartGameAlt");



-- ===========================================================================
--	CONSTANTS
-- ===========================================================================

local DARKEN_AMOUNT			:number = -25;
local MIN_BLACK_Y			:number = 2;	-- Minimum size for black boxes on row bars
local SIZE_BUILDING_ICON	:number = 32;
local SIZE_CIV_LOGO_ICON	:number = 256;	-- Size of the logo in the background
local SIZE_UNIT_ICON		:number = 32;
local TIMEOUT_LOAD			:number = 1000;	-- # of frames before a timeout occurs obtaining player data for load screen


-- ===========================================================================
--	MEMBERS / VARIABLES
-- ===========================================================================
local m_isLoadComplete				:boolean = false;
local m_isResyncLoad				:boolean = false;
local m_isTraitsFullDescriptions	:boolean = true;
local m_screenWidth, m_screenHeight = UIManager:GetScreenSizeVal();


-- ===========================================================================
--	FUNCTIONS
-- ===========================================================================

-- ===========================================================================
function OnActivateButtonClicked()
	Controls.BackgroundImage:UnloadTexture();
	Controls.Portrait:UnloadTexture();
	Events.LoadScreenClose();
	UI.PlaySound("STOP_SPEECH_DAWNOFMAN");
	UI.PlaySound("Stop_Main_Menu_Music");
	UI.PlaySound("Game_Begin_Button_Click");
	UI.PlaySound("Set_View_3D");
	UIManager:DequeuePopup( ContextPtr );

	Input.SetActiveContext( InputContext.World );

	if(UILens.IsPlayerLensSetToActive()) then
		UILens.SetActive("Default");
	end

    UI.SetExitOnClose(false);
end

-- ===========================================================================
--	Input Processing
-- ===========================================================================
function OnInput( uiMsg, wParam, lParam )
    if uiMsg == KeyEvents.KeyUp then
        if wParam == Keys.VK_ESCAPE then
			if m_isLoadComplete then
				OnActivateButtonClicked();
				return true;
			end
        end
    end
    return false;	-- Don't consume all; let hotkey action system get a crack
end

-- ===========================================================================
--	Hotkey
-- ===========================================================================
function OnInputActionTriggered( actionId:number )
	if	actionId == m_actionHotkeyStartGame		or
		actionId == m_actionHotkeyStartGameAlt	then
		if m_isLoadComplete then
			OnActivateButtonClicked();
		end
	end		

end

-- ===========================================================================
function RegisterButtonCallbacks()
	Controls.ActivateButton:RegisterCallback( Mouse.eMouseEnter, function() UI.PlaySound("Main_Menu_Mouse_Over"); end );
	Controls.ActivateButton:RegisterCallback( Mouse.eLClick, OnActivateButtonClicked );
	Controls.StartLabelButton:RegisterCallback( Mouse.eLClick, OnActivateButtonClicked );
	Controls.FallbackMessage:RegisterCallback( Mouse.eLClick, OnActivateButtonClicked );
end

-- ===========================================================================
function ClearButtonCallbacks()
	Controls.ActivateButton:ClearCallback( Mouse.eLClick );
	Controls.ActivateButton:ClearCallback( Mouse.eMouseEnter );
	Controls.FallbackMessage:ClearCallback( Mouse.eLClick );
	Controls.StartLabelButton:ClearCallback( Mouse.eLClick );
end

-- ===========================================================================
--	UI Event
-- ===========================================================================
function OnShow()
	
	m_isLoadComplete	= false;
	m_isResyncLoad		= UI.IsResyncLoadInProgress(); -- Remember if this is a resync load for later.
	
	-- Adjust black bars	[
	local screenSizeX, screenSizeY	= UIManager:GetScreenSizeVal();	
	local backgroundSizeY	:number	= Controls.BackgroundImage:GetSizeY();	
	local blackY			:number = math.max( MIN_BLACK_Y, (screenSizeY - backgroundSizeY) * 0.5 );
	Controls.BarTop:SetSizeY( blackY );
	Controls.BarBottom:SetSizeY( blackY );

	UIManager:SetUICursor( 1 );
	Controls.FadeAnim:SetToBeginning();	
	Controls.ActivateButton:SetHide(true);	
	Controls.LoadingContainer:SetHide(false);

	-- Wait until game configuration data is ready before showing anything.
	Controls.BackgroundImage:SetHide(true);
	Controls.Banner:SetHide(true);
	Controls.Portrait:SetHide(true);
	
	-- Clear button callbacks until loading is complete.
	ClearButtonCallbacks();
end

-- ===========================================================================
--	UI Event
-- ===========================================================================
function OnHide()
	UIManager:SetUICursor( 0 );
end

-- ===========================================================================
function OnInit( isReload:boolean )
	if isReload then		
		OnShow();
		OnLoadScreenContentReady();
		OnLoadGameViewStateDone();
	end
end

-- ===========================================================================
--	All game data exists for the player in order to fill out the screen.
--	Do it...
-- ===========================================================================
function OnLoadScreenContentReady()

	if (GameConfiguration:IsWorldBuilderEditor()) then
		-- This needs to show some kind of World Builder splash screen.
		-- It can't show leaders, etc., they may not be initialized.
		return;
	end

	-- Because Game.GetLocalPlayer() not servicing yet use the network flavor;
	-- if in a hotseat mode the first slot may not be set to the human.
	local localPlayer	:number = Network.GetLocalPlayerID();
	if GameConfiguration.IsHotseat() then

		local maxPlayers :number = MapConfiguration.GetMaxMajorPlayers();
		for playerID = 0, maxPlayers-1,1 do
			local pPlayerConfig :table	= PlayerConfigurations[playerID];
			local slotStatus	:number = pPlayerConfig:GetSlotStatus();
			
			-- Potentially change the localPlayer number to the first human
			-- player in a slot.
			if slotStatus == SlotStatus.SS_TAKEN then
				localPlayer = playerID;	
				break;
			end
		end	
	end	

	local primaryColor, secondaryColor  = UI.GetPlayerColors( localPlayer );

	if primaryColor == nil then
		primaryColor = 0xff99aaaa;
		UI.DataError("NIL primary color; likely player object not ready... using default color.");
	end
	if secondaryColor == nil then
		secondaryColor = 0xffaa9999;
		UI.DataError("NIL secondary color; likely player object not ready... using default color.");
	end

	local backColor						= DarkenLightenColor(primaryColor, DARKEN_AMOUNT, 255);
	Controls.Banner:SetColor(backColor);
	
	local playerConfig		:table = PlayerConfigurations[localPlayer];
	if playerConfig == nil then
		UI.DataError("Received NIL playerConfig for player #"..tostring(localPlayer));
	end

	local backgroundTexture:string;
	local leaderType:string = playerConfig:GetLeaderTypeName();
	local loadingInfo:table = GameInfo.LoadingInfo[leaderType];
	if loadingInfo and loadingInfo.BackgroundImage then
		backgroundTexture = loadingInfo.BackgroundImage;
	else
		backgroundTexture = leaderType .. "_BACKGROUND";
	end
	
	Controls.BackgroundImage:SetTexture( backgroundTexture );
	if (not Controls.BackgroundImage:HasTexture()) then
		UI.DataError("Failed to load background image texture: "..backgroundTexture);
	end

	local LEADER_CONTAINER_X = 512;
	local offsetX = math.floor((Controls.Portrait:GetSizeX() - LEADER_CONTAINER_X)/2);
	if (offsetX > 0) then
		Controls.Portrait:SetOffsetX(offsetX);
	else
		Controls.Portrait:SetOffsetX(0);
	end

	local portraitName:string;
	if loadingInfo and loadingInfo.ForegroundImage then
		portraitName = loadingInfo.ForegroundImage;
	else
		portraitName = leaderType .. "_NEUTRAL";
	end
	
	Controls.Portrait:SetTexture( portraitName );
	if (not Controls.Portrait:HasTexture()) then
		UI.DataError("We are lacking a texture for "..portraitName);
	end
	Controls.CivName:SetText( Locale.ToUpper( Locale.Lookup(playerConfig:GetCivilizationDescription())) );

	
	local eraInfoText;
	local leaderInfoText;

	local startEra = GameInfo.Eras[ GameConfiguration.GetStartEra() ];

	if (GameConfiguration.IsSavedGame()) then
		-- Returns a list of 1 entry...
		local metaData = UI.GetSaveGameMetaData();
		if(metaData and #metaData == 1) then
			local item = metaData[1];
			local saveEra = GameInfo.Eras[ item.HostEra ];
			if(saveEra) then
				startEra = saveEra;
			end
		end
	end

	if (startEra ~= nil) then
		eraInfoText = startEra.Description;
		local JoinText = Locale.ToUpper(Locale.Lookup('LOC_LOADING_JOIN_THE_WORLD_STAGE') .. " - " .. Locale.Lookup(startEra.Name));
		Controls.Joining:SetText(JoinText);
	end
		
	local kLeader	:table = GameInfo.Leaders[leaderType];
	if kLeader ~= nil then
		local leaderName:string = Locale.ToUpper(Locale.Lookup( kLeader.Name ));
		Controls.LeaderName:SetText( leaderName );

		local details = "LOC_LOADING_INFO_" .. leaderType;
		if(Locale.HasTextKey(details)) then
			leaderInfoText = details;
		end
	else
		UI.DataError("No leader in DB by leaderType '"..leaderType.."'");
	end
	
	if(loadingInfo) then
		if(loadingInfo.EraText) then
			eraInfoText = loadingInfo.EraText;
		end

		if(loadingInfo.LeaderText) then
			leaderInfoText = loadingInfo.LeaderText;
		end
	end

	Controls.EraInfo:SetHide(true);
	Controls.LeaderInfo:SetHide(true);

	local civType	:string = playerConfig:GetCivilizationTypeName();
	local iconName	:string = "ICON_"..civType;
	Controls.LogoContainer:SetColor(primaryColor);
	Controls.Logo:SetColor(secondaryColor);
	Controls.Logo:SetIcon(iconName);

	Controls.Logo:SetHide(false);
	Controls.BackgroundImage:SetHide(false);
	Controls.Banner:SetHide(false);
	Controls.Portrait:SetHide(false);

    -- start the voiceover
    local leaderID = playerConfig:GetLeaderTypeID();
    local bPlayDOM = true;

	if(loadingInfo) then
		bPlayDOM = loadingInfo.PlayDawnOfManAudio;
	end

    if (m_isResyncLoad) then
        bPlayDOM = false;
    end

    if bPlayDOM then
        UI.SetSoundSwitchValue("Leader_Screen_Civilization", UI.GetCivilizationSoundSwitchValueByLeader(leaderID));
        UI.SetSoundSwitchValue("Civilization", UI.GetCivilizationSoundSwitchValueByLeader(leaderID));
        UI.SetSoundSwitchValue("Era_DawnOfMan", UI.GetEraSoundSwitchValue(startEra.Hash));
        UI.PlaySound("Play_DawnOfMan_Speech");
    end

	-- Obtain "uniques" from Civilization and for the chosen leader
	local uniqueAbilities;
	local uniqueUnits;
	local uniqueBuildings;
	-- put some testing in here for number of UU etc for smaller res screens

	uniqueAbilities, uniqueUnits, uniqueBuildings = HB_GetLeaderUniqueTraits( leaderType, true );
	local CivUniqueAbilities, CivUniqueUnits, CivUniqueBuildings = HB_GetCivilizationUniqueTraits( civType, true );
	
	-- Merge tables
	for i,v in ipairs(CivUniqueAbilities)	do table.insert(uniqueAbilities, v) end
	for i,v in ipairs(CivUniqueUnits)		do table.insert(uniqueUnits, v)		end
	for i,v in ipairs(CivUniqueBuildings)	do table.insert(uniqueBuildings, v) end

	-- Generate content
	for _, item in ipairs(uniqueAbilities) do
		print( "ua:", item.TraitType, item.Name, item.Description, Locale.Lookup(item.Description));	--debug
		local instance:table = {};
		ContextPtr:BuildInstanceForControl("TextInfoInstance", instance, Controls.FeaturesStack );
		local headerText:string = Locale.ToUpper(Locale.Lookup( item.Name )); 
		instance.Header:SetText( headerText );
		instance.Description:SetText( Locale.Lookup( item.Description ) );
	end

	local size:number = SIZE_BUILDING_ICON;

	for _, item in ipairs(uniqueUnits) do
		print( "uu:", item.TraitType, item.Name, item.Description, Locale.Lookup(item.Description));	--debug
		local instance:table = {};
		ContextPtr:BuildInstanceForControl("IconInfoInstance", instance, Controls.FeaturesStack );
		iconAtlas = "ICON_"..item.Type;
		instance.Icon:SetIcon(iconAtlas);
		--add description as tool tip to icon
		instance.Icon:SetToolTipString(item.Description);
		instance.TextStack:SetOffsetX( size + 4 );
		local headerText:string = Locale.ToUpper(Locale.Lookup( item.Name ));
		instance.Header:SetText( headerText );
		instance.Description:SetText(Locale.Lookup(item.Description));
	end


	for _, item in ipairs(uniqueBuildings) do
		print( "ub:", item.TraitType, item.Name, item.Description, Locale.Lookup(item.Description));	--debug
		local instance:table = {};
		ContextPtr:BuildInstanceForControl("IconInfoInstance", instance, Controls.FeaturesStack );
		instance.Icon:SetSizeVal(38,38);
		iconAtlas = "ICON_"..item.Type;
		instance.Icon:SetIcon(iconAtlas);
		--add description as tool tip to icon
		instance.Icon:SetToolTipString(item.Description);
		instance.TextStack:SetOffsetX( size + 4 );
		local headerText:string = Locale.ToUpper(Locale.Lookup( item.Name ));
		instance.Header:SetText( headerText );
		instance.Description:SetText(Locale.Lookup(item.Description));
	end

end

-- ===========================================================================
function HB_GetLeaderUniqueTraits( leaderType:string )

	-- Gather info.
    local base_leader = GameInfo.Leaders[leaderType];
    if(base_leader == nil) then
        return;
    end           

	function AddInheritedLeaders(leaders, leader)
		local inherit = leader.InheritFrom;
        if(inherit ~= nil) then
            local parent = GameInfo.Leaders[inherit];
            if(parent) then
                table.insert(leaders, parent);
                AddInheritedLeaders(leaders, parent);
            end
        end
    end

	local leaders = {};
    table.insert(leaders, base_leader);
	AddInheritedLeaders(leaders, base_leader);

	-- Enumerate final list and index.
	local has_leader = {};
	for i,leader in ipairs(leaders) do
		has_leader[leader.LeaderType] = true;
	end

	-- Unique Abilities
	-- We're considering a unique ability to be a trait which does 
	-- not have a unique unit, building, district, or improvement associated with it.
	-- While we scrub for unique units and infrastructure, mark traits that match 
	-- so we can filter them later.
    local traits = {};
	local has_trait = {};
	local not_ability = {};
    for row in GameInfo.LeaderTraits() do
        if(has_leader[row.LeaderType] == true) then
			local trait = GameInfo.Traits[row.TraitType];
			if(trait) then
				table.insert(traits, trait);			
			end
			has_trait[row.TraitType] = true;
        end
    end

    -- Unique Units
    local uu = {};
    for row in GameInfo.Units() do
        local trait = row.TraitType;
        if(trait) then
			not_ability[trait] = true;
			if(has_trait[trait] == true) then
				local description :string = Locale.Lookup("LOC_LOADING_"..row.Domain);
				if m_isTraitsFullDescriptions then
					description = Locale.Lookup(GameInfo.Units[row.UnitType].Description);
				end
				table.insert(uu, { Type = row.UnitType, Name = row.Name, Description = description });
			end
        end
    end
    
    -- Unique Buildings/Districts/Improvements
    local ub = {};
    for row in GameInfo.Buildings() do
        local trait = row.TraitType;
        if(trait) then
			not_ability[trait] = true;
			if(has_trait[trait] == true) then
				local districtName:string = Locale.Lookup(GameInfo.Districts[row.PrereqDistrict].Name);
				local description :string = Locale.Lookup("LOC_LOADING_DISTRICT_BUILDING", districtName); 
				if m_isTraitsFullDescriptions then
					description = Locale.Lookup(GameInfo.Buildings[row.BuildingType].Description); 
				end
				table.insert(ub, {Type = row.BuildingType, Name = row.Name, Description = description});
			end
        end
    end

    for row in GameInfo.Districts() do
        local trait = row.TraitType;
        if(trait) then
			not_ability[trait] = true;
			if(has_trait[trait] == true) then
				local description :string = Locale.Lookup("LOC_LOADING_UNIQUE_DISTRICT");
				if m_isTraitsFullDescriptions then
					description = Locale.Lookup(GameInfo.Districts[row.DistrictType].Description); 
				end
				table.insert(ub, {Type = row.DistrictType, Name = row.Name, Description = description});
			end
        end
    end

    for row in GameInfo.Improvements() do
        local trait = row.TraitType;
        if(trait) then
			not_ability[trait] = true;
			if(has_trait[trait] == true) then
				local description :string = Locale.Lookup("LOC_LOADING_UNIQUE_IMPROVEMENT");
				if m_isTraitsFullDescriptions then
					description = Locale.Lookup(GameInfo.Improvements[row.ImprovementType].Description); 
				end
				table.insert(ub, {Type = row.ImprovementType, Name = row.Name, Description = description});
			end
        end
    end

	local unique_abilities = {};
	for i, trait in ipairs(traits) do
		print(trait.InternalOnly);
		if(not_ability[trait.TraitType] ~= true and not trait.InternalOnly) then
			table.insert(unique_abilities, trait);
		end
	end

	return unique_abilities,uu,ub;
end

-- ===========================================================================
function HB_GetCivilizationUniqueTraits( civType:string )
    
	local traits = {};
    for row in GameInfo.CivilizationTraits() do
        if(row.CivilizationType == civType) then
            traits[row.TraitType] = true;
        end
    end

	-- Unique Abilities
	-- We're considering a unique ability to be a trait which does 
	-- not have a unique unit, building, district, or improvement associated with it.
	-- While we scrub for unique units and infrastructure, mark traits that match 
	-- so we can filter them later.
	local not_abilities = {};
	
    -- Unique Units
    local uu = {};
    for row in GameInfo.Units() do
        local trait = row.TraitType;
        if(trait) then
			not_abilities[trait] = true;
			if(traits[trait] == true) then
				local description :string = Locale.Lookup("LOC_LOADING_"..row.Domain);
				if m_isTraitsFullDescriptions then
					description = Locale.Lookup(GameInfo.Units[row.UnitType].Description);
				end
				table.insert(uu, { Type = row.UnitType, Name = row.Name, Description = description });
			end
        end
    end
    
    -- Unique Buildings/Districts/Improvements
    local ub = {};
    for row in GameInfo.Buildings() do
        local trait = row.TraitType;
        if(trait) then
			not_abilities[trait] = true;
			if(traits[trait] == true) then
				local building	  :table  = GameInfo.Buildings[row.BuildingType];
				local description :string = Locale.Lookup("LOC_LOADING_UNIQUE_BUILDING");
				if m_isTraitsFullDescriptions then
					if building == nil then
						UI.DataError("Could not get CIV trait as GameInfo.Buildings["..row.BuildingType.."] does not exist.");
					elseif building.Description == nil then
						UI.DataError("Could not get CIV trait description for GameInfo.Buildings["..row.BuildingType.."].  None supplied.");
					else
						description = Locale.Lookup(building.Description); 
					end				
				end
				table.insert(ub, {Type = row.BuildingType, Name = row.Name, Description = description});
			end
        end
    end

    for row in GameInfo.Districts() do
        local trait = row.TraitType;
        if(trait) then
			not_abilities[trait] = true;
			if(traits[trait] == true) then
				local description :string = Locale.Lookup("LOC_LOADING_UNIQUE_DISTRICT");
				if m_isTraitsFullDescriptions then
					description = Locale.Lookup(GameInfo.Districts[row.DistrictType].Description); 
				end
				table.insert(ub, {Type = row.DistrictType, Name = row.Name, Description = description});
			end
        end
    end

    for row in GameInfo.Improvements() do
        local trait = row.TraitType;
        if(trait) then
			not_abilities[trait] = true;
			if(traits[trait] == true) then
				local description :string = Locale.Lookup("LOC_LOADING_UNIQUE_IMPROVEMENT");
				if m_isTraitsFullDescriptions then
					description = Locale.Lookup(GameInfo.Improvements[row.ImprovementType].Description); 
				end
				table.insert(ub, {Type = row.ImprovementType, Name = row.Name, Description = description});
			end
        end
    end

	local unique_abilities = {};
	for row in GameInfo.CivilizationTraits() do
		if(row.CivilizationType == civType and not_abilities[row.TraitType] ~= true) then
			local trait = GameInfo.Traits[row.TraitType];
			if(trait) then
				table.insert(unique_abilities, trait);
			end			
		end
	end

	return unique_abilities, uu, ub;
end

-- ===========================================================================
-- ENGINE Event
-- ===========================================================================
function OnBeforeMultiplayerInviteProcessing()
	-- We're about to process a game invite.  Get off the popup stack before we accidently break the invite!
	UIManager:DequeuePopup( ContextPtr );
end

-- ===========================================================================
--	ENGINE Event
-- ===========================================================================
function OnLoadGameViewStateDone()
	
	m_isLoadComplete = true;	
	print("OnLoadGameViewStateDone");
	
	UIManager:SetUICursor( 0 );	
	
	if m_isResyncLoad or GameConfiguration.IsAnyMultiplayer() then
		-- If this is a resync load, skip the Begin Game button.
		OnActivateButtonClicked();
	else
		-- Activate the Begin Game button.
		local strGameButtonName;


		if (GameConfiguration.IsSavedGame()) then
			strGameButtonName = Locale.Lookup("LOC_CONTINUE_GAME");		
		else
			strGameButtonName = Locale.Lookup("LOC_BEGIN_GAME");
		end

		Controls.StartLabelButton:SetText(strGameButtonName);
		Controls.ActivateButton:SetHide(false);
		Controls.LoadingContainer:SetHide(true);
		Controls.FadeAnim:SetToBeginning();
		Controls.FadeAnim:Play();
		UI.PlaySound("Game_Begin_Button_Appear");
        		
		Input.SetActiveContext( InputContext.Ready );

		-- If automation is running, continue on.
		if (Automation.IsActive()) then
			OnActivateButtonClicked();
		end
	end    
	
	Controls.FallbackMessage:SetText("Start Game");

	RegisterButtonCallbacks();

	-- Engine loading should be done at this point; enable input handling.	
	ContextPtr:SetInputHandler( OnInput );
	Events.InputActionTriggered.Add( OnInputActionTriggered );
end

-- ===========================================================================
function Initialize()

	Input.SetActiveContext( InputContext.Loading );

	-- EVENTS:
	ContextPtr:SetInitHandler( OnInit );
	-- Do not set input handler until content loading is done; otherwise engine will make LUA calls to engine during load (not recommended).
	ContextPtr:SetShowHandler( OnShow );
	ContextPtr:SetHideHandler( OnHide );	

	Events.LoadScreenContentReady.Add( OnLoadScreenContentReady );		-- Ready to show player info
	Events.LoadGameViewStateDone.Add( OnLoadGameViewStateDone );		-- Ready to start game
	Events.BeforeMultiplayerInviteProcessing.Add( OnBeforeMultiplayerInviteProcessing );

    UI.SetExitOnClose(true);

	Controls.Portrait:ReprocessAnchoring();
end
Initialize();