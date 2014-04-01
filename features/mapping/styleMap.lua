local addon, ns = ...

local style = ns.lib.style

ns.features.mapping.add(function(model)

	local map = model.map
	local header = model.header
	local headerText = model.headerText

	--MAP
	map:ClearAllPoints()
	map:SetPoint("TOPLEFT", header, "BOTTOMLEFT", 0, -ns.config.spacing)
	map:SetPoint("TOPRIGHT", header, "BOTTOMRIGHT", 0, -ns.config.spacing)

	style.addBackground(map)
	style.addShadow(map)


	--HEADER
	header:SetWidth(Minimap:GetHeight())
	header:ClearAllPoints()
	header:SetPoint("TOPRIGHT", UIParent, "TOPRIGHT", -ns.config.screenOffset, -ns.config.screenOffset)
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
