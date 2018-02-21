-- Suk_ScreenshotMode
-- Author: Sukrit
-- DateCreated: 8/30/2017 9:18:55 PM
-- ===========================================================================
--	Enter/Exit ScreenshotMode
-- ===========================================================================
-- Data
-----------------------------------------------------------
m_bIsScreenshotMode = false
m_iCurrentX = 0
m_iCurrentY = 0

ExposedMembers.tStoredStates = ExposedMembers.tStoredStates or {} 
local tContextsToHide = {
		"/InGame/WorldViewControls",
		"/InGame/HUD",
		"/InGame/PartialScreens",
		"/InGame/Screens",
		"/InGame/TopLevelHUD",
		"/InGame/WorldPopups",
		"/InGame/Civilopedia",
	}

local tContextsToHide_2 = {
		"/InGame/WorldViewIconsManager",
		"/InGame/DistrictPlotIconManager",
		"/InGame/PlotInfo",
		"/InGame/UnitFlagManager",
		"/InGame/TourismBannerManager",
		"/InGame/MapPinManager",
		"/InGame/SelectedUnit",
		"/InGame/SelectedMapPinContainer",
		"/InGame/SelectedUnitContainer",
		"/InGame/WorldViewPlotMessages",

		"/InGame/HUD",
		"/InGame/PartialScreens",
		"/InGame/Screens",
		"/InGame/TopLevelHUD",
		"/InGame/WorldPopups",
		"/InGame/Civilopedia",
	}	
-----------------------------------------------------------
-- Functions
-----------------------------------------------------------
function EnterScreenshotMode(bLeft)

	ExposedMembers.tStoredStates = {}

	print(bLeft)

	if bLeft then
		for i,sName in ipairs(tContextsToHide) do
			ExposedMembers.tStoredStates[sName] = ContextPtr:LookUpControl(sName):IsHidden()
			ContextPtr:LookUpControl(sName):SetHide(true)
		end
	else
		for i,sName in ipairs(tContextsToHide_2) do
			ExposedMembers.tStoredStates[sName] = ContextPtr:LookUpControl(sName):IsHidden()
			ContextPtr:LookUpControl(sName):SetHide(true)
		end
	end

	m_bIsScreenshotMode = true
end

function ExitScreenshotMode()
	for sName, bHidden in pairs(ExposedMembers.tStoredStates) do
		ContextPtr:LookUpControl(sName):SetHide(bHidden)
	end

	if m_bIsScreenshotMode then

		m_iCurrentX = 0
		m_iCurrentY = 0
		UI.SpinMap( 0.0, 0.0 )

		m_bIsScreenshotMode = false
		return true
	end
end

Controls.ScreenshotButton:RegisterCallback( Mouse.eLClick, function() EnterScreenshotMode(true) end )
Controls.ScreenshotButton:RegisterCallback( Mouse.eRClick, function() EnterScreenshotMode(false) end )
Controls.ScreenshotButton:RegisterCallback( Mouse.eMouseEnter, function() UI.PlaySound("Main_Menu_Mouse_Over") end)

-- ===========================================================================
--	InputHandler
-- ===========================================================================
-- Default Handlers
-----------------------------------------------------------
function DefaultKeyUpHandler( pInputStruct )

	local uiKey	= pInputStruct:GetKey()
	if( uiKey == Keys.VK_ESCAPE ) then
		if m_bIsScreenshotMode then
			if ExitScreenshotMode() then return true end
		end
	end	
	if uiKey == Keys.VK_ALT then
		m_bIsAltDown = false
		if m_bIsScreenshotMode then 

			if m_isMouseDownInWorld then
				local x, y = UIManager:GetNormalizedMousePos()
				m_iCurrentX = m_iCurrentX + m_dragStartX - x
				m_iCurrentY = m_iCurrentY + m_dragStartY - y
			end

			return true
		end
	end

	return false
end

function DefaultKeyDownHandler( pInputStruct )

	local uiKey	= pInputStruct:GetKey()
	if uiKey == Keys.VK_ALT then
		m_bIsAltDown = true
		if m_bIsScreenshotMode then return true end
	end

	return false
end

function OnMouseStart( pInputStruct)

	if not m_bIsScreenshotMode then return end
	if not m_bIsAltDown then return end

	m_dragStartX, m_dragStartY						= UIManager:GetNormalizedMousePos()
	m_isMouseDownInWorld = true
	m_isMouseDragging = true

	return true
end

function OnMouseEnd(pInputStruct)

	if not m_bIsScreenshotMode then return end

	if m_bIsAltDown then
		local x, y = UIManager:GetNormalizedMousePos()
		m_iCurrentX = m_iCurrentX + m_dragStartX - x
		m_iCurrentY = m_iCurrentY + m_dragStartY - y
	end

	m_dragStartX		= 0
	m_dragStartY		= 0	

	if m_isMouseDragging then
		m_isMouseDragging = false
	end
	m_isMouseDownInWorld = false
	return true
end

function OnMouseMove(pInputStruct)
	if not m_isMouseDownInWorld then
		return false
	end

	if m_isMouseDragging then
		if m_bIsAltDown and m_bIsScreenshotMode then

			local x, y = UIManager:GetNormalizedMousePos()
			UI.SpinMap( m_iCurrentX + m_dragStartX - x, m_iCurrentY + m_dragStartY - y  )

			return true
		end
	end

	return false
end
-----------------------------------------------------------
-- InputHandler
-----------------------------------------------------------
DefaultMessageHandler = {}
DefaultMessageHandler[KeyEvents.KeyUp]													= DefaultKeyUpHandler
DefaultMessageHandler[KeyEvents.KeyDown]												= DefaultKeyDownHandler
DefaultMessageHandler[MouseEvents.LButtonDown]											= OnMouseStart
DefaultMessageHandler[MouseEvents.LButtonUp]											= OnMouseEnd
DefaultMessageHandler[MouseEvents.MouseMove]											= OnMouseMove

function OnInputHandler(pInputStruct)
	local uiMsg = pInputStruct:GetMessageType()
	local isHandled = false

	if DefaultMessageHandler[uiMsg] then
		isHandled = DefaultMessageHandler[uiMsg](pInputStruct)
	end
	return isHandled
end
-- ===========================================================================
--	Initialise
-- ===========================================================================
function Initialise()
	if not ExposedMembers.Suk_ScreenshotMode then ExposedMembers.Suk_ScreenshotMode = {} end
	for i,pContainers in ipairs(ExposedMembers.Suk_ScreenshotMode) do pContainers:SetHide(true) end
	ExposedMembers.Suk_ScreenshotMode = {}

	Controls.ScreenshotButtonContainer:ChangeParent(ContextPtr:LookUpControl("/InGame/MinimapPanel/OptionsStack"))
	ContextPtr:LookUpControl("/InGame/MinimapPanel/OptionsStack"):CalculateSize()
	ContextPtr:LookUpControl("/InGame/MinimapPanel/OptionsStack"):ReprocessAnchoring()
	table.insert(ExposedMembers.Suk_ScreenshotMode, Controls.ScreenshotButtonContainer)

	ContextPtr:SetInputHandler( OnInputHandler, true )
end
Events.LoadScreenClose.Add(Initialise)
if ContextPtr:LookUpControl("/InGame/MinimapPanel/OptionsStack") then Initialise() end
-- ===========================================================================
-- ===========================================================================