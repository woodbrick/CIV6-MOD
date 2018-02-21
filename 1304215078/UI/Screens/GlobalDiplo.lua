-- ===========================================================================
--	View list of slots representing districts that can house great works.
--
--	Original Author: Sam Batista
-- ===========================================================================
include("InstanceManager");
include("PopupDialog")
include("SupportFunctions" );
include("CitySupport");

-- ===========================================================================
--	CONSTANTS
-- ===========================================================================
local RELOAD_CACHE_ID:string = "DiplomacyScreen"; -- Must be unique (usually the same as the file name)

local LOC_SCREEN_TITLE:string = "GLOBAL DIPLOMACY";
local LOC_UNKNOWN_CIV:string = Locale.Lookup("LOC_WORLD_RANKING_UNMET_PLAYER");
local LOC_UNKNOWN_CIV_COLORED:string = Locale.Lookup("LOC_WORLD_RANKING_UNMET_PLAYER_COLORED");
local ICON_UNKNOWN_LEADER:string = "ICON_LEADER_UNKNOWN";
local ICON_UNKNOWN_CIV:string = "ICON_CIVILIZATION_UNKNOWN";
local DEFAULT_DIPLO_HEIGHT:number = 180;

local m_CivInfoIM			:table = InstanceManager:new("CivInstance",	"Content",	Controls.CivStack);

local m_isLocalPlayerTurn:boolean = true;

-- ===========================================================================
--	SCREEN VARIABLES
-- ===========================================================================


-- ===========================================================================
--	PLAYER VARIABLES
-- ===========================================================================
local m_LocalPlayer:table;
local m_LocalPlayerID:number;
local m_PlayerCivicEras = {};
local m_PlayerTechEras = {};
local m_Eras = {};

-- ===========================================================================
--	Called every time screen is shown
-- ===========================================================================
function UpdatePlayerData()
	m_LocalPlayerID = Game.GetLocalPlayer();
	if m_LocalPlayerID ~= -1 then
		m_LocalPlayer = Players[m_LocalPlayerID];
	end
end

