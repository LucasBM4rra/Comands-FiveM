-- CreateThreadNow(function() -- adicionar na hora
--     print('bom dia')
-- end)

-- CreateThread(function()
--     while false do
--         print('Numero aleatorio' .. math.random())
--         Wait(1000)
--         print('Código voltou')
--     end
-- end)

RegisterCommand('iniciar', function(source, args)
    local scriptName = args[1]
    if scriptName then
        StartResource(scriptName)
        print('Resource' .. scriptName .. 'inicado com sucesso')
    end
end)

RegisterCommand('parar', function(source, args)
    local scriptName = args[1]
    if scriptName then
        StopResource(scriptName)
        print('Resource' .. scriptName .. 'parado com sucesso')
    end
end)

RegisterCommand('reiniciar', function(source, args)
    local scriptName = args[1]
    if scriptName then
        StopResource(scriptName)
        StartResource(scriptName)
        print('Resource' .. scriptName .. 'reiniciado com sucesso')
    end
end)

-- DropPlayer(1, 'Você foi expulso do servidor por fazer anti-roleplay')


-- locais (s > s) (c > c)

-- TriggerEvent(eventName, ...)

-- (c > s)

-- TriggerServerEvent(eventName, ...)

-- (s > c)

-- TriggerClientEvent(eventName, playerId, ...)

RegisterCommand('kuruma', function(source, args)
    TriggerClientEvent('estudos:kuruma', source)

end)

-- toda vez que triga-se um evento de cliente pra server passa-se a source globalmente