local addon, ns = ...

local style = ns.lib.style

ns.mapping.add(function(model, config)

	local map = model.map
	local header = model.header
	local headerText = model.headerText

	--MAP
	map:ClearAllPoints()
	map:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 0, -config.spacing)
	map:SetPoint("TOPRIGHT", header, "BOTTOMRIGHT", 0, -config.spacing)

	style.addBackground(map)
	style.addShadow(map)


	--HEADER
	header:SetWidth(Minimap:GetHeight())
	header:ClearAllPoints()
	header:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -config.screenOffset, -config.screenOffset)
	header:SetHeight(15)

	headerText:SetPoint("CENTER", header, "CENTER", 0, 0)

	style.addBackground(header)
	style.addShadow(header)

	--cluster
	local cluster = model.cluster
	local clock = model.clock.button

	cluster:ClearAllPoints()
	cluster:SetPoint("TOPLEFT", header, "TOPLEFT", 0, 0)
	cluster:SetPoint("TOPRIGHT", header, "TOPRIGHT", 0, 0)
	cluster:SetPoint("BOTTOM", clock, "BOTTOM", 0, 0)

end)