-- ===========================================================================
--	Called every time screen is shown
-- ===========================================================================
function View()
	
	local localPlayerID = Game.GetLocalPlayer();
	local m_LocalPlayer = Players[Game.GetLocalPlayer()];
	local gameEras:table = Game.GetEras();

	--clear any old instances
	m_CivInfoIM:DestroyInstances();

	-- loop thru all players in the game
	local players = Game.GetPlayers();
	for i, player in ipairs(players) do
		-- get a new instance
		local PlayerID = player:GetID();

		if (player:IsAlive() == true and player:IsMajor() == true and m_LocalPlayer:GetDiplomacy():HasMet(PlayerID)) or (localPlayerID == PlayerID) then
			local inst = m_CivInfoIM:GetInstance();
			local playerCulture	:table	= player:GetCulture();

			if inst["w_Stack"] ~= nil then
				inst["w_Stack"]:ResetInstances();
			else
				inst["w_Stack"] = InstanceManager:new("WonderInstance", "Content", inst.WondersStack);
			end

			if inst["d_Stack"] ~= nil then
				inst["d_Stack"]:ResetInstances();
			else
				inst["d_Stack"] = InstanceManager:new("DiploInstance", "Content", inst.DiploStack);
			end

			--set the civ icon for this palyer
			local civName:string, civLeaderName:string, civIcon:string, civPortrait:string = GetCivNameAndIcon(PlayerID, true);
			--print("-----------------------------------------------------------------------------");
			--print("CivLeaderName: " .. tostring(civLeaderName)); --ICON_CIVILIZATION_UNKNOWN
			--print("CivName: " .. tostring(civName));
			
			--set civ leader, civ icon, civ name and leader name
			inst.Portrait:SetIcon(civPortrait);
			inst.CivIcon:SetIcon(civIcon);
			inst.CivLeaderName:SetText(civLeaderName);
			inst.CivName:SetText(civName);

			--set the civic and tech era
			local civicEra = Locale.Lookup('LOC_GD_CIVIC_ERA') .. Locale.Lookup('LOC_' .. GameInfo.Eras[m_PlayerCivicEras[PlayerID]].EraType .. "_NAME");
			local techEra = Locale.Lookup('LOC_GD_TECH_ERA') .. Locale.Lookup('LOC_' .. GameInfo.Eras[m_PlayerTechEras[PlayerID]].EraType .. "_NAME");
			inst.CivCivicEra:SetText(civicEra);
			inst.CivTechEra:SetText(techEra);
			
			--set the era age type
			if gameEras:HasHeroicGoldenAge(PlayerID) then
				inst.EraAgeType:SetText(Locale.Lookup("LOC_ERA_PROGRESS_HEROIC_AGE"));
			elseif gameEras:HasGoldenAge(PlayerID) then
				inst.EraAgeType:SetText(Locale.Lookup("LOC_ERA_PROGRESS_GOLDEN_AGE"));
			elseif gameEras:HasDarkAge(PlayerID) then
				inst.EraAgeType:SetText(Locale.Lookup("LOC_ERA_PROGRESS_DARK_AGE"));
			else
				inst.EraAgeType:SetText(Locale.Lookup("LOC_ERA_PROGRESS_NORMAL_AGE"));
			end

			--set the Governement
			inst.CivGovernment:SetText(Locale.Lookup("LOC_" .. GameInfo.Governments[playerCulture:GetCurrentGovernment()].GovernmentType .. "_NAME"));

			--set the wonders
			--loop thru this players cites checking for wonders
			local playerCities:table = player:GetCities();
			for i, city in playerCities:Members() do
				local cityData = GetCityData( city );

				local isHasWonders :boolean = (table.count(cityData.Wonders) > 0)
				if isHasWonders then
					
					for _, wonder in ipairs(cityData.Wonders) do
						local WonderInst = inst["w_Stack"]:GetInstance();
						WonderInst.WonderName:SetText(wonder.Name);
					end
				end
				inst.WondersStack:CalculateSize();
			end
			
			local p_Wars = {};
			local p_Suezerain = {};
			local p_Allied = {};
			local p_Friends = {};
			local p_Denounced = {};

			--set diplomatic states for each civ (only shows if local player has met BOTH civs or city states)
			for ii, OtherPlayer in ipairs(players) do
				local OtherPlayerID = OtherPlayer:GetID();
				local localPlayerDiplomacy = player:GetDiplomacy();

				if (OtherPlayer:IsAlive() and (player:GetDiplomacy():HasMet(OtherPlayerID)) and (m_LocalPlayer:GetDiplomacy():HasMet(OtherPlayerID))) or (localPlayerID == OtherPlayerID) then
					-- local player has met both players, show any states between them
					if (not OtherPlayer:IsBarbarian()) and (not OtherPlayer:IsFreeCities()) then
						local playerConfig:table = PlayerConfigurations[OtherPlayerID];
						local civLeaderName = Locale.Lookup(playerConfig:GetPlayerName());
						local civName = Locale.Lookup("LOC_" .. playerConfig:GetCivilizationTypeName() .. "_NAME");
						local iPlayerDiploState = player:GetDiplomaticAI():GetDiplomaticStateIndex(OtherPlayerID);
						local eState = GameInfo.DiplomaticStates[iPlayerDiploState].Hash;
						local isPlayersAtWar = player:GetDiplomacy():IsAtWarWith(OtherPlayerID)
						local strInfo = "";

						--print("Civ State: " .. tostring(civName) .. " " ..  tostring(eState));

						-- check if players are at war
						if isPlayersAtWar then
							strInfo = Locale.Lookup('LOC_GD_AT_WAR') .. " " .. civName .. " (" .. civLeaderName .. ")";
							if (not OtherPlayer:IsMajor()) then
								strInfo = Locale.Lookup('LOC_GD_AT_WAR') .. " " .. civName;
							end
							print(strInfo);
							table.insert(p_Wars, strInfo);
						end

						-- if this is not a mojor it must be a CS get influence
						if (not OtherPlayer:IsMajor()) then
							local pPlayerInfluence:table = OtherPlayer:GetInfluence();
							local suzerainID = pPlayerInfluence:GetSuzerain();

							-- check if this player is the suzerain of this CS
							if PlayerID == suzerainID then
								strInfo = Locale.Lookup('LOC_GD_SUEZERAIN') .. " " .. civName;
								print(strInfo);
								table.insert(p_Suezerain, strInfo);
							end
						end

						if (OtherPlayer:IsMajor()) then
							if (eState == DiplomaticStates.ALLIED) then
								strInfo = Locale.Lookup('LOC_GD_ALLIED') .. " " .. civName .. " (" .. civLeaderName .. ")";
								print(strInfo);
								table.insert(p_Allied, strInfo);
							end

							if (eState == DiplomaticStates.DECLARED_FRIEND) then
								local iFriendshipTurn = localPlayerDiplomacy:GetDeclaredFriendshipTurn(OtherPlayerID);
								local iRemainingTurns = iFriendshipTurn + Game.GetGameDiplomacy():GetDenounceTimeLimit() - Game.GetCurrentGameTurn();
								strInfo = Locale.Lookup('LOC_GD_FRIENDS') .. " " .. civName .. " (" .. civLeaderName .. ") " .. tostring(iRemainingTurns) .. " " .. Locale.Lookup('LOC_GD_TURNS');
								table.insert(p_Friends, strInfo);
							end

							if (eState == DiplomaticStates.DENOUNCED) then
								--print("DENOUNCED: " .. PlayerID .. " " .. OtherPlayerID);
								local PlayerDiplomacy = player:GetDiplomacy();
								local iOurDenounceTurn = PlayerDiplomacy:GetDenounceTurn(OtherPlayerID);
								local iTheirDenounceTurn = Players[OtherPlayerID]:GetDiplomacy():GetDenounceTurn(PlayerID);
								
								if (iOurDenounceTurn >= iTheirDenounceTurn) then  
				    				iRemainingTurns = iOurDenounceTurn + GlobalParameters.DIPLOMACY_DENOUNCE_TIME_LIMIT - Game.GetCurrentGameTurn();
				    				strInfo = Locale.Lookup('LOC_GD_DENOUNCED') .. " " .. civName .. " (" .. civLeaderName .. ") " .. tostring(iRemainingTurns) .. " " .. Locale.Lookup('LOC_GD_TURNS');
									print(strInfo);
									table.insert(p_Denounced, strInfo);
				    			else
				    				iRemainingTurns = iTheirDenounceTurn + GlobalParameters.DIPLOMACY_DENOUNCE_TIME_LIMIT - Game.GetCurrentGameTurn();
				    				strInfo = Locale.Lookup('LOC_GD_DENOUNCED_BY') .. " " .. civName .. " (" .. civLeaderName .. ") " .. tostring(iRemainingTurns) .. " " .. Locale.Lookup('LOC_GD_TURNS');
									print(strInfo);
									table.insert(p_Denounced, strInfo);
				    			end
							end
						end
					end
				end
			end

			for key, value in pairs(p_Wars) do
				local DiploInst = inst["d_Stack"]:GetInstance();
				DiploInst.DiploStateRed:SetText(value);
				DiploInst.DiploStateRed:SetHide(false);
			end
			
			for key, value in pairs(p_Denounced) do
				local DiploInst = inst["d_Stack"]:GetInstance();
				DiploInst.DiploStateYellow:SetText(value);
				DiploInst.DiploStateYellow:SetHide(false);
			end

			for key, value in pairs(p_Friends) do
				local DiploInst = inst["d_Stack"]:GetInstance();
				DiploInst.DiploStateGreen:SetText(value);
				DiploInst.DiploStateGreen:SetHide(false);
			end

			for key, value in pairs(p_Allied) do
				local DiploInst = inst["d_Stack"]:GetInstance();
				DiploInst.DiploStateCyan:SetText(value);
				DiploInst.DiploStateCyan:SetHide(false);
			end

			for key, value in pairs(p_Suezerain) do
				local DiploInst = inst["d_Stack"]:GetInstance();
				DiploInst.DiploStateCyan:SetText(value);
				DiploInst.DiploStateCyan:SetHide(false);
			end

			inst.DiploStack:ReprocessAnchoring();
			inst.DiploStack:CalculateSize();

			local WonderStackHeight = inst.WondersStack:GetSizeY()+inst.WondersStack:GetOffsetY();
			local DiploStackHeight = inst.DiploStack:GetSizeY()+inst.DiploStack:GetOffsetY();
			local instHeight = inst.Content:GetSizeY();
			local BiggestStack = WonderStackHeight;

			if DiploStackHeight > WonderStackHeight then
				BiggestStack = DiploStackHeight;
			end

			if (BiggestStack > DEFAULT_DIPLO_HEIGHT) or (instHeight > DEFAULT_DIPLO_HEIGHT) then
				inst.Content:SetSizeY(BiggestStack+6);
				instHeight = inst.Content:GetSizeY();
			end
			
			if (instHeight < DEFAULT_DIPLO_HEIGHT) then
				inst.Content:SetSizeY(DEFAULT_DIPLO_HEIGHT);
			end
		end
	end

	Controls.GlobalDiploScrollPanel:ReprocessAnchoring();
	Controls.GlobalDiploScrollPanel:CalculateSize();
