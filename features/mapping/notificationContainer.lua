local addon, ns = ...

local layout = ns.lib.layout

ns.features.mapping.add(function(model, config)

	local container = CreateFrame("Frame", nil, model.map)

	container:SetPoint("LEFT", model.map, "CENTER", 0, 0)
	container:SetPoint("TOPRIGHT", model.map, "BOTTOMRIGHT", 0, -config.spacing)
	container:SetHeight(15)

	layout.init(container, {
		marginTop = 0,
		marginRight = config.spacing,
		marginBottom = 0,
		marginLeft = 0,

		paddingTop = 0,
		paddingLeft = 0,

		defaultChildHeight = 15,
		defaultChildWidth = 15,
		forceChildSize = true,
	})

	model.notificationContainer = container

end)
