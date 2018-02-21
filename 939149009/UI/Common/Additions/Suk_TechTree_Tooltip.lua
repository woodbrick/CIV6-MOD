-- ===========================================================================
--	MEMBERS
--	These are instanced for each file that adds this support file.
-- ===========================================================================
include("ToolTipHelper")
include("TechAndCivicSupport")
include("SupportFunctions")
include("Civ6Common")

local m_UnlockRowIM	= InstanceManager:new("UnlockRowInstance",	"Top", Controls.UnlockColumn)
local tModifierCache = {}

-- Look up and cache any civic modifiers we reward like envoys awarded
for tRow in GameInfo.CivicModifiers() do

	local tEntry = {}
	tEntry.Type = tRow.CivicType

	if (tEntry.Type == tRow.CivicType) then
		for modifierType in GameInfo.Modifiers() do
			if tRow.ModifierId == modifierType.ModifierId then
				tEntry.ModifierId	= modifierType.ModifierId;
				tEntry.ModifierType	= modifierType.ModifierType;
			end
		end
		for modifierArguments in GameInfo.ModifierArguments() do
			if tRow.ModifierId == modifierArguments.ModifierId then
				tEntry.ModifierValue = modifierArguments.Value;
			end
		end
	end

	tModifierCache[tRow.CivicType] = tEntry

end
---------------------------------------------------------------------
-- Suk_GetExtraIcons
---------------------------------------------------------------------
local tCachedEntries = {}

function Suk_CanEverUnlock(playerId, item)
	local has_trait = GetTraitMapForPlayer(playerId);
	return item.TraitType ~= "TRAIT_BARBARIAN" and ((item.TraitType == nil) or (has_trait == nil) or has_trait[item.TraitType]);	
end

function Suk_GetExtraIcons(playerId, sTech, bIsTech)

	if tCachedEntries[sTech] then return tCachedEntries[sTech] end

	local tResources = {}
	local tEntries = {}

	for tRow in GameInfo.Improvement_ValidTerrains() do
		if (tRow.PrereqTech == sTech or tRow.PrereqCivic == sTech) and Suk_CanEverUnlock(playerId, GameInfo.Improvements[tRow.ImprovementType]) then
			local tEntry = {}
			tEntry.BG_X, tEntry.BG_Y, tEntry.BG_Sheet = IconManager:FindIconAtlas("ICON_TECHUNLOCK_13",38)
			tEntry.Icon = "ICON_".. tRow.ImprovementType
			tEntry.Text = "[ICON_Charges]"

			table.insert(tEntries, tEntry)
		end
	end
	for tRow in GameInfo.Improvement_BonusYieldChanges() do
		if (tRow.PrereqTech == sTech or tRow.PrereqCivic == sTech) and Suk_CanEverUnlock(playerId, GameInfo.Improvements[tRow.ImprovementType]) then
			local tEntry = {}
			tEntry.BG_X, tEntry.BG_Y, tEntry.BG_Sheet = IconManager:FindIconAtlas("ICON_TECHUNLOCK_13",38)
			tEntry.Icon = "ICON_".. tRow.ImprovementType
			tEntry.Text = GameInfo.Yields[tRow.YieldType].IconString

			table.insert(tEntries, tEntry)
		end
	end
	for tRow in GameInfo.Improvement_Adjacencies() do
		local tAdj = GameInfo.Adjacency_YieldChanges[tRow.YieldChangeId]
		if (tAdj.PrereqTech == sTech or tAdj.PrereqCivic == sTech) and Suk_CanEverUnlock(playerId, GameInfo.Improvements[tRow.ImprovementType]) then
			local tEntry = {}
			tEntry.BG_X, tEntry.BG_Y, tEntry.BG_Sheet = IconManager:FindIconAtlas("ICON_TECHUNLOCK_13",38)
			tEntry.Icon = "ICON_".. tRow.ImprovementType
			tEntry.Text = GameInfo.Yields[tAdj.YieldType].IconString

			table.insert(tEntries, tEntry)
		end
	end	
	for tRow in GameInfo.Resource_Harvests() do
		if (tRow.PrereqTech == sTech or tRow.PrereqCivic == sTech) and not(tResources[tRow.ResourceType]) then
			local tEntry = {}
			tEntry.BG_X, tEntry.BG_Y, tEntry.BG_Sheet = IconManager:FindIconAtlas("ICON_TECHUNLOCK_13",38)
			tEntry.Icon = "ICON_".. tRow.ResourceType
			tEntry.Text = "[ICON_Charges]"

			table.insert(tEntries, tEntry)
			tResources[tRow.ResourceType] = true		
		end
	end
	for tRow in GameInfo.Features() do
		if tRow.RemoveTech == sTech or tRow.AddCivic == sTech then
			local tEntry = {}
			tEntry.BG_X, tEntry.BG_Y, tEntry.BG_Sheet = IconManager:FindIconAtlas("ICON_TECHUNLOCK_13",38)
			tEntry.Icon = "ICON_".. tRow.FeatureType
			tEntry.Text = "[ICON_Charges]"

			table.insert(tEntries, tEntry)	
		end
	end
	if bIsTech and (GameInfo.Technologies[sTech].EmbarkAll or GameInfo.Technologies[sTech].EmbarkUnitType) then
		local tEntry = {}
		tEntry.BG_X, tEntry.BG_Y, tEntry.BG_Sheet = IconManager:FindIconAtlas("ICON_TECHUNLOCK_13",38)
		tEntry.Icon = "ICON_UNITOPERATION_EMBARK"
		tEntry.Text = ""

		table.insert(tEntries, tEntry)
	end

	tCachedEntries[sTech] = tEntries
	return tEntries
