local addon, ns = ...

local expandTooltips = function()

	hooksecurefunc(GameTooltip, "SetUnitBuff", function(self, ...)

		local id = select(11, UnitBuff(...))

		if id then
			self:AddDoubleLine("SpellID:", id)
			self:Show()
		end

	end)

	hooksecurefunc(GameTooltip, "SetUnitDebuff", function(self, ...)

		local id = select(11, UnitDebuff(...))

		if id then
			self:AddDoubleLine("SpellID:", id)
			self:Show()
		end

	end)

	hooksecurefunc(GameTooltip, "SetSpellBookItem", function(self, ...)

		local index, book = ...
		local link = GetSpellLink(index, book)

		if link then

			local index, length, color, ltype, id = string.find(link, "|?c?f?f?(%x*)|?H?([^:]*):?(%d+)")

			if id then
				self:AddDoubleLine("SpellID:", id)
				self:Show()
			end
		end

	end)

	hooksecurefunc(GameTooltip, "SetAction", function(self, ...)

		local type, id = GetActionInfo(...)

		if id then
			self:AddDoubleLine("SpellID:", id)
			self:Show()
		end

	end)


	hooksecurefunc(GameTooltip, "SetUnitAura", function(self, ...)

		local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster, isStealable, shouldConsolidate, spellID  = UnitAura(...)

		if spellID then
			self:AddDoubleLine("SpellID", spellID)
		end

		if unitCaster then

			local src = GetUnitName(unitCaster, true)

			if unitCaster == "pet" or unitCaster == "vehicle" then
				src = string.format("%s (%s)", src, GetUnitName("player", true))
			else
				local partypet = unitCaster:match("^partypet(%d+)$")
				local raidpet = unitCaster:match("^raidpet(%d+)$")

				if partypet then
					src = string.format("%s (%s)", src, GetUnitName("party"..partypet, true))
				elseif raidpet then
					src = string.format("%s (%s)", src, GetUnitName("raid"..raidpet, true))
				end

			end

			self:AddDoubleLine("Caster", src)
		end

		if spellID or unitCaster then
			self:Show()
		end

	end)

end

ns.features.tooltipAdditions = expandTooltips
