local addon, ns = ...

local moveObjectives = function()

	local frame = WatchFrame
	local button = WatchFrameCollapseExpandButton
	local header = WatchFrameHeader

	local resolution = select(GetCurrentResolution(), GetScreenResolutions())
	local height = tonumber(string.match(resolution, "%d+x(%d+)"))

	frame:ClearAllPoints()
	frame:SetPoint("LEFT", UIParent, "LEFT", 10, 0)
	frame:SetHeight(height / 2)
	frame.ClearAllPoints = function() end

	button:ClearAllPoints()
	button:SetPoint("TOPLEFT")

	header:ClearAllPoints()
	header:SetPoint("LEFT", button, "RIGHT", 5, -2)

	local original = frame.SetPoint
	frame.SetPoint = function(self, thisFrame, point, relativeFrame, relativePoint, offsetx, offsety)

		if point == "TOPRIGHT" or point == "BOTTOMRIGHT" then
			return
		end

		original(self, thisFrame, point, relativeFrame, relativePoint, offsetx, offsety)

	end

end

ns.features.moveObjectives = moveObjectives