end
---------------------------------------------------------------------
---------------------------------------------------------------------
local tRows = {}

function RealiseEnhancedTechTooltip(iPlayer, sTech)
	local pPlayer = Players[iPlayer]
	local tTech = GameInfo.Technologies[sTech] or GameInfo.Civics[sTech]
	local bIsTech = GameInfo.Types[tTech.Hash].Kind == "KIND_TECH"
	local tData
	local sYield

	if bIsTech then
		pPlayerTech = pPlayer:GetTechs()
		Controls.IconCanBeBoosted:SetTexture("ResearchPanel_BoostIconAvailable.dds")
		Controls.IconHasBeenBoosted:SetTexture("ResearchPanel_BoostIconBoosted.dds")
		Controls.BoostMeter:SetColorByName("Science")
		Controls.ProgressMeter:SetColorByName("Science")
		tData = GetResearchData(iPlayer, pPlayerTech, tTech)
		sYield = "[ICON_Science]"
	else
		pPlayerTech = pPlayer:GetCulture()
		Controls.IconCanBeBoosted:SetTexture("CivicPanel_BoostIconAvailable.dds")
		Controls.IconHasBeenBoosted:SetTexture("CivicPanel_BoostIconBoosted.dds")
		Controls.BoostMeter:SetColorByName("COLOR_FLOAT_CULTURE")
		Controls.ProgressMeter:SetColorByName("COLOR_FLOAT_CULTURE")		
		tData = GetCivicData(iPlayer, pPlayerTech, tTech)
		sYield = "[ICON_Culture]"
	end

	RealizeMeterAndBoosts(Controls, tData)

	Controls.Suk_TechTree_Icon:SetIcon("ICON_" .. sTech)

	Controls.TechName:SetText(Locale.ToUpper(tData.Name))
	local iCost = (tData.Cost or tData.ResearchCost)
	Controls.ProgressString:SetText(Locale.ToNumber(iCost * tData.Progress, "#,###.#") .. "/" .. iCost .. sYield)
	local sDesc = tTech.Description
	Controls.DescriptionLabel:SetHide(not(sDesc))
	if sDesc then
		Controls.DescriptionLabel:LocalizeAndSetText(sDesc)
	end

	if not(sDesc) and not(tData.Boostable) then Controls.TechInfoContainer:SetHide(true) else Controls.TechInfoContainer:SetHide(false) end

	m_UnlockRowIM:ResetInstances()
	for i,v in ipairs(tRows) do
		v:DestroyInstances()
	end
	tRows = {}

	local tUnlockables
	if bIsTech then
		tUnlockables = GetUnlockablesForTech_Cached(sTech, iPlayer)
	else
		tUnlockables = GetUnlockablesForCivic_Cached(sTech, iPlayer)
	end
	local tEntries = Suk_GetExtraIcons(iPlayer, sTech, bIsTech)
	local iMaxPerRow = 5
	local iRow = 0

	if (tUnlockables and table.count(tUnlockables) > 0) or (tEntries and table.count(tEntries) > 0) then

		local tRow = m_UnlockRowIM:GetInstance(); iRow = iRow + 1;
		local m_UnlockIM
		if tRows[iRow] then 
			m_UnlockIM = tRows[iRow] 
		else 
			m_UnlockIM = InstanceManager:new("UnlockInstance",	"Top", tRow.UnlockRow);
			tRows[iRow] = m_UnlockIM
		end
		local m_UnlockIM	= InstanceManager:new("UnlockInstance",	"Top", tRow.UnlockRow); table.insert(tRows, m_UnlockIM)
		local iIconsThisRow = 0

		for i,v in ipairs(tUnlockables) do

			-------------------------------------------
			-- Max Icon, Begin New Row
			-------------------------------------------
			if iIconsThisRow >= iMaxPerRow then
				tRow.UnlockRow:CalculateSize()
				tRow.UnlockRow:ReprocessAnchoring()

				tRow = m_UnlockRowIM:GetInstance(); iRow = iRow + 1;
				if tRows[iRow] then 
					m_UnlockIM = tRows[iRow] 
				else 
					m_UnlockIM = InstanceManager:new("UnlockInstance",	"Top", tRow.UnlockRow);
					tRows[iRow] = m_UnlockIM
				end
				m_UnlockIM	= InstanceManager:new("UnlockInstance",	"Top", tRow.UnlockRow); table.insert(tRows, m_UnlockIM)
				iIconsThisRow = 0
			end
			-------------------------------------------
			-------------------------------------------

			local sName = v[1]
			local sPediaKey = v[3]
			local tInstance = m_UnlockIM:GetInstance(); iIconsThisRow = iIconsThisRow + 1
			
			local icon = GetUnlockIcon(sName)		
			tInstance.Icon:SetIcon("ICON_"..sName)
			tInstance.Icon:SetHide(false)
			tInstance.Info:SetText("")	
			 
			local textureOffsetX, textureOffsetY, textureSheet = IconManager:FindIconAtlas(icon,38)
			if textureSheet ~= nil then
				tInstance.UnlockIcon:SetTexture(textureOffsetX, textureOffsetY, textureSheet)
			end

			local sToolTip = ToolTipHelper.GetToolTip(sName, playerID)
			tInstance.UnlockIcon:LocalizeAndSetToolTip(sToolTip)
			if(not IsTutorialRunning()) then
				tInstance.UnlockIcon:RegisterCallback(Mouse.eRClick, function() 
					LuaEvents.OpenCivilopedia(sPediaKey)
				end)
			end
		end

		-- My Custom Entries
		for i,tEntry in ipairs(tEntries) do

			-------------------------------------------
			-- Max Icon, Begin New Row
			-------------------------------------------
			if iIconsThisRow >= iMaxPerRow then
				tRow.UnlockRow:CalculateSize()
				tRow.UnlockRow:ReprocessAnchoring()

				tRow = m_UnlockRowIM:GetInstance(); iRow = iRow + 1;
				if tRows[iRow] then 
					m_UnlockIM = tRows[iRow] 
				else 
					m_UnlockIM = InstanceManager:new("UnlockInstance",	"Top", tRow.UnlockRow);
					tRows[iRow] = m_UnlockIM
				end
				m_UnlockIM	= InstanceManager:new("UnlockInstance",	"Top", tRow.UnlockRow); table.insert(tRows, m_UnlockIM)
				iIconsThisRow = 0
			end
			-------------------------------------------
			-------------------------------------------
			local tInstance = m_UnlockIM:GetInstance(); iIconsThisRow = iIconsThisRow + 1

			tInstance.UnlockIcon:SetTexture(tEntry.BG_X, tEntry.BG_Y, tEntry.BG_Sheet)
			tInstance.Icon:SetIcon(tEntry.Icon)
			tInstance.Info:SetText(tEntry.Text)	
		end

		tRow.UnlockRow:CalculateSize()
		tRow.UnlockRow:ReprocessAnchoring()
		Controls.UnlockColumn:CalculateSize()
		Controls.UnlockColumn:ReprocessAnchoring()
	end
	Controls.TechInfoStack:CalculateSize()
	Controls.TechInfoStack:ReprocessAnchoring()

	Controls.CivToolTipAlpha:SetToBeginning()
	--Controls.CivToolTipSlide:SetToBeginning()
	Controls.CivToolTipAlpha:Play();
	--Controls.CivToolTipSlide:Play();	
end

LuaEvents.Suk_RealiseEnhancedTechTooltip.Add(RealiseEnhancedTechTooltip)

function HideEnhancedTechTooltip()
	Controls.CivToolTipAlpha:Reverse()
end
LuaEvents.Suk_HideEnhancedTechTooltip.Add(HideEnhancedTechTooltip)

function Initialise()
	Controls.CivToolTipAlpha:ChangeParent(ContextPtr:LookUpControl("/InGame/HUD"))
end
Events.LoadScreenClose.Add(Initialise)
if ContextPtr:LookUpControl("/InGame/MinimapPanel/OptionsStack") then Initialise() end