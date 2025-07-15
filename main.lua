-- CONFIGURED TO RUN IN WINDOWS COMMAND PROMPT
-- Runs in vscode terminal (etc), looks best in cmd prompt

pcall(function() os.execute("cls") end)

-- Libraries
local decoration = require("libraries.decoration")
local readwrite = require("libraries.readwrite")

-- Handle display stuff
local c, b, f, bf, url = decoration.SetColor, decoration.SetBackground, decoration.SetForeground, decoration.SetAllground, decoration.SetURL


-- f("green")
print("Hi, my name is " .. c("Richard", "blink", "yellow", "underline") .. "!")
print("hi")



if response == "1" then
    print("Go to: " .. c(url("Lua.org", "https://lua.org"), "cyan"))
end
