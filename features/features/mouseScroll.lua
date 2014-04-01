local addon, ns = ...

ns.features.add(function(model)

	local map = model.map
	local zoomIn = model.buttons.zoomIn
	local zoomOut = model.buttons.zoomOut

	map:EnableMouseWheel(true)
	map:SetScript("OnMouseWheel", function(self, delta)
	
		if delta > 0 then
			zoomIn:Click()
		elseif delta < 0 then
			zoomOut:Click()
		end

	end)

end)
