local addon, ns = ...

local run = function()

	for name, feature in pairs(ns.features) do
		feature()
	end

end

run()
