local main_menu = {}

-- Libraries
local decoration = require("libraries.decoration")
local console = require("libraries.console")
local constants = require("libraries.constants")

-- Define display stuff
local c, b, f, bf, url = decoration.SetColor, decoration.SetBackground, decoration.SetForeground, decoration
    .SetAllground, decoration.SetURL

function main_menu.init()
    print(console.center(c(constants.title_art, "yellow", "blink")))

    print(console.center(constants.tooltips[math.random(1, #constants.tooltips)]))
    console.Prompt("", "Play", "Settings", "Help", "Credits")
end

return main_menu
