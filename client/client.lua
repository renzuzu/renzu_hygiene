local antiodor = false
odor = 10
pee = 50
poo = 50

LoadModel = function(model)
	while not HasModelLoaded(model) do
		RequestModel(model)
		print("loading")
		Citizen.Wait(1)
	end
end

Citizen.CreateThread(function()
    Wait(1000)
    while true do
        local sleep = 3000
        local ped = PlayerPedId()
        local myCoords = GetEntityCoords(ped)
        if IsEntityInWater(ped) then
            sleep = 500
            local table = {
                ['key'] = 'E', -- key
                ['event'] = 'renzu_hygiene:Wash',
                ['title'] = 'Press [E] Wash your Self',
                ['server_event'] = false, -- server event or client
                ['unpack_arg'] = false, -- send args as unpack 1,2,3,4 order
                ['fa'] = '<i class="fas fa-shower"></i>',
                ['custom_arg'] = {}, -- example: {1,2,3,4}
            }
            TriggerEvent('renzu_popui:drawtextuiwithinput',table)
            while IsEntityInWater(ped) do
                Wait(500)
            end
            TriggerEvent('renzu_popui:closeui')
        end
        Citizen.Wait(sleep)
    end
end)

Citizen.CreateThread(function()
    Wait(100)
    if config.testcommand then
        RegisterCommand('toilet', function()
            local wheelchair = CreateObject(GetHashKey('prop_toilet_01'), GetEntityCoords(PlayerPedId()), true)
            PlaceObjectOnGroundProperly(wheelchair)
            FreezeEntityPosition(wheelchair, true)
        end, false)

        RegisterCommand('shower', function()
            --LoadModel('boxing')
            LoadModel('ligoshower')
            local wheelchair = CreateObject(GetHashKey('ligoshower'), GetEntityCoords(PlayerPedId()), true)
            PlaceObjectOnGroundProperly(wheelchair)
            FreezeEntityPosition(wheelchair, true)
        end, false)
    end
end)

Citizen.CreateThread(function()
    Wait(1000)
    if config.enablepropbase then
        while true do
            local sleep = 3000
            local ped = PlayerPedId()
            local myCoords = GetEntityCoords(ped)
            for k,v in pairs(config.showerprop) do
                local shower = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 2.0, GetHashKey(v))
                if shower ~= 0 then
                    sleep = 500
                    local showerpos = GetEntityCoords(shower)
                    showerpos = vector3(showerpos.x,showerpos.y,showerpos.z+0.2)
                    distance = #(GetEntityCoords(PlayerPedId()) - showerpos)
                    if distance <= 2 then
                        local table = {
                            ['key'] = 'E', -- key
                            ['event'] = 'renzu_hygiene:takeshower',
                            ['title'] = 'Press [E] Take a Shower',
                            ['server_event'] = false, -- server event or client
                            ['unpack_arg'] = true, -- send args as unpack 1,2,3,4 order
                            ['fa'] = '<i class="fas fa-shower"></i>',
                            ['custom_arg'] = {ped,false,false,shower}, -- example: {1,2,3,4}
                        }
                        TriggerEvent('renzu_popui:drawtextuiwithinput',table)
                        while distance <= 3.4 do
                            distance = #(GetEntityCoords(PlayerPedId()) - showerpos)
                            Wait(500)
                        end
                        TriggerEvent('renzu_popui:closeui')
                    end
                end
            end
            Citizen.Wait(sleep)
        end
    end
end)

