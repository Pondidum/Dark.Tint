local addon, ns = ...

local moveObjectives = function()

	local frame = ObjectiveTrackerFrame

	local resolution = select(GetCurrentResolution(), GetScreenResolutions())
	local height = tonumber(string.match(resolution, "%d+x(%d+)"))

	frame:ClearAllPoints()
	frame:SetPoint("LEFT", UIParent, "LEFT", 30, 0)
	frame:SetHeight(height / 2)

	frame.SetPoint = function() end
	frame.ClearAllPoints = function() end

end

ns.features.moveObjectives = moveObjectives