end

-- ===========================================================================
function OnResearchComplete(ePlayer:number, eTech:number)
		--check if the current tech completed era is above our current stored era
	if (m_Eras[m_PlayerTechEras[ePlayer]] == nil) then
		m_PlayerTechEras[ePlayer] = GameInfo.Technologies[eTech].EraType;
	elseif (m_Eras[GameInfo.Technologies[eTech].EraType] > m_Eras[m_PlayerTechEras[ePlayer]]) then
		m_PlayerTechEras[ePlayer] = GameInfo.Technologies[eTech].EraType;
	end
end

-- ===========================================================================
function OnCivicComplete(ePlayer:number, eTech:number)

	--check if the current civic completed era is above our current stored era
	if (m_Eras[m_PlayerCivicEras[ePlayer]] == nil) then
		m_PlayerCivicEras[ePlayer] = GameInfo.Civics[eTech].EraType;
	elseif (m_Eras[GameInfo.Civics[eTech].EraType] > m_Eras[m_PlayerCivicEras[ePlayer]]) then
		m_PlayerCivicEras[ePlayer] = GameInfo.Civics[eTech].EraType;
	end
end

-- ===========================================================================
function PopulateEras()
	for row in GameInfo.Eras() do
		m_Eras[row.EraType] = row.ChronologyIndex;
	end

	-- loop thru players and initilize tech and civic era
	local players = Game.GetPlayers();
	for i, player in ipairs(players) do
		local playerCulture	:table	= player:GetCulture();
		local playerTech	:table	= player:GetTechs();
		local civicDone = false;
		local techDone = false;

		for civic in GameInfo.Civics() do
			if playerCulture:HasCivic(civic.Index) then
				OnCivicComplete(player:GetID(), civic.Index)
				civicDone = true;
			end
		end

		for tech in GameInfo.Technologies() do
			if playerTech:HasTech(tech.Index) then
				OnResearchComplete(player:GetID(), tech.Index)
				techDone = true;
			end
		end

		if civicDone == false then
			m_PlayerCivicEras[player:GetID()] = 0;
		end

		if techDone == false then
			m_PlayerTechEras[player:GetID()] = 0;
		end
	end
