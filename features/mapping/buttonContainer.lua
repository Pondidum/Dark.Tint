local addon, ns = ...

local class = ns.lib.class
local style = ns.lib.style
local layout = ns.lib.layout
local events = ns.lib.events

local buttonContainer = class:extend({

	blizzardItems = {
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
	},

	ctor = function(self, model, config)
		self:include(events)
		self:register("ADDON_LOADED")

		self:buildUI()
		self:hookup()

	end,

	ADDON_LOADED = function(self, addonName)
		self:findButtons()
	end,

	hookup = function(self)

		self:processButton(QueueStatusMinimapButton)

		hooksecurefunc("CreateFrame", function(type, name, parent, templates)
			if templates == "MiniMapButtonTemplate" then
				self:findButtons()
			end
		end)

	end,

	buildUI = function(self)

		local container = CreateFrame("Frame", nil, UIParent)
		model.buttonContainer = container

		container:SetPoint("LEFT", model.map, "LEFT", 0, 0)
		container:SetPoint("TOPRIGHT", model.notificationContainer, "BOTTOMRIGHT", 0, -config.spacing)
		container:SetHeight(20)

		style:border(container)

		local engine = layout:new(container, {
			layout = "horizontal",
			wrap = true,
			autosize = "y",
		})

		container.add = function(child)

			child:SetSize(15, 15)

			engine:addChild(child)
			engine:performLayout()

		end

		self.container = container
	end,

	findButtons = function(self)

		for i = 1, self.model.map:GetNumChildren() do

		 	local frame = select(i, self.model.map:GetChildren())
			local name = frame:GetName()

			if name and not self.blizzardItems[name] then
				processButton(frame)
			end

		end

	end,

	processButton = function(self, button)

		button:RegisterForDrag(nil)
		button:ClearAllPoints()
		button:SetParent(self.container)

		self.container.add(button)

	end,

})

ns.mapping.add(function(model, config) buttonContainer:new(model, config) end)
