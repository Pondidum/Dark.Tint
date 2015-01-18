local addon, ns = ...

local style = ns.lib.style
local layout = ns.lib.layout
local events = ns.lib.events.new()

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

ns.mapping.add(function(model, config)

	local container = CreateFrame("Frame", nil, UIParent)
	model.buttonContainer = container

	container:SetPoint("LEFT", model.map, "LEFT", 0, 0)
	container:SetPoint("TOPRIGHT", model.notificationContainer, "BOTTOMRIGHT", 0, -config.spacing)
	container:SetHeight(20)

	style:border(container)

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
