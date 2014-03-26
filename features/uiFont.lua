local addon, ns = ...

local fonts = ns.lib.fonts

local setFont = function(target, font, size, style, alpha)

	target:SetFont(font, size, style)

	if alpha then
		target:SetAlpha(alpha)
	end

end

local applyFonts = function()

	local NORMAL     = fonts.normal
	local COMBAT     = fonts.combat 		-- unitframes
	local NUMBER     = fonts.normal

	UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 12
	CHAT_FONT_HEIGHTS = {12, 13, 14, 15, 16, 17, 18, 19, 20}

	UNIT_NAME_FONT     = NORMAL
	NAMEPLATE_FONT     = NORMAL
	DAMAGE_TEXT_FONT   = COMBAT
	STANDARD_TEXT_FONT = NORMAL

	-- Base fonts
	setFont(GameTooltipHeader,                  NORMAL, 12)
	setFont(NumberFont_OutlineThick_Mono_Small, NUMBER, 12, "OUTLINE")
	setFont(NumberFont_Outline_Huge,            NUMBER, 28, "THICKOUTLINE", 28)
	setFont(NumberFont_Outline_Large,           NUMBER, 15, "OUTLINE")
	setFont(NumberFont_Outline_Med,             NUMBER, 13, "OUTLINE")
	setFont(NumberFont_Shadow_Med,              NORMAL, 12)
	setFont(NumberFont_Shadow_Small,            NORMAL, 12)
	setFont(QuestFont,                          NORMAL, 14)
	setFont(QuestFont_Large,                    NORMAL, 14)
	setFont(SystemFont_Large,                   NORMAL, 15)
	setFont(SystemFont_Med1,                    NORMAL, 12)
	setFont(SystemFont_Med3,                    NORMAL, 13)
	setFont(SystemFont_OutlineThick_Huge2,      NORMAL, 20, "THICKOUTLINE")
	setFont(SystemFont_Outline_Small,           NUMBER, 12, "OUTLINE")
	setFont(SystemFont_Shadow_Large,            NORMAL, 15)
	setFont(SystemFont_Shadow_Med1,             NORMAL, 12)
	setFont(SystemFont_Shadow_Med3,             NORMAL, 13)
	setFont(SystemFont_Shadow_Outline_Huge2,    NORMAL, 20, "OUTLINE")
	setFont(SystemFont_Shadow_Small,            NORMAL, 11)
	setFont(SystemFont_Small,                   NORMAL, 12)
	setFont(SystemFont_Tiny,                    NORMAL, 12)
	setFont(Tooltip_Med,                        NORMAL, 12)
	setFont(Tooltip_Small,                      NORMAL, 12)
	setFont(CombatTextFont,                     COMBAT, 100, "OUTLINE") -- number here just increase the font quality.
	setFont(SystemFont_Shadow_Huge1,            NORMAL, 20, "THINOUTLINE")
	setFont(ZoneTextString,                     NORMAL, 32, "OUTLINE")
	setFont(SubZoneTextString,                  NORMAL, 25, "OUTLINE")
	setFont(PVPInfoTextString,                  NORMAL, 22, "THINOUTLINE")
	setFont(PVPArenaTextString,                 NORMAL, 22, "THINOUTLINE")

end

ns.features.uiFont = applyFonts