Citizen.CreateThread(function()
    Wait(1000)
    if config.enablepropbase then
        while true do
            local sleep = 3000
            local ped = PlayerPedId()
            local myCoords = GetEntityCoords(ped)
            for k,v in pairs(config.toiletprop) do
                local toilet = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 2.0, GetHashKey(v))
                if toilet ~= 0 then
                    sleep = 500
                    local showerpos = GetEntityCoords(toilet)
                    showerpos = vector3(showerpos.x,showerpos.y,showerpos.z+0.2)
                    distance = #(GetEntityCoords(PlayerPedId()) - showerpos)
                    if distance <= 2 then
                        local table = {
                            ['key'] = 'E', -- key
                            ['event'] = 'renzu_hygiene:takepoop',
                            ['title'] = 'Press [E] Take a Poop',
                            ['server_event'] = false, -- server event or client
                            ['unpack_arg'] = true, -- send args as unpack 1,2,3,4 order
                            ['fa'] = '<i class="fad fa-poop"></i>',
                            ['custom_arg'] = {ped,false,toilet}, -- example: {1,2,3,4}
                        }
                        TriggerEvent('renzu_popui:drawtextuiwithinput',table)
                        while distance <= 3.4 do
                            distance = #(GetEntityCoords(PlayerPedId()) - showerpos)
                            Wait(500)
                        end
                        TriggerEvent('renzu_popui:closeui')
                    end
                end
            end
            Citizen.Wait(sleep)
        end
    end
end)

local text = "Take Shower [E]"

CreateThread(function()
    Wait(1000)
    while true do
        local sleep = 2000
        local plyPed = PlayerPedId()
        local plyPos = GetEntityCoords(plyPed)
        for i = 1, #showers do
            local showerpos = showers[i].pos

            local distance = GetDistance(plyPos, showerpos)
            if distance < 1.4 then
                showerpos = vector3(showerpos.x,showerpos.y,showerpos.z+0.2)
                local table = {
                    ['key'] = 'E', -- key
                    ['event'] = 'renzu_hygiene:takeshower',
                    ['title'] = 'Press [E] Take a Shower',
                    ['server_event'] = false, -- server event or client
                    ['unpack_arg'] = true, -- send args as unpack 1,2,3,4 order
                    ['fa'] = '<i class="fas fa-shower"></i>',
                    ['custom_arg'] = {plyPed,showerpos,showers[i]}, -- example: {1,2,3,4}
                }
                TriggerEvent('renzu_popui:drawtextuiwithinput',table)
                while distance <= 3.2 do
                    distance = GetDistance(GetEntityCoords(plyPed), showerpos)
                    Wait(500)
                end
                TriggerEvent('renzu_popui:closeui')
            end
        end
        Citizen.Wait(sleep)
    end
end)

local text = "Wash Face [E]"
CreateThread(function()
    Wait(1000)
    while true do
        local sleep = 2000
        local plyPed = PlayerPedId()
        local plyPos = GetEntityCoords(plyPed)
        for i = 1, #washface do
            local showerpos = washface[i].pos

            local distance = GetDistance(plyPos, showerpos)
            if distance < 1.5 then
                sleep = 0
                showerpos = vector3(showerpos.x,showerpos.y,showerpos.z+0.3)
                local table = {
                    ['key'] = 'E', -- key
                    ['event'] = 'renzu_hygiene:WashFace',
                    ['title'] = 'Press [E] Wash Face',
                    ['server_event'] = false, -- server event or client
                    ['unpack_arg'] = true, -- send args as unpack 1,2,3,4 order
                    ['fa'] = '<i class="fad fa-hands-wash"></i>',
                    ['custom_arg'] = {washface[i].h}, -- example: {1,2,3,4}
                }
                TriggerEvent('renzu_popui:drawtextuiwithinput',table)
                while distance <= 3.2 do
                    distance = GetDistance(GetEntityCoords(plyPed), showerpos)
                    Wait(500)
                end
                TriggerEvent('renzu_popui:closeui')
            end
        end
        Citizen.Wait(sleep)
    end
end)

CreateThread(function()
    Citizen.Wait(1000)
    while true do
        local sleep = 2000
        local plyPed = PlayerPedId()
        local PlayerPed = PlayerPedId()
        text = "Take a Poo [E]"
        local plyPos = GetEntityCoords(plyPed)
        for i = 1, #tae do
            local showerpos = tae[i].pos

            local distance = GetDistance(plyPos, showerpos)

            if distance < 1.1 then
                sleep = 0
                showerpos = vector3(showerpos.x,showerpos.y,showerpos.z+0.3)
                if GetEntityModel(PlayerPed) == -1667301416 then
                    text = "Take a Poo [E] / Take a Pee [SPACE]"
                end
                local table = {
                    ['key'] = 'E', -- key
                    ['event'] = 'renzu_hygiene:takepoop',
                    ['title'] = 'Press [E] Take a Poop',
                    ['server_event'] = false, -- server event or client
                    ['unpack_arg'] = true, -- send args as unpack 1,2,3,4 order
                    ['fa'] = '<i class="fad fa-poop"></i>',
                    ['custom_arg'] = {plyPed,tae[i]}, -- example: {1,2,3,4}
                }
                TriggerEvent('renzu_popui:drawtextuiwithinput',table)
                while distance <= 3.2 do
                    distance = GetDistance(GetEntityCoords(plyPed), showerpos)
                    Wait(500)
                end
                TriggerEvent('renzu_popui:closeui')
            end
        end
        Citizen.Wait(sleep)
    end
end)

