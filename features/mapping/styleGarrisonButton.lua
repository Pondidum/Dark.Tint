local addon, ns = ...

local style = ns.lib.style

ns.mapping.add(function(model, config)

	local map = model.map
	local container = model.notificationContainer

	local button = model.garrison.button
	button:SetHitRectInsets(0, 0, 0, 0)
	button:GetNormalTexture():SetTexture(nil)
	button:GetPushedTexture():SetTexture(nil)

	button:SetScript("OnShow", nil)

	style:frame(button)

	local glow = model.garrison.glow
	glow:SetAllPoints(button)

	local icon = button:CreateTexture()
	icon:SetAllPoints(button)
	icon:SetTexture(config.garrisonIcon)

	button:SetParent(container)
	container.add(button)

	GarrisonMinimapShipmentCreated_ShowPulse = function() end
end)
