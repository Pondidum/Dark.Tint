local addon, ns = ...

local style = ns.lib.style
local events = ns.lib.events.new()

ns.features.mapping.add(function(model)

	local map = model.map

	local mailContainer = CreateFrame("Frame", nil, model.map)
	
	local texture = mailContainer:CreateTexture()
	texture:SetAllPoints(mailContainer)
	texture:SetTexture(ns.config.mailIcon)
	
	style.addShadow(mailContainer)
	style.applyBackgroundTo(mailContainer)

	local button = model.mail.button
	local border = model.mail.border
	local icon = model.mail.icon

	button:SetAllPoints(mailContainer)
	border:Hide()

	icon:SetAllPoints(mailContainer)
	icon:SetTexture(nil)

	events.register("UPDATE_PENDING_MAIL", function()
		
		if HasNewMail() then
			texture:SetVertexColor(1.0, 1.0, 1.0)
		else
			texture:SetVertexColor(0.5, 0.5, 0.5)
		end

	end)

	model.notificationContainer.add(mailContainer)

end)
