local addon, ns = ...

local style = ns.lib.style

ns.features.add(function(model)

	local map = model.map

	local clock = model.clock.button
	local border = model.clock.border
	local text = model.clock.text
	local alarm = model.clock.alarm

	clock:SetPoint("TOPLEFT", map, "BOTTOMLEFT", 0, -ns.config.spacing)
	clock:SetPoint("RIGHT", map, "CENTER", -ns.config.spacing, 0)
	clock:SetHeight(15)

	style.addShadow(clock)
	style.addBackground(clock)

	border:Hide()
	alarm:SetAllPoints(clock)
	text:SetAllPoints(clock)

end)
