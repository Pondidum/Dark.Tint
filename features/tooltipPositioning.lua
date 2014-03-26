local addon, ns = ...

local attachTooltip = function()

	local anchor = CreateFrame("Frame", nil, UIParent)
	anchor:SetSize(2, 2)
	anchor:SetPoint("BOTTOMRIGHT", MultiBarBottomRight, "TOPRIGHT")

	local updateTooltip = function(self)

		if self:GetAnchorType() ~= "ANCHOR_NONE" then
			return
		end

		local point = anchor:GetPoint()
		local x = 5

		self:ClearAllPoints()

		if point == "TOPLEFT" then
			self:SetPoint("TOPLEFT", anchor, "BOTTOMLEFT", 0, -x)

		elseif point == "TOP" then
			self:SetPoint("TOP", anchor, "BOTTOM", 0, -x)

		elseif point == "TOPRIGHT" then
			self:SetPoint("TOPRIGHT", anchor, "BOTTOMRIGHT", 0, -x)

		elseif point == "BOTTOMLEFT" or point == "LEFT" then
			self:SetPoint("BOTTOMLEFT", anchor, "TOPLEFT", 0, x)

		elseif point == "BOTTOMRIGHT" or point == "RIGHT" then
			self:SetPoint("BOTTOMRIGHT", anchor, "TOPRIGHT", 0, x)

		else
			self:SetPoint("BOTTOM", anchor, "TOP", 0, x)

		end

	end

	hooksecurefunc("GameTooltip_SetDefaultAnchor", function(self, parent)
		self:SetOwner(parent, "ANCHOR_NONE")
	end)

	GameTooltip:HookScript("OnUpdate", updateTooltip)

end

ns.features.tooltipPositioning = attachTooltip
