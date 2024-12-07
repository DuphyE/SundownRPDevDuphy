RegisterServerEvent('chat:init')
RegisterServerEvent('chat:addTemplate')
RegisterServerEvent('chat:addMessage')
RegisterServerEvent('chat:addSuggestion')
RegisterServerEvent('chat:removeSuggestion')
RegisterServerEvent('_chat:messageEntered')
RegisterServerEvent('chat:server:ClearChat')
RegisterServerEvent('__cfx_internal:commandFallback')

AddEventHandler('_chat:messageEntered', function(author, color, message)
    if not message or not author then
        return
    end

    TriggerEvent('chatMessage', source, author, message)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, author, {255, 255, 255}, message)
    end
end)

AddEventHandler('__cfx_internal:commandFallback', function(command)
    local name = GetPlayerName(source)

    TriggerEvent('chatMessage', source, name, '/' .. command)

    if not WasEventCanceled() then
        TriggerClientEvent('chatMessage', -1, name, {255, 255, 255}, '/' .. command) 
    end

    CancelEvent()
end)

local function refreshCommands(player)
    if GetRegisteredCommands then
        local registeredCommands = GetRegisteredCommands()

        local suggestions = {}

        for _, command in ipairs(registeredCommands) do
            if IsPlayerAceAllowed(player, ('command.%s'):format(command.name)) then
                table.insert(suggestions, {
                    name = '/' .. command.name,
                    help = ''
                })
            end
        end

        TriggerClientEvent('chat:addSuggestions', player, suggestions)
    end
end

AddEventHandler('onServerResourceStart', function(resName)
    Wait(500)

    for _, player in ipairs(GetPlayers()) do
        refreshCommands(player)
    end
end)

AddEventHandler("chatMessage", function(source, color, message)
    local src = source
    args = stringsplit(message, " ")
    CancelEvent()
    if string.find(args[1], "/") then
        local cmd = args[1]
        table.remove(args, 1)
        TriggerClientEvent('chat:addMessage', src, {
            template = '<div style="padding: 1.1vw; margin: 1.0vw; background-color: rgba(0, 0, 0, 0.7);border-radius:12px;">^0<i class="fa-solid fa-person" size: 5x></i> {0}:<br>{1}</br></div>',
            args = { GetPlayerName(src), "You typed an invalid command" }
        })
    end
end)

commands = {}
commandSuggestions = {}

function starts_with(str, start)
    return str:sub(1, #start) == start
end

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

RegisterCommand('ooc', function(source, args, rawCommand)
    local playerName = GetPlayerName(source)
    local msg = rawCommand:sub(4)
    TriggerClientEvent('chat:addMessage', -1, {
        template = '<div style="padding: 1.1vw; margin: 1.0vw; background-color: rgba(0, 0, 0, 0.7);border-radius:12px;">^0<i class="fa-solid fa-person" size: 5x></i> {0}:<br>{1}</br></div>',
        args = { playerName, msg }
    })
end)

RegisterCommand('clear', function(source)
    local src = source
    TriggerClientEvent('chat:client:ClearChat', src)
end)

RegisterCommand('clearall', function(source)
    if IsPlayerAceAllowed(source, 'chat.clearall') then
        TriggerClientEvent('chat:client:ClearChat', -1)
	end
end)
