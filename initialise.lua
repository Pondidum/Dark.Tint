local addon, ns = ...

local initialise = function()

	local core = Dark.core

	ns.features = {}
	ns.mapping = {}
	ns.mapping.add = function(item) table.insert(ns.mapping, item) end

	ns.lib = {
		class = Darker.class,
		events = core.events,
		fonts = Darker.media.fonts,
		colors = Darker.media.colors,
		textures = Darker.media.textures,
		style = Darker.style,
		layout = core.layout,
	}

end

initialise()
