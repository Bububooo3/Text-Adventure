local readwrite = {}

function readwrite.Prompt(question, ...)
    if #... < 1 then return end
    local answers = table.pack(...)

    local response = -1
    local text = question .. "\n"

    for i, v in ipairs(answers) do
        text = text .. "[" .. i .. "]" .. v .. "\n"
    end

    text = text .. "\nEnter response: "

    io.write(text)
    while tonumber(response) < 1 or tonumber(response) > #... do response = io.read() end

    return response
end

function readwrite.Confirm(question)
    return (readwrite.Prompt(question, "Yes", "No") == 1)
end

return readwrite
