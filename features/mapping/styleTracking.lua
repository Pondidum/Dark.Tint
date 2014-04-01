local addon, ns = ...

local style = ns.lib.style
local events = ns.lib.events.new()

ns.features.mapping.add(function(model)

	local map = model.map
	local container = model.notificationContainer
	local tracking = model.tracking 

	local button = model.tracking.button
	local icon = model.tracking.icon
	local overlay = model.tracking.overlay

	style.addShadow(button)
	style.applyBackgroundTo(button)

	tracking.background:Hide()
	tracking.border:Hide()

	icon:ClearAllPoints()
	icon:SetAllPoints(button)
	icon:SetTexture(ns.config.searchIcon)

	overlay:ClearAllPoints()
	overlay:SetAllPoints(button)
	overlay:SetHighlightTexture(nil)
	overlay:SetScript("OnMouseDown", nil)
	overlay:SetScript("OnMouseUp", nil)

	button:SetParent(container)
	container.add(button)

end)
