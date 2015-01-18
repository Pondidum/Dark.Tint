local addon, ns = ...

local layout = ns.lib.layout

ns.mapping.add(function(model, config)

	local container = CreateFrame("Frame", nil, model.map)

	container:SetPoint("LEFT", model.clock.button, "RIGHT", config.spacing, 0)
	container:SetPoint("TOPRIGHT", model.map, "BOTTOMRIGHT", 0, -config.spacing)
	container:SetHeight(15)

	local engine = layout:new(container, {
		layout = "horizontal",
		origin = "LEFT",
		wrap = false,
		itemSpacing = config.spacing,
	})

	container.add = function(child)

		child:SetSize(15, 15)

		engine:addChild(child)
		engine:performLayout()

	end

	model.notificationContainer = container

end)
