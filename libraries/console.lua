local console = {}

function console.SetCursorPosition(y, x)
    if not y then return end
    if not x then x = 0 end

    io.write("\x1b[" .. y .. ";" .. x .. "H")
end

function console.ClearLine(y, x)
    if not x then x = 0 end
    if y then console.SetCursorPosition(y, x) end
    io.write("\x1b[0K")
end

function console.Prompt(question, ...)
    if #... < 1 then return end
    local answers = table.pack(...)

    local response = -1.0
    local text = question .. "\n"

    for i, v in ipairs(answers) do
        text = text .. "[" .. i .. "]" .. v .. "\n"
    end

    text = text .. "\nEnter response: "

    io.write(text)
    while tonumber(response) < 1 or tonumber(response) > #... do
        response = io.read()
        if not tonumber(response) then response = 0 end
        console.ClearLine(debug.getinfo(1).currentline-1)
        response = tonumber(response)
    end

    return response
end

function console.Confirm(question)
    return (console.Prompt(question, "Yes", "No") == 1)
end

return console
