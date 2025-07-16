local console = {}
local decoration = require("libraries.decoration")
local c, b, f, bf, url = decoration.SetColor, decoration.SetBackground, decoration.SetForeground, decoration
    .SetAllground, decoration.SetURL

function console.SetScene(path)
    local scene = require(path)
    scene.init()
    return true
end

function console.Clear()
    if not pcall(function() os.execute("cls") end) then
        pcall(function() os.execute("clear") end)
    end
    return true
end

function console.Sleep(length)
    local start = os.clock()
    while (os.clock() - start) <= length do end
    return true
end

function console.PrintBlank(num)
    if not num then num = 1 end
    for i = 0, num do print("") end
    return true
end

function console.Scroll(length, lines)
    if not (lines and length) then return end

    local speed = length/lines

    for i=0, lines do
        console.Sleep(speed)
        console.PrintBlank()
    end
end

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

    print("\n" .. breaker .. "\n")

    return response
end

function console.Confirm(question)
    return (console.Prompt(question, "Yes", "No") == 1)
end

return console
