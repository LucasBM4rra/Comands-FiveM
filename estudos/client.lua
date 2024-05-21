-- -- Primeiro nativo, criando explosõs

-- -- print('Explosão aplicada com sucesso')
-- -- AddExplosion(-1574.861, 2106.562, 66.52298, 21,  100.0,  true, false, 10.0)

-- -- Conceitos básicos;
-- -- Referenciação de entidades;
-- -- hashKey: é um texto em formato de número;

-- -- Entidades (Entity): veiculos, peds, objetos;
-- -- peds: são bonecos do jogo;

-- -- Referenciar uma entidade

-- -- local text = 'prop_barril_01'
-- -- local hash = GetHashKey(text)
-- -- print(hash)

-- -- todas entidades possuem um DNA, identificador, referencia

-- -- SetPedCoords() -- Ela só funciona em entidades tipo pad
-- -- SetEntityCoords() -- Ela funciona para todos os tipos de entidades

-- -- para descobrir o dna de qualquer entidade, usa-se uma nativa

-- local ped = PlayerPedId()

-- -- SetEntityCoords(
-- -- 	ped, 
-- --     -1574.861, 2106.562, 66.52298
-- -- )

-- -- Dar armas para o ped

-- local weaponHash = GetHashKey('weapon_raypistol')

--[[ -- print("arma dada com sucesso")
-- GiveWeaponToPed(
-- 	ped, 
-- 	weaponHash, 
-- 	1000, 
-- 	false, 
-- 	true
-- ) ]]

-- -- player possui um dna
-- -- player é diferente de PED

