local addon, ns = ...

local fonts = ns.lib.fonts
local style = ns.lib.style

local skinBuffs = function()

	local styleButton = function(name)

		local button = _G[name]
		local icon = _G[name.."Icon"]
		local border = _G[name.."Border"]

		button.duration:SetFont(fonts.normal, 10)
		style:border(button)

		icon:SetTexCoord(.08, .92, .08, .92)
		icon:SetPoint("TOPLEFT", button, 2, -2)
		icon:SetPoint("BOTTOMRIGHT", button, -2, 2)

		if border then
			border:Hide()
		end

	end

	hooksecurefunc("BuffFrame_Update", function()

		for i = 1, BUFF_ACTUAL_DISPLAY do
			styleButton("BuffButton"..i)
		end

		for i = 1, DEBUFF_ACTUAL_DISPLAY do
			styleButton("DebuffButton"..i)
		end

		for i = 1, NUM_TEMP_ENCHANT_FRAMES do
			styleButton("TempEnchant"..i)
		end


	end)

end

ns.features.skinBuffs = skinBuffs