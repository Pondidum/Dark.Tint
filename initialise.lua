local addon, ns = ...

local initialise = function()

	local core = Dark.core

	ns.features = {}

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
