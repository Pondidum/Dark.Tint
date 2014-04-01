local addon, ns = ...

local runMapping = function()

	local model = ns.mapping.model.new()
	local config = ns.config.mapping

	for i, feature in ipairs(ns.mapping) do
		feature(model, config)
	end

end

ns.features.runMapping = runMapping
