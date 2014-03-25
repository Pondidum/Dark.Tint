local addon, ns = ...

local initialise = function()

	local core = Dark.core

	ns.features = {}

	ns.lib = {
		events = core.events,
		fonts = core.fonts,
	}

end

initialise()
