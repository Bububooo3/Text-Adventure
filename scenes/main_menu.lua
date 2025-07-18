local main_menu = {}

-- Libraries
local decoration = require("libraries.decoration")
local console = require("libraries.console")
local constants = require("libraries.constants")

-- Define display stuff
local c, b, f, bf, url = decoration.SetColor, decoration.SetBackground, decoration.SetForeground, decoration
    .SetAllground, decoration.SetURL

function main_menu.refresh()
    console.Clear()
    print(c(constants.title_art, "yellow", "blink"))

    print("\n"..console.center(constants.tooltips[math.random(1, #constants.tooltips)]))
end

function main_menu.init()
    console.Clear()
    print("\n"..c(constants.title_art, "yellow", "blink").."\n")
    print(console.center(constants.tooltips[math.random(1, #constants.tooltips)]))
    console.Prompt("", main_menu.refresh, "Play", "Settings", "Help", "Credits")
end

return main_menu
