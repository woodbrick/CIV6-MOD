--==========================================================================================================================
-- Author: Sukritact
--==========================================================================================================================
print("Suk_Ingolfur_CoreFunctions Loaded")
--==========================================================================================================================
-- UTILITY FUNCTIONS
--==========================================================================================================================
-- Credits to Chrisy for this function
--------------------------------------------------------------
function GetPlayersWithTrait(sTrait)
	local tValid = {}
	for k, v in pairs(PlayerManager.GetWasEverAliveIDs()) do
		local leaderType = PlayerConfigurations[v]:GetLeaderTypeName()
		for trait in GameInfo.LeaderTraits() do
			if trait.LeaderType == leaderType and trait.TraitType == sTrait then 
				tValid[v] = true 
			end
		end
		if not tValid[v] then
			local civType = PlayerConfigurations[v]:GetCivilizationTypeName()
			for trait in GameInfo.CivilizationTraits() do
				if trait.CivilizationType == civType and trait.TraitType == sTrait then 
					tValid[v] = true 
				end
			end
		end
	end
	return tValid
end
--------------------------------------------------------------
-- Grab a random name
--------------------------------------------------------------
local tMaleNames = {}
for i,tRow in ipairs(DB.Query("SELECT CitizenName FROM CivilizationCitizenNames WHERE Female = 0 AND CivilizationType = 'CIVILIZATION_SUK_ICELAND'")) do
	table.insert(tMaleNames, Locale.Lookup(tRow.CitizenName))
	--print(Locale.Lookup(tRow.CitizenName))
end

local tFemaleNames = {}
for i,tRow in ipairs(DB.Query("SELECT CitizenName FROM CivilizationCitizenNames WHERE Female = 1 AND CivilizationType = 'CIVILIZATION_SUK_ICELAND'")) do
	table.insert(tFemaleNames, Locale.Lookup(tRow.CitizenName))
	--print(Locale.Lookup(tRow.CitizenName))
end
	--------------------------------------------------------------
	-- OMG ICELAND, WHY ARE YOUR GENITIVES NOT JUST +S ALL THE TIME?
	-- THIS IS WHY I STUDIED SWEDISH, SO MUCH SIMPLER
	--------------------------------------------------------------
local tMaleGenitiveNames = {}
for i,tRow in ipairs(DB.Query("SELECT CitizenName FROM CivilizationCitizenNames WHERE Female = 0 AND CivilizationType = 'CIVILIZATION_SUK_ICELAND'")) do
	table.insert(tMaleGenitiveNames, Locale.Lookup(tRow.CitizenName .. "_GENITIVE"))
	--print(Locale.Lookup(tRow.CitizenName .. "_GENITIVE"))
end
local tFemaleGenitiveNames = {}
for i,tRow in ipairs(DB.Query("SELECT CitizenName FROM CivilizationCitizenNames WHERE Female = 1 AND CivilizationType = 'CIVILIZATION_SUK_ICELAND'")) do
	table.insert(tFemaleGenitiveNames, Locale.Lookup(tRow.CitizenName .. "_GENITIVE"))
	--print(Locale.Lookup(tRow.CitizenName .. "_GENITIVE"))
end

