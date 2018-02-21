-- ===========================================================================
--	Plot information 
--	Handles: plot purchasing, resources, etc...
-- ===========================================================================
include("InstanceManager")
include("SupportFunctions")
include("Civ6Common") -- AutoSizeGridButton

-- ===========================================================================
--	CONSTANTS
-- ===========================================================================
local CITIZEN_BUTTON_HEIGHT		= 64
local PADDING_SWAP_BUTTON		= 24
local YIELD_NUMBER_VARIATION	= "Yield_Variation_"
local YIELD_VARIATION_MANY		= "Yield_Variation_Many"
local YIELD_VARIATION_MAP		= {
	YIELD_FOOD			= "Yield_Food_",
	YIELD_PRODUCTION	= "Yield_Production_",
	YIELD_GOLD			= "Yield_Gold_",
	YIELD_SCIENCE		= "Yield_Science_",
	YIELD_CULTURE		= "Yield_Culture_",
	YIELD_FAITH			= "Yield_Faith_",
}
local CITY_CENTER_DISTRICT_INDEX = GameInfo.Districts["DISTRICT_CITY_CENTER"].Index
-- ===========================================================================
--	MEMBERS
-- ===========================================================================
local m_PlotIM				= InstanceManager:new("InfoInstance",	"Anchor", Controls.PlotInfoContainer)
local m_uiWorldMap			= {}
local m_uiCitizens			= {}	-- Citizens showing
local m_GrowthPlot					-- GrowthPlot
local m_YieldPlots
-- ===========================================================================
function DisplayGrowthTile(pCity)
	if pCity ~= nil then
		local cityCulture = pCity:GetCulture()
		if cityCulture ~= nil then
			local newGrowthPlot = cityCulture:GetNextPlot()
			if(newGrowthPlot ~= -1 and newGrowthPlot ~= m_GrowthPlot) then
				m_GrowthPlot = newGrowthPlot
				
				local cost				= cityCulture:GetNextPlotCultureCost()
				local currentCulture	= cityCulture:GetCurrentCulture()
				local currentYield		= cityCulture:GetCultureYield()
				local currentGrowth		= math.max(math.min(currentCulture / cost, 1.0), 0)
				local nextTurnGrowth	= math.max(math.min((currentCulture + currentYield) / cost, 1.0), 0)

				UILens.SetLayerGrowthHex(LensLayers.PURCHASE_PLOT, Game.GetLocalPlayer(), m_GrowthPlot, 1, "GrowthHexBG")
				UILens.SetLayerGrowthHex(LensLayers.PURCHASE_PLOT, Game.GetLocalPlayer(), m_GrowthPlot, nextTurnGrowth, "GrowthHexNext")
				UILens.SetLayerGrowthHex(LensLayers.PURCHASE_PLOT, Game.GetLocalPlayer(), m_GrowthPlot, currentGrowth, "GrowthHexCurrent")

				local turnsRemaining = cityCulture:GetTurnsUntilExpansion()
				Controls.TurnsLeftDescription:SetText(Locale.ToUpper(Locale.Lookup("LOC_HUD_CITY_TURNS_UNTIL_BORDER_GROWTH", turnsRemaining)))
				Controls.TurnsLeftLabel:SetText(turnsRemaining)
				Controls.GrowthHexStack:CalculateSize()
				m_GrowthHexTextWidth = Controls.GrowthHexStack:GetSizeX()

				local plotX, plotY = Map.GetPlotLocation(m_GrowthPlot)
				local worldX, worldY, worldZ = UI.GridToWorld(plotX, plotY)
				Controls.GrowthHexAnchor:SetWorldPositionVal(worldX, worldY+15, worldZ)

				Controls.GrowthHexAnchor:SetHide(false)
				Controls.GrowthHexAlpha:SetToBeginning()
				Controls.GrowthHexAlpha:Play()
			end
		end
	end
