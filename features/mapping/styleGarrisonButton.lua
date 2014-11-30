local addon, ns = ...

local style = ns.lib.style

ns.mapping.add(function(model, config)

	local map = model.map
	local container = model.notificationContainer

	local button = model.garrison.button
	local glow = model.garrison.glow

	button:SetHitRectInsets(0, 0, 0, 0)
	glow:SetAllPoints(button)

	style.addBackground(button)
	style.addShadow(button)

	button:SetParent(container)
	container.add(button)

end)