function GetDistance(coords1, coords2)
    return #(coords1 - coords2)
end

function LoadDict(dict)
    RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
	  	Citizen.Wait(10)
    end
end

function StopAllParticles(actualZone)
    local mycoords = GetEntityCoords(PlayerPedId())
    for _,particle in pairs(sparticleEffects) do
		StopParticleFxLooped(particle, true)
        RemoveParticleFx(particle, 0)
        Citizen.Wait(0)
	end
	RemoveParticleFxFromEntity(PlayerPedId())
    RemoveParticleFxInRange(mycoords.x,mycoords.y,mycoords.z)
end

function playsound(ecoord,max,file,maxvol)
	local volume = maxvol
	local mycoord = GetEntityCoords(PlayerPedId())
	local distIs  = tonumber(string.format("%.1f", #(mycoord - ecoord)))
	if (distIs <= max) then
		distPerc = distIs / max
		volume = (1-distPerc) * maxvol
		local table = {
			['file'] = file,
			['volume'] = volume
		}
		SendNUIMessage({
			type = "playsound",
			content = table
		})
	end
end

function LoadAnim(dict)
    while not HasAnimDictLoaded(dict) do
      RequestAnimDict(dict)
      Wait(10)
    end
end

--TriggerServerEvent('renzu_hygiene:peesync', sex)

RegisterCommand('pee', function()
    local PlayerPed = PlayerPedId()
    if GetEntityModel(PlayerPed) == -1667301416 then
    sex = 'female'
    else
    sex = 'male'
    end

    local particleDictionary = "core"
    local particleName = "ent_amb_peeing"
    local animDictionary = 'misscarsteal2peeing'
    local animName = 'peeing_loop'

    local mycoords = GetEntityCoords(PlayerPedId())
	local loopAmount = 0
	createdParticle = {}
	local asset = "core"
	local particleName = 'ent_amb_peeing'
	RequestNamedPtfxAsset(asset)

	while not HasNamedPtfxAssetLoaded(asset) do
		Wait(100)
	end
	local particleEffects = {}
    if sex == 'male' then
        RequestAnimDict(animDictionary)
        while not HasAnimDictLoaded(animDictionary) do
            Citizen.Wait(0)
        end
        TaskPlayAnim(PlayerPed, animDictionary, animName, 8.0, -8.0, 18.0, 0, 0, false, false, false)
        TriggerServerEvent('renzu_hygiene:peesync', sex)
        Wait(2000)
        TriggerEvent('esx_status:add', config.peestatus, 1000000)
    end
    if sex == 'female' then
        if not ebak then
            ebak = true
            --SetEntityHeading(plyPed, s.h)
            local PlayerPed = PlayerPedId()
            if sex == 'female' then
                BehindPlayer = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0 + 0.7, -0.5)
                ClearPedTasks(PlayerPed)
                TaskStartScenarioAtPosition(PlayerPed, 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER', BehindPlayer['x'], BehindPlayer['y'], BehindPlayer['z'], GetEntityHeading(PlayerPedId()) - 180, 0, 1, false)
            end
            Citizen.Wait(2000)
            TriggerServerEvent('renzu_hygiene:peesync', sex)
            Citizen.Wait(10000)
            pee = 0
            Citizen.Wait(2222)
            ebak = false
            ClearPedTasks(PlayerPed)
            TriggerEvent('esx_status:add', config.peestatus, 1000000)
        end
    end
end, false)