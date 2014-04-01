local addon, ns = ...

local runMapping = function()

	local model = ns.feaures.mapping.model.new()
	local config = ns.config.mapping

	for i, feature in ipairs(ns.features.mapping) do
		feature(model, config)
	end

end

ns.features.runMapping = runMapping
