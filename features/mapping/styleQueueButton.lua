local addon, ns = ...

local style = ns.lib.style 

ns.features.add(function(model)

	local map = model.map
	local container = model.notificationContainer
	
	local button = model.queue.button
	local icon = model.queue.icon
	local border = model.queue.border 

	icon:ClearAllPoints()
	icon:SetPoint("TOPLEFT", button, "TOPLEFT", -2, 2)
	icon:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 2, -2)

	border:Hide()

	style.addBackground(button)
	style.addShadow(button)

	button:SetParent(container)
	container.add(button)

end)
