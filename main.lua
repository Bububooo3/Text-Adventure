-- CONFIGURED TO RUN IN WINDOWS COMMAND PROMPT
-- Runs in vscode terminal (etc), looks best in cmd prompt
-- Libraries
local decoration = require("libraries.decoration")
local console = require("libraries.console")
local constants = require("libraries.constants")

-- Define display stuff
local c, b, f, bf, url = decoration.SetColor, decoration.SetBackground, decoration.SetForeground, decoration
    .SetAllground, decoration.SetURL

console.Clear()

console.SetScene("scenes.main_menu")