end
-- ===========================================================================
-- ===========================================================================
function ShowCityYields(tPlots)

	m_YieldPlots = tPlots
	local yields = {}

	for _, plotId in ipairs(tPlots) do
		local plot = Map.GetPlotByIndex(plotId)
		for row in GameInfo.Yields() do
			local yieldAmt = plot:GetYield(row.Index)
			if yieldAmt > 0 then
				table.insert(yields, plotId)
			end			
		end			
	end

	UILens.SetLayerHexesArea(LensLayers.CITY_YIELDS, Game.GetLocalPlayer(), yields)
	UILens.ToggleLayerOn(LensLayers.CITY_YIELDS)	
end
-- ===========================================================================
--	Obtain an existing instance of plot info or allocate one if it doesn't
--	already exist.
--	plotIndex	Game engine index of the plot
-- ===========================================================================
function GetInstanceAt(plotIndex)
	local pInstance = m_uiWorldMap[plotIndex]
	if pInstance == nil then
		pInstance = m_PlotIM:GetInstance()
		m_uiWorldMap[plotIndex] = pInstance
		local worldX, worldY = UI.GridToWorld(plotIndex)
		pInstance.Anchor:SetWorldPositionVal(worldX, worldY, 20)
		pInstance.Anchor:SetHide(false)
	end
	return pInstance
end

-- ===========================================================================
function ReleaseInstanceAt(plotIndex)
	local pInstance = m_uiWorldMap[plotIndex]
	if pInstance ~= nil then
		pInstance.Anchor:SetHide(true)
		m_uiWorldMap[plotIndex] = nil
	end
end
-- ===========================================================================
-- ===========================================================================
function ShowCitizens(iPlayer, iCity)

	if iPlayer ~= Game.GetLocalPlayer() then return end
	if UI.GetInterfaceMode() == InterfaceModeTypes.CITY_MANAGEMENT then return end -- Check to see if a city is selected

	local pPlayer = Players[iPlayer]
	local pCity =  pPlayer:GetCities():FindID(iCity)
	local tPlots = Map.GetCityPlots():GetPurchasedPlots(pCity)
	local pCitizens = pCity:GetCitizens()	

	if tPlots ~= nil and (table.count(tPlots) > 0) then

		for i,iPlot in pairs(tPlots) do
			local pPlot	= Map.GetPlotByIndex(iPlot)
			local iX	= pPlot:GetX()
			local iY	= pPlot:GetY()
			bIsPlotWorked = pCitizens:IsPlotWorked(iX,iY)

			if bIsPlotWorked then
				local iIndex = pPlot:GetIndex()
				local pInstance = GetInstanceAt(iIndex)
				pInstance.CitizenButton:SetTextureOffsetVal(0, CITIZEN_BUTTON_HEIGHT*4)

				pInstance.CitizenButtonAnim:SetToBeginning()
				pInstance.CitizenButtonAnim:Play()
			end
		end
	end

	DisplayGrowthTile(pCity)
	ShowCityYields(tPlots)
end
LuaEvents.CityBannerButton_OnEnter.Add(ShowCitizens)
-- ===========================================================================
-- ===========================================================================
function HideCitizens()
	if UI.GetInterfaceMode() == InterfaceModeTypes.CITY_MANAGEMENT then return end -- Check to see if a city is selected

	for iIndex, pInstance in pairs(m_uiWorldMap) do
		ReleaseInstanceAt(iIndex)
	end
	if m_GrowthPlot then 
		UILens.ClearHex(LensLayers.PURCHASE_PLOT, m_GrowthPlot)
		Controls.GrowthHexAnchor:SetHide(true)
		m_GrowthPlot = nil
	end
	if m_YieldPlots then
		UILens.ClearLayerHexes(LensLayers.CITY_YIELDS)
		m_YieldPlots = nil
	end
	--UILens.ToggleLayerOff(LensLayers.CITY_YIELDS)
end
LuaEvents.CityBannerButton_OnExit.Add(HideCitizens)
-- ===========================================================================
-- ===========================================================================