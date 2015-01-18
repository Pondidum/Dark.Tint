local addon, ns = ...

local colors = ns.lib.colors
local fonts = ns.lib.fonts
local textures = ns.lib.textures
local style = ns.lib.style

-- credits : Aezay (TipTac) and Caellian for some parts of code.

local styleTooltips = function()

	local GameTooltip, GameTooltipStatusBar = _G["GameTooltip"], _G["GameTooltipStatusBar"]
	local gsub, find, format = string.gsub, string.find, string.format

	local classification = {
		worldboss = "|cffAF5050Boss|r",
		rareelite = "|cffAF5050+ Rare|r",
		elite = "|cffAF5050+|r",
		rare = "|cffAF5050Rare|r",
	}


	local hexFromRgb = function(r, g, b)
		return string.format('|cff%02x%02x%02x', r * 255, g * 255, b * 255)
	end

	local getUnitColor = function(unit)

		if UnitIsPlayer(unit) and not UnitHasVehicleUI(unit) then

			local localClass, class = UnitClass(unit)
			local color = colors.class[class]

			if not color then
				return "|CFFFFFFFF", 1, 1, 1 -- sometime unit too far away return nil for color :(
			end

			local r, g, b = unpack(color)

			return hexFromRgb(r, g, b), r, g, b

		else
			local color = colors.reaction[UnitReaction(unit, "player")]

			if not color then
				return "|CFFFFFFFF", 1, 1, 1 -- sometime unit too far away return nil for color :(
			end

			local r, g, b = unpack(color)

			return hexFromRgb(r, g, b), r, g, b

		end
	end

	-- function to short-display HP value on StatusBar
	local shortValue = function(value)
		if value >= 1e7 then
			return ('%.1fm'):format(value / 1e6):gsub('%.?0+([km])$', '%1')
		elseif value >= 1e6 then
			return ('%.2fm'):format(value / 1e6):gsub('%.?0+([km])$', '%1')
		elseif value >= 1e5 then
			return ('%.0fk'):format(value / 1e3)
		elseif value >= 1e3 then
			return ('%.1fk'):format(value / 1e3):gsub('%.?0+([km])$', '%1')
		else
			return value
		end
	end

	-- update HP value on status bar
	GameTooltipStatusBar:SetScript("OnValueChanged", function(self, value)
		if not value then
			return
		end
		local min, max = self:GetMinMaxValues()

		if (value < min) or (value > max) then
			return
		end
		local unitName, unit = GameTooltip:GetUnit()

		-- fix target of target returning nil
		if (not unit) then
			local mouseFocus = GetMouseFocus()
			unit = mouseFocus and mouseFocus:GetAttribute("unit")
		end

		if not self.text then
			self.text = self:CreateFontString(nil, "OVERLAY")
			self.text:SetPoint("CENTER", GameTooltipStatusBar, 0, 6)


			self.text:SetFont(fonts.normal, 12, "THINOUTLINE")
			self.text:Show()
			if unit then
				min, max = UnitHealth(unit), UnitHealthMax(unit)
				local hp = shortValue(min) .. " / " .. shortValue(max)

				if UnitIsGhost(unit) then
					self.text:SetText("Ghost")
				elseif min == 0 or UnitIsDead(unit) or UnitIsGhost(unit) then
					self.text:SetText("Dead")
				else
					self.text:SetText(hp)
				end

			end
		else
			if unit then
				min, max = UnitHealth(unit), UnitHealthMax(unit)
				self.text:Show()
				local hp = shortValue(min) .. " / " .. shortValue(max)
				if UnitIsGhost(unit) then
					self.text:SetText("Ghost")
				elseif min == 0 or UnitIsDead(unit) or UnitIsGhost(unit) then
					self.text:SetText("Dead")
				else
					self.text:SetText(hp)
				end
			else
				self.text:Hide()
			end
		end
	end)

	local healthBar = GameTooltipStatusBar
	healthBar:ClearAllPoints()
	healthBar:SetHeight(6)
	healthBar:SetPoint("BOTTOMLEFT", healthBar:GetParent(), "TOPLEFT", 0, 5)
	healthBar:SetPoint("BOTTOMRIGHT", healthBar:GetParent(), "TOPRIGHT", 0, 5)
	healthBar:SetStatusBarTexture(textures.normal)

	local healthBarBG = CreateFrame("Frame", "StatusBarBG", healthBar)
	healthBarBG:SetFrameLevel(healthBar:GetFrameLevel() - 1)
	healthBarBG:SetAllPoints(healthBar)
	style:frame(healthBarBG)

	healthBar:SetStatusBarColor(colors.background)

	local styleHealthBar = function(self, classKey, player, reaction)
		if player then

			healthBar:SetStatusBarColor(unpack(colors.class[classKey]))

		elseif reaction then

			healthBar:SetStatusBarColor(unpack(colors.reaction[reaction]))

		else

			local itemName, link = self:GetItem()
			local quality = link and select(3, GetItemInfo(link))

			if quality and quality >= 2 then
				self.shadow:SetBackdropBorderColor(GetItemQualityColor(quality))
			end

		end

	end

	GameTooltip:HookScript("OnTooltipSetUnit", function(self)
		local lines = self:NumLines()
		local mouseFocus = GetMouseFocus()
		local unit = (select(2, self:GetUnit())) or (mouseFocus and mouseFocus:GetAttribute("unit"))

		-- A mage's mirror images sometimes doesn't return a unit, this would fix it
		if (not unit) and (UnitExists("mouseover")) then
			unit = "mouseover"
		end

		-- Sometimes when you move your mouse quicky over units in the worldframe, we can get here without a unit
		if not unit then self:Hide() return end

		-- A "mouseover" unit is better to have as we can then safely say the tip should no longer show when it becomes invalid.
		if (UnitIsUnit(unit,"mouseover")) then
			unit = "mouseover"
		end

		local race = UnitRace(unit)
		local class, classKey = UnitClass(unit)
		local level = UnitLevel(unit)
		local guild = GetGuildInfo(unit)
		local name, realm = UnitName(unit)
		local reaction = unit and UnitReaction(unit, "player")
		local player = unit and UnitIsPlayer(unit)

		local crtype = UnitCreatureType(unit)
		local classif = UnitClassification(unit)
		local title = UnitPVPName(unit)
		local r, g, b = GetQuestDifficultyColor(level).r, GetQuestDifficultyColor(level).g, GetQuestDifficultyColor(level).b

		local color = getUnitColor(unit)

		_G["GameTooltipTextLeft1"]:SetFormattedText("%s%s%s", color, title or name or "", realm and realm ~= "" and " - "..realm.."|r" or "|r")

		styleHealthBar(self, classKey, player, reaction)

		if player then
			if UnitIsAFK(unit) then
				self:AppendText((" %s"):format(CHAT_FLAG_AFK))
			elseif UnitIsDND(unit) then
				self:AppendText((" %s"):format(CHAT_FLAG_DND))
			end

			local offset = 2
			if guild then
				_G["GameTooltipTextLeft2"]:SetFormattedText("%s", IsInGuild() and GetGuildInfo("player") == guild and "|cff0090ff"..guild.."|r" or "|cff00ff10"..guild.."|r")
				offset = offset + 1
			end

			for i= offset, lines do
				if(_G["GameTooltipTextLeft"..i]:GetText():find("^"..LEVEL)) then
					_G["GameTooltipTextLeft"..i]:SetFormattedText("|cff%02x%02x%02x%s|r %s %s%s", r*255, g*255, b*255, level > 0 and level or "??", race, color, class.."|r")
					break
				end
			end
		else
			for i = 2, lines do
				if((_G["GameTooltipTextLeft"..i]:GetText():find("^"..LEVEL)) or (crtype and _G["GameTooltipTextLeft"..i]:GetText():find("^"..crtype))) then
					if level == -1 and classif == "elite" then classif = "worldboss" end
					_G["GameTooltipTextLeft"..i]:SetFormattedText("|cff%02x%02x%02x%s|r%s %s", r*255, g*255, b*255, classif ~= "worldboss" and level ~= 0 and level or "", classification[classif] or "", crtype or "")
					break
				end
			end
		end

		local pvpLine
		for i = 1, lines do
			local text = _G["GameTooltipTextLeft"..i]:GetText()
			if text and text == PVP_ENABLED then
				pvpLine = _G["GameTooltipTextLeft"..i]
				pvpLine:SetText()
				break
			end
		end

		-- ToT line
		if UnitExists(unit.."target") and unit~="player" then

			local hex, r, g, b = getUnitColor(unit.."target")

			GameTooltip:AddLine(UnitName(unit.."target"), r, g, b)
		end

		-- Sometimes this wasn't getting reset, the fact a cleanup isn't performed at this point, now that it was moved to "OnTooltipCleared" is very bad, so this is a fix
		self.fadeOut = nil
	end)

	-- Update Tooltip Position on some specifics Tooltip
	GameTooltip:HookScript("OnUpdate", function(self)

		-- h4x for world object tooltip border showing last border color or showing background sometime ~blue :x
		if self:GetAnchorType() == "ANCHOR_CURSOR" then

			self:SetBackdropColor(unpack(colors.background))
			self:SetBackdropBorderColor(unpack(colors.shadow))

		end

	end)


	local styleTooltip = function(self)
		self:SetBackdrop(nil)
		style:frame(self)

		local r, g, b = unpack(colors.background)

		self.bg:SetBackdropColor(r, g, b, 0.8)
	end


	local Tooltips = { GameTooltip, ShoppingTooltip1, ShoppingTooltip2, ShoppingTooltip3, WorldMapTooltip }

	for i, tt in ipairs(Tooltips) do
		tt:HookScript("OnShow", styleTooltip)
	end

	local itemRef = ItemRefTooltip

	itemRef:HookScript("OnTooltipSetItem", styleTooltip)
	itemRef:HookScript("OnShow", styleTooltip)

end

ns.features.styleTooltips = styleTooltips
