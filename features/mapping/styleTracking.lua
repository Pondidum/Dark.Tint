local addon, ns = ...

local class = ns.lib.class
local style = ns.lib.style
local events = Darker.events

local trackingStyle = class:extend({

	ctor = function(self, model, config)
		self.model = model
		self.config = config

		self:modifyUI()
	end,

	modifyUI = function(self)

		local map = self.model.map
		local container = self.model.notificationContainer
		local tracking = self.model.tracking

		local button = self.model.tracking.button
		local icon = self.model.tracking.icon
		local overlay = self.model.tracking.overlay

		style:frame(button)

		tracking.background:Hide()
		tracking.border:Hide()

		icon:ClearAllPoints()
		icon:SetAllPoints(button)
		icon:SetTexture(self.config.searchIcon)

		overlay:ClearAllPoints()
		overlay:SetAllPoints(button)
		overlay:SetHighlightTexture(nil)
		overlay:SetScript("OnMouseDown", nil)
		overlay:SetScript("OnMouseUp", nil)

		button:SetParent(container)
		container.add(button)

	end,
})

ns.mapping.add(function(model, config) trackingStyle:new(model, config) end)
