-- CONFIGURED TO RUN IN WINDOWS COMMAND PROMPT
-- Runs in vscode terminal (etc), looks best in cmd prompt

pcall(function() os.execute("cls") end)

-- Libraries
local decoration = require("libraries.decoration")
local console = require("libraries.console")

-- Handle display stuff
local c, b, f, bf, url = decoration.SetColor, decoration.SetBackground, decoration.SetForeground, decoration.SetAllground, decoration.SetURL


-- f("green")
print("Hi, my name is " .. c("Richard", "blink", "yellow", "underline") .. "!")
print("hi")

local see_lua = console.Confirm("Would you like to learn more about the Lua programming language?")

if see_lua then
    print("Go to: " .. c(url("Lua.org", "https://lua.org"), "cyan"))
end
