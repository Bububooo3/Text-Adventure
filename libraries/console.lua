local console = {}
local decoration = require("libraries.decoration")
local constants = require("libraries.constants")
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

function console.center(text)
    local config = io.popen("mode con")
    if not config then return text end

    local mode_output = config:read("*a")
    config:close()

    local width = constants.width
    for line in mode_output:gmatch("[^\r\n]+") do
        if line:match("Columns:") then
            width = tonumber(line:match("%d+"))
            break
        end

        local calc = width - #text
        if calc < 0 then calc = width/4 end

        local padding = string.rep(" ", math.ceil(calc / 2))

        return padding .. text
    end
end

function console.right(text)
    local config = io.popen("mode con")
    if not config then return text end

    local mode_output = config:read("*a")
    config:close()

    local width = constants.width
    for line in mode_output:gmatch("[^\r\n]+") do
        if line:match("Columns:") then
            width = tonumber(line:match("%d+"))
            break
        end

        local calc = width - #text
        if calc < 0 then calc = width/4 end

        local padding = string.rep(" ", math.ceil(calc))

        return padding .. text
    end
end

function console.truncate(text)
    local width = constants.width
    local truncatedString = ""

    if #text > width then
        truncatedString = string.sub(text, 1, width)
    else
        truncatedString = text
    end

    return truncatedString
end

function console.breakline(num)
    if not num then num = 1 end
    for i = 0, num do print("") end
    return true
end

function console.Scroll(lines, length)
    if not lines then return end
    if not length then length = lines / 5 end

    local speed = length / lines
    for i = 0, lines do
        console.breakline()
        console.Sleep(speed)
    end
end

function console.Print(...)
    local msg = table.concat(table.pack(...))
    local spaces = ""

    for i=0, constants.width - string.len(msg) do
        spaces = spaces.." "
    end
    

    print(msg..spaces.."=")
end

function console.Prompt(question, redraw, ...)
    if #... < 1 then return end
    local answers = table.pack(...)

    local response = -1.0
    local text = "|"

    for i, v in ipairs(answers) do
        if string.lower(v) == "yes" then v = c(v, "green") elseif string.lower(v) == "no" then v = c(v, "red") end
        local temp = c("[" .. i .. "] - " .. v, "yellow")
        text = text .. temp
        if next(answers, i) ~= nil then text = text .. " | " end
    end
    local breaker = "="
    for i = 1, math.ceil((string.len(text)) / 2) - 1 do breaker = breaker .. "-=" end
    text = question .. "\n\n" .. console.center(text) .. "\n\nEnter response: "

    while response < 1 or response > #answers do
        print(console.truncate("\n" .. breaker .. "\n"))

        io.write(text)
        response = io.read()
        if not tonumber(response) then response = "0" end
        response = tonumber(response)
        
        if redraw and response < 1 or response > #answers then
            console.Clear(); redraw();
        end
    end

    print(console.truncate("\n" .. breaker .. "\n"))

    return response
end

function console.Confirm(question)
    return (console.Prompt(question, "Yes", "No") == 1)
end

return console