function GetIcelandicName()
	local bMale			= math.random(0,1) == 1
	local bPatronymic	= math.random(0,1) == 1
	
	local sName
	local sParent
	local sSuffix		= bMale and "son" or "dóttir"

	if bMale then
		sName = tMaleNames[math.random(1,#tMaleNames)]
	else
		sName = tFemaleNames[math.random(1,#tFemaleNames)]
	end

	if bPatronymic then
		sParent = tMaleGenitiveNames[math.random(1,#tMaleNames)]
	else
		sParent = tFemaleGenitiveNames[math.random(1,#tFemaleNames)]
	end

	return (sName .. " " .. sParent .. sSuffix)
end

function round(num, numDecimalPlaces)
  local mult = 10^(numDecimalPlaces or 0)
  return math.floor(num * mult + 0.5) / mult
end

local Save
local Load
local GetEra
-- --==========================================================================================================================
-- -- CORE FUNCTIONS
-- --==========================================================================================================================
-- -- Historic Moments also provide [ICON_GreatWriter] Great Writer Points.
-- --------------------------------------------------------------
local sSagaTrait = "TRAIT_CIVILIZATION_SUK_SAGAS_OF_THE_ICELANDERS"
local tSagaPlayers = GetPlayersWithTrait(sSagaTrait)
local iWriter = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_WRITER"].Index
local iMod = (GameInfo.GameSpeeds[GameConfiguration.GetGameSpeedType()].CostMultiplier)/100

local HISTORIC_MOMENT_HASH = DB.MakeHash("NOTIFICATION_PRIDE_MOMENT_RECORDED");
local iNotificationDuration = 5

function OnPlayerTurnActivated(iPlayer)
	if not tSagaPlayers[iPlayer] then return end

	local pPlayer			= Players[iPlayer]
	local pGameEras			= GetEra()
	local iPreviousScore	= Load(sSagaTrait .. iPlayer) or 0
	local iCurrentScore		= pGameEras:GetPlayerCurrentScore(iPlayer) or 0
	local iDeltaScore		= iCurrentScore - iPreviousScore

	--print(iPlayer, iPreviousScore, iCurrentScore, iDeltaScore)
	if iDeltaScore > 0 then

		local iRewardMod = 1 + (pPlayer:GetEra()/2)
		local iReward = round(iDeltaScore * iRewardMod * iMod, 2)
		pPlayer:GetGreatPeoplePoints():ChangePointsTotal(iWriter, iReward)

		if iPlayer == Game.GetLocalPlayer() then
			LuaEvents.Custom_StatusMessage(Locale.Lookup("LOC_TRAIT_CIVILIZATION_SUK_SAGAS_OF_THE_ICELANDERS_NOTIFICATION", GetIcelandicName(), iReward), iNotificationDuration, ReportingStatusTypes.DEFAULT)
		end
	end

	Save(sSagaTrait .. iPlayer, iCurrentScore)
end

function OnProcessNotification(playerID, notificationID, activatedByUser)

	if not tSagaPlayers[playerID] then return end

	local pNotification = NotificationManager.Find(playerID, notificationID);
	if pNotification and pNotification:GetType() == HISTORIC_MOMENT_HASH then
		OnPlayerTurnActivated(playerID)
	end
end
-- --==========================================================================================================================
-- -- Init Sequence
-- --==========================================================================================================================
function Initialise()
	Save = Game.SetProperty
	Load = Game.GetProperty
	GetEra = ExposedMembers.Suk_Ingolfur_Utils.Era 

	GameEvents.PlayerTurnStarted.Add(OnPlayerTurnActivated)
	Events.NotificationActivated.Add(OnProcessNotification)

	local tPlayers = PlayerManager.GetAliveMajors()
	for i, pPlayer in ipairs(tPlayers) do
		local iPlayer = pPlayer:GetID()
		OnPlayerTurnActivated(iPlayer)
	end

	print("Suk_Ingolfur_CoreFunctions Initialised")
end

LuaEvents.Suk_Ingolfur_Utils.Add(Initialise)
-- --------------------------------------------------------------
-- -- Credits to LeeS for these functions
-- --------------------------------------------------------------
-- function PlaceBuildingInCityCenter(pCity, iBuilding, bRepairPillaged)
-- 	local bFixIfPillaged = ((bRepairPillaged ~= nil) and bRepairPillaged or false)
-- 	local iCityPlotIndex = Map.GetPlot(pCity:GetX(), pCity:GetY()):GetIndex()
-- 	if not pCity:GetBuildings():HasBuilding(iBuilding) then
-- 		--pCity:GetBuildQueue():CreateIncompleteBuilding(iBuilding, iCityPlotIndex, 100)
-- 		WorldBuilder.CityManager():CreateBuilding(pCity, GameInfo.Buildings[iBuilding].BuildingType, 100)
-- 	else
-- 		if (bFixIfPillaged == true) then
-- 			if pCity:GetBuildings():IsPillaged(iBuilding) then
-- 				pCity:GetBuildings():SetPillaged(iBuilding, false)
-- 			end
-- 		end
-- 	end
-- end

-- function RemoveBuildingFromCityCenter(pCity, iBuilding)
-- 	pCity:GetBuildings():RemoveBuilding(iBuilding)
-- end
-- --==========================================================================================================================
-- -- CORE FUNCTIONS
-- --==========================================================================================================================
-- -- You may build two Lawspeakers per Palace or Government Plaza Building you own.
-- --------------------------------------------------------------

-- local sLawspeakerTrait = "TRAIT_CIVILIZATION_UNIT_SUK_LAWSPEAKER"
-- local tLawspeakerPlayers = GetPlayersWithTrait(sLawspeakerTrait)

-- local sLawspeaker = "UNIT_SUK_LAWSPEAKER"
-- local sLawspeakerDummy = "BUILDING_SUK_LAWSPEAKER"
-- local iLawspeakerPerBuilding = 2

-- local tValidBuildings = DB.Query("SELECT BuildingType FROM Buildings WHERE BuildingType = 'BUILDING_PALACE' OR PrereqDistrict = 'DISTRICT_THEATER'")
-- for i,v in ipairs(tValidBuildings) do
-- 	tValidBuildings[i].Index = GameInfo.Buildings[v.BuildingType].Index
-- end

-- -----------------------------

-- function UpdateLawspeakerDummies(iPlayer)

-- 	if not tLawspeakerPlayers[iPlayer] then return end

-- 	print("Checking For Lawspeakers")

-- 	local pPlayer = Players[iPlayer]

-- 	local iCount = 0
-- 	local tUnits = pPlayer:GetUnits()
-- 	for _, pUnit in tUnits:Members() do
-- 		if sLawspeaker == GameInfo.Units[pUnit:GetType()].UnitType then
-- 			iCount = iCount + 1
-- 		end
-- 	end

-- 	local iBuildingCount = 0
-- 	local bHasDummy = false
-- 	local tCities = pPlayer:GetCities()
-- 	for _, pCity in tCities:Members() do
-- 		local pBuildings = pCity:GetBuildings()
-- 		for i, tRow in ipairs(tValidBuildings) do

-- 			print(tRow.BuildingType, tRow.Index, pBuildings:HasBuilding(tRow.Index), pBuildings:IsPillaged(tRow.Index))

-- 			if pBuildings:HasBuilding(tRow.Index) and not pBuildings:IsPillaged(tRow.Index) then
-- 				iBuildingCount = iBuildingCount + 1
-- 			end
-- 		end

-- 		bHasDummy = pBuildings:HasBuilding(GameInfo.Buildings[sLawspeakerDummy].Index)
-- 	end

-- 	local iMaxLawspeakers = iBuildingCount * iLawspeakerPerBuilding
-- 	local bShouldHaveDummy = iCount < iMaxLawspeakers

-- 	print(iBuildingCount, iMaxLawspeakers, iCount, bShouldHaveDummy)

-- 	if (bHasDummy ~= bShouldHaveDummy) then
-- 		for _, pCity in tCities:Members() do
-- 			if bShouldHaveDummy then
-- 				PlaceBuildingInCityCenter(pCity, GameInfo.Buildings[sLawspeakerDummy].Index)
-- 			else
-- 				RemoveBuildingFromCityCenter(pCity, GameInfo.Buildings[sLawspeakerDummy].Index)
-- 			end
-- 		end
-- 	end
-- end

-- Events.CityMadePurchase.Add(UpdateLawspeakerDummies)
-- Events.CityProductionCompleted.Add(UpdateLawspeakerDummies)
-- GameEvents.PlayerTurnStarted.Add(UpdateLawspeakerDummies)
-- Events.UnitRemovedFromMap.Add(UpdateLawspeakerDummies)
--==========================================================================================================================
--==========================================================================================================================