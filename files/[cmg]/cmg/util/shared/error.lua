local function TriggerErrorEvent(trace, variables)
    if IsDuplicityVersion() then
        TriggerEvent("CMG:serverIssue", string.gsub(trace, ":(.*)", ""), trace, variables, false)
    else
        TriggerServerEvent("CMG:clientIssue", string.gsub(trace, ":(.*)", ""), trace, variables, false)
    end
end

local function formatStackTrace(stack)
    local traces = {}
    for trace in string.gmatch(stack, "([^\n]+)\n%s*") do
        if not string.match(trace, "__newindex") and not string.match(trace, "errorHandler") and not string.match(trace, "handler") and not string.match(trace, "error.lua") then
            table.insert(traces, string.format("%s\n", trace))
        end
    end
    return table.concat(traces)
end

local function formatTableName(tableRef)
    local strTableAddress = string.gsub(tostring(tableRef), "table: ", "")
    local hexTableAddress = string.format("%x", tonumber(strTableAddress, 16))
    return "0x" .. string.upper(hexTableAddress)
end

local function formatVariable(value)
    local varType = type(value)
    if varType == "vector3" then
        return string.format("vector3(%s, %s, %s)", value.x, value.y, value.z)
    elseif varType == "vector2" then
        return string.format("vector2(%s, %s)", value.x, value.y)
    elseif varType == "string" then
        return string.format("\"%s\"", value)
    elseif varType == "table" then
        return formatTableName(value)
    else
        return tostring(value)
    end
end

local function formatStackVariables()
    local variables = ""
    local tableRefs = {}
    local level = 1
    while debug.getinfo(level + 2) do
        local levelInfo = debug.getinfo(level + 2)
        if not string.match(levelInfo.source, "error.lua") and not string.match(levelInfo.source, "scheduler.lua") then
            local localIndex = 1
            local createdHeader = false
            while true do
                local name, value = debug.getlocal(level + 2, localIndex)
                if name then
                    if type(value) == "table" then
                        if not table.has(tableRefs, value) then
                            table.insert(tableRefs, value)
                        end
                    end
                    value = formatVariable(value)
                    if name ~= "(*temporary)" and not string.match(name, "%(for ") then
                        if not createdHeader then
                            variables = variables .. string.format("\n**Call Stack %d (%s)**```", level, levelInfo.name or "Unknown Function")
                            createdHeader = true
                        end
                        if #value > 500 then
                            value = "Exceeds Maximum Length"
                        end
                        variables = variables .. "\n" .. name .. ": " .. value
                    end
                    localIndex = localIndex + 1
                else
                    break
                end
            end
            if createdHeader then
                variables = variables .. "```"
            end
        end
        level = level + 1
    end
    local createdMemoryHeader = false
    for _, tableRef in pairs(tableRefs) do
        local tableName = formatTableName(tableRef)
        local numRefs = select(2, string.gsub(variables, tableName, ""))
        local value = json.encode(tableRef)
        if #variables + #value > 3500 then
            value = "Exceeds Maximum Length"
        end
        if numRefs >= 1 then
            if not createdMemoryHeader then
                variables = variables .. "\n**Table References**```"
                createdMemoryHeader = true
            end
            variables = variables .. tableName .. ": " .. value .. "\n\n"
        end
    end
    if createdMemoryHeader then
        variables = variables .. "```"
    end
    return variables
end

local function errorHandler(callback, ...)
    local success, data = xpcall(callback, function(message)
        local stack = Citizen.InvokeNative(0xD70C3BCA, nil, 0, Citizen.ResultAsString())
        if stack then
            local formattedTrace = string.format("^1%s\n%s^7", message, formatStackTrace(stack))
            local formattedVariables = formatStackVariables()
            return {formattedTrace, formattedVariables}
        end
        return {message, nil}
    end, ...)
    if not success and data then
        TriggerErrorEvent(data[1], data[2])
        print(data[1])
    end
end

local origCitizenTrace = Citizen.Trace

Citizen.Trace = function(data)
    if string.match(data, "ERROR") or string.match(data, "Error") or string.match(data, "error") then
        TriggerErrorEvent(data, nil)
    end
    origCitizenTrace(data)
end

local origCitizenCreateThread = Citizen.CreateThread

Citizen.CreateThread = function(callback)
    origCitizenCreateThread(function()
        errorHandler(callback)
    end)
end

local origAddEventHandler = AddEventHandler

AddEventHandler = function(name, callback)
    return origAddEventHandler(name, function(...)
        errorHandler(callback, ...)
    end)
end

local origRegisterNetEvent = RegisterNetEvent

RegisterNetEvent = function(name, callback)
    if callback then
        return origRegisterNetEvent(name, function(...)
            errorHandler(callback, ...)
        end)
    else
        return origRegisterNetEvent(name)
    end
end

function CMG.logError(title, body, data)
    if data then
        data = "```" .. data .. "```"
    end
    if IsDuplicityVersion() then
        TriggerEvent("CMG:serverIssue", title, body, data, true)
    else
        TriggerServerEvent("CMG:clientIssue", title, body, data, true)
    end
end

local isHalloween = GetConvarInt("cmg_halloween", 0) == 1
function CMG.isHalloween()
    return isHalloween
end

local isChristmas = GetConvarInt("cmg_christmas", 0) == 1
function CMG.isChristmas()
    return isChristmas
end

local isPurge = GetConvarInt("cmg_purge", 0) == 1
function CMG.isPurge()
    return isPurge
end