local addon, ns = ...

local initialise = function()

	ns.features = {}
	ns.mapping = {}
	ns.mapping.add = function(item) table.insert(ns.mapping, item) end

	local dark = Darker

	ns.lib = {
		class = dark.class,
		events = dark.events,
		fonts = dark.media.fonts,
		colors = dark.media.colors,
		textures = dark.media.textures,
		style = dark.style,
		layout = dark.layoutEngine,
	}

end

initialise()
