local addon, ns = ...

local core = Dark.core
local style = core.style
local layout = core.layout 
local events = core.events.new()

local blizzardItems = { 
	--buttons:
	MiniMapTracking = true,
	MiniMapVoiceChatFrame = true,
	MiniMapWorldMapButton = true,
	QueueStatusMinimapButton = true,
	MinimapZoomIn = true,
	MinimapZoomOut = true,
	MiniMapMailFrame = true,
	MiniMapBattlefieldFrame = true,
	GameTimeFrame = true,
	FeedbackUIButton = true,

	--frames:
	MinimapBackdrop = true,
	TimeManagerClockButton = true,
}

ns.features.add(function(model)

	local container = CreateFrame("Frame", nil, UIParent)
	model.buttonContainer = container

	container:SetPoint("LEFT", model.map, "LEFT", 0, 0)
	container:SetPoint("TOPRIGHT", model.notificationContainer, "BOTTOMRIGHT", 0, -ns.config.spacing)
	container:SetHeight(20)

	style.applyShadowTo(container)

	layout.init(container, {
		wrap = true,
		autosize = true,
	})

	local processButton = function(button)

		button:RegisterForDrag(nil)
		button:ClearAllPoints()
		button:SetParent(container)
		
		container.add(button)
			
	end	

	local findButtons = function()
		
		local buttons = {}

		for i = 1, model.map:GetNumChildren() do 
		 
		 	local frame = select(i, model.map:GetChildren())
			local name = frame:GetName()
			
			if name and not blizzardItems[name] then
				table.insert(buttons, frame)
			end
			
		end 
		
		for i, frame in ipairs(buttons) do
		 
			processButton(frame)
			
		end 


	end

	processButton(QueueStatusMinimapButton)

	hooksecurefunc("CreateFrame", function(type, name, parent, templates)
		if templates == "MiniMapButtonTemplate" then
			findButtons()
		end
	end)

	events.register("ADDON_LOADED", function()
		findButtons()
	end)

end)
