ZO_POWER_BAR_GRADIENT_COLORS = 
{
    [POWERTYPE_HEALTH]        = { ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_POWER_START, POWERTYPE_HEALTH)), ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_POWER_END, POWERTYPE_HEALTH)), },
    [POWERTYPE_MAGICKA]       = { ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_POWER_START, POWERTYPE_MAGICKA)), ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_POWER_END, POWERTYPE_MAGICKA)), },
    [POWERTYPE_WEREWOLF]      = { ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_POWER_START, POWERTYPE_WEREWOLF)), ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_POWER_END, POWERTYPE_WEREWOLF)), },
    [POWERTYPE_STAMINA]       = { ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_POWER_START, POWERTYPE_STAMINA)), ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_POWER_END, POWERTYPE_STAMINA)), },
    [POWERTYPE_MOUNT_STAMINA] = { ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_POWER_START, POWERTYPE_MOUNT_STAMINA)), ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_POWER_END, POWERTYPE_MOUNT_STAMINA)), },
}

ZO_CAST_STATE_BEGIN = 0
ZO_CAST_STATE_BEGIN_CHARGE_UP = 1
ZO_CAST_STATE_BEGIN_MAGIC = 2
ZO_CAST_STATE_BEGIN_MELEE = 3
ZO_CAST_STATE_COMPLETE = 4
ZO_CAST_STATE_INTERRUPT = 5

ZO_CAST_BAR_COLORS =
{
    [ZO_CAST_STATE_BEGIN]           = { ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_CAST_BAR_START, CAST_BAR_DEFAULT)), ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_CAST_BAR_END, CAST_BAR_DEFAULT)), },
    [ZO_CAST_STATE_BEGIN_CHARGE_UP] = { ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_CAST_BAR_START, CAST_BAR_DEFAULT)), ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_CAST_BAR_END, CAST_BAR_DEFAULT)), },
    [ZO_CAST_STATE_COMPLETE]        = { ZO_ColorDef:New("1B402C"), ZO_ColorDef:New("4CC178"), },
    [ZO_CAST_STATE_INTERRUPT]       = { ZO_ColorDef:New("722323"), ZO_ColorDef:New("DA3030"), },
    [ZO_CAST_STATE_BEGIN_MAGIC]     = { ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_CAST_BAR_START, CAST_BAR_BEGIN_MAGIC)), ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_CAST_BAR_END, CAST_BAR_END_MAGIC)), },
    [ZO_CAST_STATE_BEGIN_MELEE]     = { ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_CAST_BAR_START, CAST_BAR_BEGIN_MELEE)), ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_CAST_BAR_END, CAST_BAR_END_MELEE)), },
}

ZO_XP_BAR_GLOW_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_XP_GLOW)) 
ZO_XP_BAR_GRADIENT_COLORS = { ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_XP_START)), ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_XP_END)) }
ZO_VP_BAR_GLOW_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_VP_GLOW))
ZO_VP_BAR_GRADIENT_COLORS = { ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_VP_START)), ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_VP_END)) }
ZO_SKILL_XP_BAR_GLOW_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_SKILL_XP_GLOW))
ZO_SKILL_XP_BAR_GRADIENT_COLORS = { ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_SKILL_XP_START)), ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_SKILL_XP_END)) }
ZO_AVA_RANK_GRADIENT_COLORS = { ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_AVA_RANK_START)), ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_AVA_RANK_END)) }

ZO_CP_BAR_GRADIENT_COLORS = { 
    [ATTRIBUTE_HEALTH] = { ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_CP_HEALTH_START)), ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_CP_HEALTH_END)) },
    [ATTRIBUTE_MAGICKA] = { ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_CP_MAGICKA_START)), ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_CP_MAGICKA_END)) },
    [ATTRIBUTE_STAMINA] = { ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_CP_STAMINA_START)), ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_CP_STAMINA_END)) },
}

ZO_CP_BAR_GLOW_COLORS = { 
    [ATTRIBUTE_HEALTH] =  ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_CP_HEALTH_END)),
    [ATTRIBUTE_MAGICKA] = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_CP_MAGICKA_END)),
    [ATTRIBUTE_STAMINA] = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_CP_STAMINA_END)),
}

function GetConColor(otherLevel, playerLevel)
    return GetColorForCon(GetCon(otherLevel, playerLevel))
end

function GetColorForCon(con)
    return GetInterfaceColor(INTERFACE_COLOR_TYPE_CON_COLORS, con)
end

local ZO_COLOR_DEF_FOR_CON = {}

function GetColorDefForCon(con)
    local colorDef = ZO_COLOR_DEF_FOR_CON[con]
    if not colorDef then
        colorDef = ZO_ColorDef:New(GetColorForCon(con))
        ZO_COLOR_DEF_FOR_CON[con] = colorDef
    end
    return colorDef
