local console = {}
local decoration = require("libraries.decoration")
local c, b, f, bf, url = decoration.SetColor, decoration.SetBackground, decoration.SetForeground, decoration
    .SetAllground, decoration.SetURL

function console.Prompt(question, ...)
    if #... < 1 then return end
    local answers = table.pack(...)

    local response = -1.0
    local text = "\n\n|"

    for i, v in ipairs(answers) do
        if string.lower(v) == "yes" then v = c(v, "green") elseif string.lower(v) == "no" then v = c(v, "red") end
        local temp = c("[" .. i .. "] - " .. v, "yellow")
        text = text .. temp
        if next(answers, i) ~= nil then text = text .. " | " end
    end
    local breaker = "="
    for i = 1, math.ceil((string.len(text)) / 2) - 1 do breaker = breaker .. "-=" end
    text = question .. text .. "\n\nEnter response: "

    while response < 1 or response > #answers do
        print("\n" .. breaker .. "\n")

        io.write(text)
        response = io.read()
        if not tonumber(response) then response = 0 end
        response = tonumber(response)
    end

    return response
end

function console.Confirm(question)
    return (console.Prompt(question, "Yes", "No") == 1)
end

return console
