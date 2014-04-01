local addon, ns = ...

local initialise = function()

	local core = Dark.core

	ns.features = {}
	ns.mapping = {}
	ns.mapping.add = function(item) table.insert(ns.mapping, item) end

	ns.lib = {
		events = core.events,
		fonts = core.fonts,
		colors = core.colors,
		textures = core.textures,
		style = core.style,
		layout = core.layout,
	}

end

initialise()