end

local NO_ALLIANCE_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_ALLIANCE, ALLIANCE_NONE))
local COLORED_ALLIANCE_NAMES = {} -- will be filled out as these names are asked for
local COLORED_BATTLEGROUND_ALLIANCE_NAMES = {} -- will be filled out as these names are asked for
local COLORED_BATTLEGROUND_YOUR_TEAM_TEXT = {}
local COLORED_BATTLEGROUND_ENEMY_TEAM_TEXT = {}

local ALLIANCE_COLORS =
{
    [ALLIANCE_ALDMERI_DOMINION] = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_ALLIANCE, ALLIANCE_ALDMERI_DOMINION)),
    [ALLIANCE_EBONHEART_PACT] = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_ALLIANCE, ALLIANCE_EBONHEART_PACT)),
    [ALLIANCE_DAGGERFALL_COVENANT] = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_ALLIANCE, ALLIANCE_DAGGERFALL_COVENANT)),
}

local BATTLEGROUND_ALLIANCE_COLORS =
{
    [BATTLEGROUND_ALLIANCE_FIRE_DRAKES] = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_BATTLEGROUND_ALLIANCE, BATTLEGROUND_ALLIANCE_FIRE_DRAKES)),
    [BATTLEGROUND_ALLIANCE_PIT_DAEMONS] = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_BATTLEGROUND_ALLIANCE, BATTLEGROUND_ALLIANCE_PIT_DAEMONS)),
    [BATTLEGROUND_ALLIANCE_STORM_LORDS] = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_BATTLEGROUND_ALLIANCE, BATTLEGROUND_ALLIANCE_STORM_LORDS)),
}

function GetAllianceColor(alliance)
    return ALLIANCE_COLORS[alliance] or NO_ALLIANCE_COLOR
end

function GetBattlegroundAllianceColor(battlegroundAlliance)
    return BATTLEGROUND_ALLIANCE_COLORS[battlegroundAlliance] or NO_ALLIANCE_COLOR
end

function GetColoredAllianceName(alliance)
    local coloredName = COLORED_ALLIANCE_NAMES[alliance]
    if((coloredName == nil) and GetAllianceName) then
        local color = GetAllianceColor(alliance)
        COLORED_ALLIANCE_NAMES[alliance] = color:Colorize(GetAllianceName(alliance))
        return COLORED_ALLIANCE_NAMES[alliance]
    end

    return coloredName
end

function GetColoredBattlegroundAllianceName(battlegroundAlliance)
    local coloredName = COLORED_BATTLEGROUND_ALLIANCE_NAMES[battlegroundAlliance]
    if coloredName == nil then
        local color = GetBattlegroundAllianceColor(battlegroundAlliance)
        COLORED_BATTLEGROUND_ALLIANCE_NAMES[battlegroundAlliance] = color:Colorize(GetBattlegroundAllianceName(battlegroundAlliance))
        return COLORED_BATTLEGROUND_ALLIANCE_NAMES[battlegroundAlliance]
    end

    return coloredName
end

function GetColoredBattlegroundYourTeamText(battlegroundAlliance)
    local coloredName = COLORED_BATTLEGROUND_YOUR_TEAM_TEXT[battlegroundAlliance]
    if coloredName == nil then
        local color = GetBattlegroundAllianceColor(battlegroundAlliance)
        COLORED_BATTLEGROUND_YOUR_TEAM_TEXT[battlegroundAlliance] = color:Colorize(GetString(SI_BATTLEGROUND_YOUR_TEAM))
        return COLORED_BATTLEGROUND_YOUR_TEAM_TEXT[battlegroundAlliance]
    end

    return coloredName
end

function GetColoredBattlegroundEnemyTeamText(battlegroundAlliance)
    local coloredName = COLORED_BATTLEGROUND_ENEMY_TEAM_TEXT[battlegroundAlliance]
    if coloredName == nil then
        local color = GetBattlegroundAllianceColor(battlegroundAlliance)
        COLORED_BATTLEGROUND_ENEMY_TEAM_TEXT[battlegroundAlliance] = color:Colorize(GetString(SI_BATTLEGROUND_ENEMY_TEAM))
        return COLORED_BATTLEGROUND_ENEMY_TEAM_TEXT[battlegroundAlliance]
    end

    return coloredName
end

do
    local CLASS_COLORS
    local NO_CLASS_COLOR = ZO_ColorDef:New("FFFFFF")

    local function InitializeClassColors()
        if CLASS_COLORS then return end
        CLASS_COLORS = {}

        for i = 1, GetNumClasses() do
            local classId = GetClassInfo(i)
            CLASS_COLORS[classId] = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_UNIT_CLASS, i))
        end
    end

    function GetClassColor(classId)
        InitializeClassColors()

        if(type(classId) == "string") then
            classId = GetUnitClassId(classId)
        end
        
        return CLASS_COLORS[classId] or NO_CLASS_COLOR
    end