end

-- ===========================================================================
function makeIdx(pOneID:number, pTwoID:number)
	local playerConfig:table = PlayerConfigurations[pOneID];
	local player2Config:table = PlayerConfigurations[pTwoID];

	local civName = Locale.Lookup("LOC_" .. playerConfig:GetCivilizationTypeName() .. "_NAME");
	local civName2 = Locale.Lookup("LOC_" .. player2Config:GetCivilizationTypeName() .. "_NAME");
	--print(civName..civName2)
	return civName..civName2;
end
-- ===========================================================================
function format_int(number)

  local i, j, minus, int, fraction = tostring(number):find('([-]?)(%d+)([.]?%d*)')

  -- reverse the int-string and append a comma to all blocks of 3 digits
  int = int:reverse():gsub("(%d%d%d)", "%1,")

  -- reverse the int-string back remove an optional comma and put the 
  -- optional minus and fractional part back
  return minus .. int:reverse():gsub("^,", "") .. fraction
end

-- ===========================================================================
function GetCivNameAndIcon(playerID:number, bColorUnmetPlayer:boolean)
	local civname:string, leadername:string, icon:string, portrait:string;
	local m_LocalPlayer = Players[Game.GetLocalPlayer()];
	local m_LocalPlayerID = Game.GetLocalPlayer();

	local playerConfig:table = PlayerConfigurations[playerID];

	if(playerID == m_LocalPlayerID or playerConfig:IsHuman() or m_LocalPlayer == nil or m_LocalPlayer:GetDiplomacy():HasMet(playerID)) then
		leadername = Locale.Lookup(playerConfig:GetPlayerName());
		civname = Locale.Lookup("LOC_" .. playerConfig:GetCivilizationTypeName() .. "_NAME");

		if playerID == m_LocalPlayerID or m_LocalPlayer == nil or m_LocalPlayer:GetDiplomacy():HasMet(playerID) then
			portrait = "ICON_" .. playerConfig:GetLeaderTypeName();
			icon = "ICON_" .. playerConfig:GetCivilizationTypeName();
		else
			portrait = ICON_UNKNOWN_LEADER;
			icon = ICON_UNKNOWN_CIV;
		end
	else
		--print("Unmet civ");
		leadername = bColorUnmetPlayer and LOC_UNKNOWN_CIV_COLORED or LOC_UNKNOWN_CIV;
		portrait = ICON_UNKNOWN_CIV;
		icon = ICON_UNKNOWN_CIV;
	end
	return civname, leadername, icon, portrait;
end

