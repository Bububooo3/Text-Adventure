local keys = {
    -- reset
    reset     = 0,

    -- misc
    bright    = 1,
    dim       = 2,
    underline = 4,
    blink     = 5,
    reverse   = 7,
    hidden    = 8,

    -- foreground colors
    black     = 30,
    red       = 31,
    green     = 32,
    yellow    = 33,
    blue      = 34,
    magenta   = 35,
    cyan      = 36,
    white     = 37,

    -- background colors
    blackbg   = 40,
    redbg     = 41,
    greenbg   = 42,
    yellowbg  = 43,
    bluebg    = 44,
    magentabg = 45,
    cyanbg    = 46,
    whitebg   = 47
}

local bg_keys = {
    black = "0",
    blue = "1",
    green = "2",
    aqua = "3",
    red = "4",
    purple = "5",
    yellow = "6",
    white = "7",
    gray = "8",
    light_blue = "9",
    light_green = "a",
    light_aqua = "b",
    light_red = "c",
    light_purple = "d",
    light_yellow = "e",
    bright_white = "f"
}

local colors_lib = {}
local current_foreground, current_background = bg_keys.bright_white, bg_keys.black
os.execute("color " .. current_background .. current_foreground)

function colors_lib.SetColor(text, ...)
    local color = 0
    local color_tbl = table.pack(...)
    
    for _, color_txt in pairs(color_tbl) do
        for i, v in pairs(keys) do if color_txt == i then color = v end end
        text = "\27[" .. color .. "m" .. text .. "\27[0m"
    end
    return text
end

function colors_lib.SetURL(text, url)
    return "\27]8;;" .. url .. "\27\\" .. text .. "\27]8;;\27\\"
end

function colors_lib.SetBackground(color_txt)
    for i, v in pairs(bg_keys) do if color_txt == i then current_background = v end end

    os.execute("color " .. current_background .. current_foreground)
end

function colors_lib.SetForeground(color_txt)
    for i, v in pairs(bg_keys) do if color_txt == i then current_foreground = v end end

    os.execute("color " .. current_background .. current_foreground)
end

function colors_lib.SetAllground(foreground_txt, background_txt)
    for i, v in pairs(bg_keys) do if foreground_txt == i then current_foreground = v end end
    for i, v in pairs(bg_keys) do if background_txt == i then current_background = v end end

    os.execute("color " .. current_background .. current_foreground)
end

return colors_lib