end

ZO_BUFF_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_BUFF_TYPE, BUFF_TYPE_COLOR_BUFF))
ZO_DEBUFF_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_BUFF_TYPE, BUFF_TYPE_COLOR_DEBUFF))

function GetBuffColor(effectType)
    if effectType == BUFF_EFFECT_TYPE_DEBUFF then
        return ZO_DEBUFF_COLOR
    end

    return ZO_BUFF_COLOR
end

function GetStatColor(baseValue, currentValue, defaultOverride)
    if baseValue > currentValue then
        return STAT_LOWER_COLOR
    elseif currentValue > baseValue then
        return STAT_HIGHER_COLOR
    end
    return defaultOverride or ZO_DEFAULT_ENABLED_COLOR
end

do
    local itemColors = {}
    function GetItemQualityColor(quality)
        if not itemColors[quality] then
            itemColors[quality] = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_ITEM_QUALITY_COLORS, quality))
        end
        return itemColors[quality]
    end
end

do
    local itemColors = {}
    local REDUCE_AMOUNT = .25
    function GetDimItemQualityColor(quality)
        if not itemColors[quality] then
            local r, g, b = GetInterfaceColor(INTERFACE_COLOR_TYPE_ITEM_QUALITY_COLORS, quality)
            r, g, b = zo_saturate(r - REDUCE_AMOUNT), zo_saturate(g - REDUCE_AMOUNT), zo_saturate(b - REDUCE_AMOUNT)    
            itemColors[quality] = ZO_ColorDef:New(r, g, b)
        end
        return itemColors[quality]
    end
end

ZO_CHARGE_GRADIENT_COLORS = { 
    ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_ITEM_TOOLTIP, ITEM_TOOLTIP_COLOR_CHARGE_BAR_GRADIENT_START)), 
    ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_ITEM_TOOLTIP, ITEM_TOOLTIP_COLOR_CHARGE_BAR_GRADIENT_END)),
}

ZO_CONDITION_GRADIENT_COLORS = { 
    ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_ITEM_TOOLTIP, ITEM_TOOLTIP_COLOR_CONDITION_BAR_GRADIENT_START)), 
    ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_ITEM_TOOLTIP, ITEM_TOOLTIP_COLOR_CONDITION_BAR_GRADIENT_END)),
}

ZO_BATTLEGROUND_ALLIANCE_STATUS_BAR_GRADIENTS =
{
    [BATTLEGROUND_ALLIANCE_PIT_DAEMONS] = { ZO_ColorDef:New(0.161, 0.306, 0.047), ZO_ColorDef:New(0.345, 0.592, 0.149) },
    [BATTLEGROUND_ALLIANCE_STORM_LORDS] = { ZO_ColorDef:New(0.314, 0.125, 0.416), ZO_ColorDef:New(0.475, 0.286, 0.576) },
    [BATTLEGROUND_ALLIANCE_FIRE_DRAKES] = { ZO_ColorDef:New(0.451, 0.153, 0.035), ZO_ColorDef:New(0.757, 0.341, 0.176) },
}

-- Lua doesn't need entries for every status effect color, this is just a quick lookup for the commonly used ones.
-- Don't use the table directly, use the API that checks for nil entries.
local statusEffectColors =
{
    [STATUS_EFFECT_TYPE_POISON]     = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_STATUS_EFFECT, STATUS_EFFECT_TYPE_POISON)),
    [STATUS_EFFECT_TYPE_DISEASE]    = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_STATUS_EFFECT, STATUS_EFFECT_TYPE_DISEASE)),
    [STATUS_EFFECT_TYPE_WOUND]      = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_STATUS_EFFECT, STATUS_EFFECT_TYPE_WOUND)),
    [STATUS_EFFECT_TYPE_MAGIC]      = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_STATUS_EFFECT, STATUS_EFFECT_TYPE_MAGIC)),
}

local defaultStatusEffectColor = ZO_ColorDef:New(1, 1, 1)

function GetStatusEffectColor(statusEffectType)
    return statusEffectColors[statusEffectType] or defaultStatusEffectColor
end

ZO_DEFAULT_DISABLED_COLOR = ZO_ColorDef:New(.3, .3, .3)
ZO_DEFAULT_DISABLED_MOUSEOVER_COLOR = ZO_ColorDef:New(.5, .5, .5)
ZO_DEFAULT_ENABLED_COLOR = ZO_ColorDef:New(1, 1, 1)