--[[ local player = PlayerId()


-- mudar a opacidade do ped

--[[ -- SetEntityAlpha(
-- 	ped, 
-- 	255, 
-- -- 	false
-- -- ) ]]


-- -- deixa o ped invisível

-- -- SetEntityVisible(ped, true)

-- SetEntityInvincible(ped, true)

-- --[[ RegisterCommand('voar', function()
--     local coords = GetEntityCoords(ped)
--     SetEntityCoords(ped, coords+10)
-- end) ]]

--[[ function get_random_coordinate(coordinates)

    local random_index = math.random(1, #coordinates)

    return coordinates[random_index]
end

local coordenadas = {
    {x = 5.727959, y = 6326.416, z = 31.23888},
    {x = 3.509399, y = 6329.986, z = 31.23897},
    {x = -1.165564, y = 6329.743, z = 31.238},
    {x = -6.767714, y = 6326.808, z = 31.23682}
}

CreateThread(function()
    while false do

        local coordenada_aleatoria = get_random_coordinate(coordenadas)

        StartPlayerTeleport(
            player, 
            coordenada_aleatoria.x, 
            coordenada_aleatoria.y, 
            coordenada_aleatoria.z, 
            false, 
            false, 
            false
        )


        Wait(3000) 
    end
end)
]]


RegisterCommand('removerArmas', function()
    local ped = PlayerPedId()
    local player = PlayerId()
    RemoveAllPedWeapons(ped, true)
    print('Armas removidas com sucesso')
end)

RegisterCommand('mk2', function()
    local ped = PlayerPedId()
    local player = PlayerId()
    local weaponHash = GetHashKey('weapon_assaultrifle_mk2')
    GiveWeaponToPed(
	ped, 
	weaponHash, 
	1000, 
	false, 
	true
)

print('Arma dada com sucesso')
end)

RegisterCommand('attachs', function()
    local ped = PlayerPedId()
    local player = PlayerId()

    local weaponHash = GetHashKey('weapon_assaultrifle_mk2')
    GiveWeaponComponentToPed(ped, weaponHash, GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CAMO_10'))
    GiveWeaponComponentToPed(ped, weaponHash, GetHashKey('COMPONENT_ASSAULTRIFLE_MK2_CLIP_02'))
    GiveWeaponComponentToPed(ped, weaponHash, GetHashKey('COMPONENT_AT_SCOPE_MACRO_MK2'))
    GiveWeaponComponentToPed(ped, weaponHash, GetHashKey('COMPONENT_AT_AR_BARREL_02'))

    print('componentes adicionados com sucesso')
end)

RegisterCommand('imortal', function()
    local ped = PlayerPedId()
    local player = PlayerId()
    SetEntityInvincible(ped, true)
    print('Imortalidade ativada com sucesso')
end)

RegisterCommand('mortal', function()
    local ped = PlayerPedId()
    local player = PlayerId()
    SetEntityInvincible(ped, false)
    print('Imortalidade desativada com sucesso')
end) 

RegisterCommand('tpcds', function(source, args)
    local player = PlayerId()
    local ped = PlayerPedId()
    local x, y, z = tonumber(args[1]), tonumber(args[2]), tonumber(args[3])
    SetEntityCoords(ped, x, y, z)
end)

RegisterCommand('escape', function()
    local ped = PlayerPedId()
    local player = PlayerId()
    SetPlayerWantedLevel(
	player, 
	0
) 
SetPlayerWantedLevelNow(player, true) 
end)

-- RegisterCommand('kuruma', function()
--     local ped = PlayerPedId()
--     local player = PlayerId()
--     local vehicleHash = GetHashKey('kuruma')

--     RequestModel(vehicleHash)

--     while not HasModelLoaded(vehicleHash) do
--         Wait(0)
--     end

--     local coords = GetEntityCoords(ped)
--     local heading = GetEntityHeading(ped)
    
--     vehicle = CreateVehicle(
-- 		vehicleHash, 
--         coords,
-- 		heading, 
-- 		true, 
-- 		true
-- 	)

--     SetModelAsNoLongerNeeded(vehicleHash)

--     SetPedIntoVehicle(ped, vehicle, -1)

--     print('Veiculo gerado com sucesso')
-- end)

RegisterCommand('tunning', function()
    local ped = PlayerPedId()
    local player = PlayerId()
    SetVehicleCustomPrimaryColour(vehicle, 148, 0, 211)
    SetVehicleNeonLightsColour(vehicle, 148, 0, 211)
    SetVehicleNeonLightEnabled(vehicle, 0, true)
    SetVehicleNeonLightEnabled(vehicle, 1, true)
    SetVehicleNeonLightEnabled(vehicle, 2, true)
    SetVehicleNeonLightEnabled(vehicle, 3, true)
    SetVehicleDirtLevel(vehicle, 0)
end)

-- RegisterCommand('dv', function()
--     local ped = PlayerPedId()
--     local player = PlayerId()
--     DeleteVehicle(vehicle)
--     print('Veiculo deletado com sucesso')
-- end)

RegisterCommand('ped', function()
    local ped = PlayerPedId()
    local player = PlayerId()
    local pedHash = GetHashKey('a_m_m_acult_01')

    RequestModel(pedHash)

    while not HasModelLoaded(pedHash) do
        Wait(0)
    end
    
    Npc  = CreatePed(
		4, 
		pedHash, 
        -1865.63, 2090.548, 140.2076, 
		0.0, 
		true, 
		false
	)

    SetModelAsNoLongerNeeded(pedHash)

    GiveWeaponToPed(Npc, GetHashKey('weapon_assaultrifle_mk2'), 1000, false, true)

    TaskShootAtEntity(Npc, ped, -1 , 2685983626)

    print('Npc gerado com sucesso')
end)

-- CreateThread(function()
--     while true do
--         local retval = IsControlJustPressed(0, 38)
--         if retval then
--             print('Botão pressionado com sucesso')
--         end
--         Wait(0)
--     end
-- end)

-- RegisterCommand('clique1', function()
--     print("Pressionado com sucesso 2")
-- end) 

-- RegisterCommand('+clique2', function()
--     print("[keymapping]Pressionado com sucesso")
-- end)

-- RegisterCommand('-clique2', function()
--     print("[keymapping]Soltada com sucesso")
-- end)

-- RegisterKeyMapping(
-- 	'clique1', 
-- 	'Avisa quando a tecla é pressioanda', 
-- 	'keyboard', 
-- 	'E'
-- )

-- RegisterKeyMapping(
-- 	'+clique2', 
-- 	'Avisa quando a tecla é pressioanda e solta', 
-- 	'keyboard', 
-- 	'E'
-- )

-- RegisterCommand('e',function(source, args)
--         if args[1] == 'mexer' then
    
--             local animDict = 'amb@prop_human_parking_meter@female@idle_a'
--             RequestAnimDict(animDict)
        
--             while not HasAnimDictLoaded(animDict) do
--                 Wait(100)
--             end
        
--             local ped = PlayerPedId()
            
--             TaskPlayAnim(ped, animDict, 'idle_a_female', 8.0, 8.0, -1, 1, 1.0)
            
--         end
    
--     end)
    
    
    RegisterCommand('cleartasks', function()
        ClearPedTasks(PlayerPedId())
    end)
    
    RegisterKeyMapping('cleartasks', 'Parar de fazer animação', 'keyboard', 'F6')

function notify(message)
    BeginTextCommandThefeedPost("STRING")
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandThefeedPostTicker(true, true)
end

function playFarmAnim()

    local animDict = 'amb@prop_human_parking_meter@female@idle_a'
    RequestAnimDict(animDict)

    while not HasAnimDictLoaded(animDict) do
        Wait(100)
    end

    local ped = PlayerPedId()
    
    TaskPlayAnim(ped, animDict, 'idle_a_female', 8.0, 8.0, -1, 1, 1.0)

end

local farmCoords = vec3(2465.217, 3765.53,  41.11699)

CreateThread(function()
    while true do
        DrawMarker(22, farmCoords, 0, 0, 0, 0, 0, 0, 0.4, 0.4, 0.4, 255, 0, 0, 255, false, false, false, true)
        local pedCoords = GetEntityCoords(PlayerPedId())
        local distance = #(farmCoords - pedCoords)
        if distance < 1.0 and IsControlJustPressed(0, 38) then
            notify('~y~Aguarde 5 segundos!')
            playFarmAnim()
            Wait(5000)
            ClearPedTasks(PlayerPedId())
            notify('~g~Você recebeu R$5.000')
        end
        Wait(0)
    end
    print("blip adicionado com sucesso")
end)

RegisterCommand('dv', function()
    local ped = PlayerPedId()
    if IsPedInAnyVehicle(ped) then
        local vehicle = GetVehiclePedIsIn(ped)
        SetEntityAsMissionEntity(entity, true, true)
        DeleteVehicle(vehicle)
        notify('~g~Veiculo deletado com sucesso')
    else
        notify('~r~Você não está em um veiculo')
    end

end)

RegisterCommand('beber', function()
    local animDict = 'amb@world_human_drinking@beer@male@idle_a'
    local animName = 'idle_a'

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Wait(100)
    end

    local model = GetHashKey('p_cs_bottle_01')
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end

    local ped = PlayerPedId()

    local object = CreateObject(model, GetEntityCoords(ped)+1, true)

    notify('~b~Bebendo...')

    AttachEntityToEntity(object, ped, GetPedBoneIndex(ped, 0x6F06), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, nil, true, true, false, true, true)

    TaskPlayAnim(ped, animDict, animName, 8.0, 8.0, -1, 11, 1.0)

    Wait(5000)

    ClearPedTasks(ped)
    SetEntityAsMissionEntity(object, true, true)
    DeleteObject(object)
    notify('~b~Bebeu com sucesso, agora está com energia')

end)

RegisterCommand('colete', function(source, args)
    local amountArmour = tonumber(args[1])
    if amountArmour then 
        local ped = PlayerPedId()
        SetPedArmour(ped, amountArmour)
        print('Coleto setado para '.. amountArmour)
    else 
        notify('~r~Valor inválido!')
    end

end)

local isCrouched = false

CreateThread(function()
    while true do
        DisableControlAction(0, 36)
        local ped = PlayerPedId()

        if IsDisabledControlJustPressed(0, 36) then
            if not isCrouched then
                local movementeClipset = 'move_ped_crouched'
                RequestAnimSet(movementeClipset)
                while not HasAnimSetLoaded(movementeClipset) do 
                    Wait(0)
                end
                SetPedMovementClipset(ped, movementeClipset, 0.2)
                isCrouched = true
            else
                ResetPedMovementClipset(ped, 0.2)
                isCrouched = false
            end
        end
        Wait(0)
    end

end)    

RegisterNetEvent('estudos:kuruma', function()
    local ped = PlayerPedId()
    local player = PlayerId()
    local vehicleHash = GetHashKey('kuruma')

    RequestModel(vehicleHash)

    while not HasModelLoaded(vehicleHash) do
        Wait(0)
    end

    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)
    
    vehicle = CreateVehicle(
		vehicleHash, 
        coords,
		heading, 
		true, 
		true
	)

    SetModelAsNoLongerNeeded(vehicleHash)

    SetPedIntoVehicle(ped, vehicle, -1)

    print('Veiculo gerado com sucesso')

end)

AddEventHandler('estudos:eventoTeste', function(mensagem)
    print(mensagem)

end)

TriggerEvent('estudos:eventoTeste', 'bom dia amigo')