function ColorIcon(PlayerID, cControlIcon, cControlBacking)
	--print(PlayerID, cControlIcon, cControlBacking);
	local civName:string, civIcon:string = GetCivNameAndIcon(PlayerID, true);
	--print("CivName=".. civName);
	--print("CivIcon=".. civIcon);

	if (civIcon == "ICON_CIVILIZATION_UNKNOWN") then
		--print("Unmet civ x");
		cControlBacking:SetColor(0xFF9E9382);
		cControlIcon:SetColor(0xFFFFFFFF);
		local textureOffsetX, textureOffsetY, textureSheet = IconManager:FindIconAtlas(civIcon, 36);
		cControlIcon:SetTexture(textureOffsetX, textureOffsetY, textureSheet);
	else
		
		local textureOffsetX, textureOffsetY, textureSheet = IconManager:FindIconAtlas(civIcon, 36);
		local backColor, frontColor = UI.GetPlayerColors(PlayerID);
		cControlIcon:SetTexture(textureOffsetX, textureOffsetY, textureSheet);
		cControlIcon:SetColor(frontColor);
		cControlBacking:SetColor(backColor);
	end
end
-- ===========================================================================
--	Show / Hide
-- ===========================================================================
function Open()
	--print("Demos Beging Opening");
	View()

	if (ContextPtr:IsHidden()) then
		ContextPtr:SetHide(false);

		-- From Civ6_styles: FullScreenVignetteConsumer
		Controls.ScreenAnimIn:SetToBeginning();
		Controls.ScreenAnimIn:Play();
	else
		ContextPtr:SetHide(true);
	end
end

function Close()
	ContextPtr:SetHide(true);
end

-- ===========================================================================
--	Game Event Callbacks
-- ===========================================================================
function OnShowScreen()
	Open();
	UI.PlaySound("UI_Screen_Open");
end

-- ===========================================================================
function OnHideScreen()
	Close();
	UI.PlaySound("UI_Screen_Close");
end

-- ===========================================================================
function OnInputHandler(pInputStruct:table)
	local uiMsg = pInputStruct:GetMessageType();

	if uiMsg == KeyEvents.KeyUp then 
		local uiKey = pInputStruct:GetKey();
		if uiKey == Keys.VK_ESCAPE then
			if ContextPtr:IsHidden()==false then
				Close();
				return true;
			end
		end		
	end
	return false;
end
-- ===========================================================================

-- ===========================================================================
--	Hot Reload Related Events
-- ===========================================================================
function OnInit(isReload:boolean)
	if isReload then
		LuaEvents.GameDebug_GetValues(RELOAD_CACHE_ID);
	end
end

function OnShutdown()
	LuaEvents.GameDebug_AddValue(RELOAD_CACHE_ID, "isHidden", ContextPtr:IsHidden());
end
function OnGameDebugReturn(context:string, contextTable:table)
	if context == RELOAD_CACHE_ID and contextTable["isHidden"] ~= nil and not contextTable["isHidden"] then
		Open();
	end
end

-- ===========================================================================
--	Input Hotkey Event
-- ===========================================================================
function OnInputActionTriggered( actionId )

end

-- ===========================================================================
--	Player Turn Events
-- ===========================================================================
function OnLocalPlayerTurnBegin()
	m_isLocalPlayerTurn = true;
end

-- ===========================================================================
function OnLocalPlayerTurnEnd()
	m_isLocalPlayerTurn = false;
	if(GameConfiguration.IsHotseat()) then
		OnHideScreen();
	end
end

-- ===========================================================================
--	INIT
-- ===========================================================================
function Initialize()
	
	PopulateEras();

	ContextPtr:SetHide(true);
	ContextPtr:SetInitHandler(OnInit);
	ContextPtr:SetShutdown(OnShutdown);
	ContextPtr:SetInputHandler(OnInputHandler, true);

	-- Events
	LuaEvents.LaunchBar_OpenGlobalDiploScreen.Add( Open );
	LuaEvents.LaunchBar_CloseGlobalDiploScreen.Add( Close );

	Controls.ModalScreenTitle:SetText(Locale.ToUpper(LOC_SCREEN_TITLE));
	Controls.ModalScreenClose:RegisterCallback(Mouse.eLClick, OnHideScreen);
	Controls.ModalScreenClose:RegisterCallback( Mouse.eMouseEnter, function() UI.PlaySound("Main_Menu_Mouse_Over"); end);

	Events.LocalPlayerTurnBegin.Add(OnLocalPlayerTurnBegin);
	Events.LocalPlayerTurnEnd.Add(OnLocalPlayerTurnEnd);
	Events.CivicCompleted.Add( OnCivicComplete );
	Events.ResearchCompleted.Add( OnResearchComplete );

end
Initialize();
