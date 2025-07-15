-- CONFIGURED TO RUN IN WINDOWS COMMAND PROMPT
-- Runs in vscode (etc), looks better in cmd prompt

-- Handle display stuff
local colors = require("libraries.colors")
local c, b, f, bf, url = colors.SetColor, colors.SetBackground, colors.SetForeground, colors.SetAllground, colors.SetURL

-- f("green")
print("Hi, my name is "..c("Richard", {"blink", "red", "underline"}).."!")
print("hi")
print("Go to: "..c(url("Lua.org", "https://lua.org"), {"blink"}))