local addon, ns = ...

local style = Darker.style

ns.mapping.add(function(model, config)

	local map = model.map

	local clock = model.clock.button
	local border = model.clock.border
	local text = model.clock.text
	local alarm = model.clock.alarm

	clock:SetPoint("TOPLEFT", map, "BOTTOMLEFT", 0, -config.spacing)
	clock:SetSize(60, 15)

	style:frame(clock)

	border:Hide()
	alarm:SetAllPoints(clock)
	text:SetAllPoints(clock)

end)