ZO_HIGHLIGHT_TEXT = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_HIGHLIGHT))
ZO_NORMAL_TEXT = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_NORMAL))
ZO_DISABLED_TEXT = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_DISABLED))
ZO_SELECTED_TEXT = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_SELECTED))
ZO_HINT_TEXT = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_HINT))
ZO_CONTRAST_TEXT = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_CONTRAST))
ZO_SECOND_CONTRAST_TEXT = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_SECOND_CONTRAST))
ZO_GAME_REPRESENTATIVE_TEXT = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_GAME_REPRESENTATIVE))
ZO_BLADE_HIGHLIGHT_TEXT = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_BLADE_HIGHLIGHT))
ZO_BLADE_TEXT = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_BLADE))
ZO_DEFAULT_TEXT = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_DEFAULT_TEXT))

ZO_SUCCEEDED_TEXT = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_SUCCEEDED))

STAT_LOWER_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_STAT_VALUE, STAT_VALUE_COLOR_LOWER))
STAT_HIGHER_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_STAT_VALUE, STAT_VALUE_COLOR_HIGHER))
STAT_BATTLE_LEVEL_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_STAT_VALUE, STAT_VALUE_COLOR_BATTLE_LEVELED))

ZO_TOOLTIP_DEFAULT_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_TOOLTIP_DEFAULT))
ZO_TOOLTIP_INSTRUCTIONAL_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_TOOLTIP_INSTRUCTIONAL))

ZO_ERROR_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_GENERAL, INTERFACE_GENERAL_COLOR_ERROR))
ZO_BLACK = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_GENERAL, INTERFACE_GENERAL_COLOR_BLACK))
ZO_WHITE = ZO_ColorDef:New("FFFFFF")

PURCHASED_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_PURCHASED))
PURCHASED_UNSELECTED_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_PURCHASED_UNSELECTED)) --Gamepad only dimmer white
UNPURCHASED_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_UNPURCHASED))
LOCKED_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_PROGRESSION, PROGRESSION_COLOR_LOCKED))

ZO_CURRENCY_HIGHLIGHT_TEXT = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_CURRENCY_HIGHLIGHT))
ZO_PERSONALITY_EMOTES_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_PERSONALITY_EMOTES))
ZO_BATTLEGROUND_WINNER_TEXT = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_BATTLEGROUND_WINNER))

ZO_TRADE_BOP_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_ITEM_TOOLTIP, ITEM_TOOLTIP_COLOR_TRADE_BOP))

ZO_LOCKED_ICON_SAMPLE_PROCESSING_WEIGHT_TABLE =
{
    [TEX_SAMPLE_PROCESSING_RGB] = 0.3,
    [TEX_SAMPLE_PROCESSING_ALPHA_AS_RGB] = 0.3,
}

ZO_UNLOCKED_ICON_SAMPLE_PROCESSING_WEIGHT_TABLE =
{
    [TEX_SAMPLE_PROCESSING_RGB] = 1.0,
    [TEX_SAMPLE_PROCESSING_ALPHA_AS_RGB] = 0.0,
}

--------------------------------------
--Gamepad Colors
--------------------------------------

ZO_GAMEPAD_ICON_SELECTED_ALPHA = 1
ZO_GAMEPAD_ICON_UNSELECTED_ALPHA = 0.4

ZO_GAMEPAD_TEXT_SELECTED_ALPHA = 1
ZO_GAMEPAD_TEXT_UNSELECTED_ALPHA = 0.4

ZO_GAMEPAD_DISABLED_UNSELECTED_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_TEXT_COLORS, INTERFACE_TEXT_COLOR_GAMEPAD_TERTIARY))

------------------------------------
-- Market Colors
------------------------------------

ZO_MARKET_DIMMED_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_MARKET_COLORS, MARKET_COLORS_DIMMED))
ZO_MARKET_SELECTED_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_MARKET_COLORS, MARKET_COLORS_SELECTED))
ZO_MARKET_PRODUCT_ON_SALE_DIMMED_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_MARKET_COLORS, MARKET_COLORS_ON_SALE_DIMMED)) 
ZO_MARKET_PRODUCT_ON_SALE_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_MARKET_COLORS, MARKET_COLORS_ON_SALE))
ZO_MARKET_PRODUCT_NEW_DIMMED_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_MARKET_COLORS, MARKET_COLORS_NEW_DIMMED))
ZO_MARKET_PRODUCT_NEW_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_MARKET_COLORS, MARKET_COLORS_NEW))
ZO_MARKET_PRODUCT_BACKGROUND_BRIGHTNESS_COLOR = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_MARKET_COLORS, MARKET_COLORS_PRODUCT_BACKGROUND_BRIGHTNESS))
ZO_COLOR_UNIVERSAL_ITEM = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_MARKET_COLORS, MARKET_COLORS_UNIVERSAL_ITEM))
ZO_COLOR_UNIVERSAL_ITEM_SELECTED = ZO_ColorDef:New(GetInterfaceColor(INTERFACE_COLOR_TYPE_MARKET_COLORS, MARKET_COLORS_UNIVERSAL_ITEM_SELECTED))