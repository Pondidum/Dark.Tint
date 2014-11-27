local addon, ns = ...

local style = ns.lib.style

ns.mapping.add(function(model, config)

	local map = model.map
	local container = model.notificationContainer

	local button = model.garrison.button

	button:SetHitRectInsets(0, 0, 0, 0)
	-- icon:ClearAllPoints()
	-- icon:SetPoint("TOPLEFT", button, "TOPLEFT", -2, 2)
	-- icon:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 2, -2)

	--border:Hide()

	style.addBackground(button)
	style.addShadow(button)

	button:SetParent(container)
	container.add(button)

end)
