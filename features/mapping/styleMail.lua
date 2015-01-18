local addon, ns = ...

local class = ns.lib.class
local style = ns.lib.style
local events = ns.lib.events


local mailStyle = class:extend({

	ctor = function(self, model, config)
		self:include(events)

		self.model = model
		self.config = config

		self:modifyUI()
		self:register("UPDATE_PENDING_MAIL")
	end,

	UPDATE_PENDING_MAIL = function(self)

		if HasNewMail() then
			self.texture:SetVertexColor(1.0, 1.0, 1.0)
		else
			self.texture:SetVertexColor(0.5, 0.5, 0.5)
		end

	end,

	modifyUI = function(self)

		local map = self.model.map
		local mailContainer = CreateFrame("Frame", nil, self.model.map)

		local texture = mailContainer:CreateTexture()
		texture:SetAllPoints(mailContainer)
		texture:SetTexture(self.config.mailIcon)

		style:frame(mailContainer)

		local button = self.model.mail.button
		local border = self.model.mail.border
		local icon = self.model.mail.icon

		button:SetAllPoints(mailContainer)
		border:Hide()

		icon:SetAllPoints(mailContainer)
		icon:SetTexture(nil)

		self.texture = texture
		self.model.notificationContainer.add(mailContainer)

	end,
})

ns.mapping.add(function(model, config) mailStyle:new(model, config) end)
