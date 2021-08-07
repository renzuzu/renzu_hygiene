local antiodor = false
odor = 10
pee = 50
poo = 50

Citizen.CreateThread(function()
    while true do
        local sleep = 3000
        local ped = PlayerPedId()
        local myCoords = GetEntityCoords(GetPlayerPed(-1))
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

local text = "Take Shower [E]"

CreateThread(function()
    while true do
        local sleep = 2000
        local plyPed = PlayerPedId()
        for i = 1, #showers do
            local plyPos = GetEntityCoords(plyPed)
            local showerpos = showers[i].pos

            local distance = GetDistance(plyPos, showerpos)
            if distance < 1.2 then
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
                while distance <= 1.2 do
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
    while true do
        local sleep = 2000
        local plyPed = PlayerPedId()
        for i = 1, #washface do
        local plyPos = GetEntityCoords(plyPed)
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
                while distance <= 1.2 do
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
        for i = 1, #tae do
            local plyPos = GetEntityCoords(plyPed)
            local showerpos = tae[i].pos

            local distance = GetDistance(plyPos, showerpos)

            if distance < 1.0 then
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
                while distance <= 1.2 do
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

function Poop2(c,coord)
    --local Player = ped
    local PlayerPed = GetPlayerPed(-1)
    SetEntityHeading(PlayerPed, c + 7.0)
    if sex == 'female' then
        ExecuteCommand("e sitchair")
    else
        ExecuteCommand("e sitchair4")
    end
    Citizen.Wait(1000)
    if GetEntityModel(PlayerPed) == -1667301416 then
        sex = 'female'
    else
        sex = 'male'
    end
    local mycoords = GetEntityCoords(PlayerPedId())
	local loopAmount = 5
	createdParticle = {}
	local asset = "scr_amb_chop"
	local particleName = 'ent_anim_dog_poo'
	RequestNamedPtfxAsset(asset)

	while not HasNamedPtfxAssetLoaded(asset) do
		Wait(100)
	end
	local particleEffects = {}
	for x=0,loopAmount do
		UseParticleFxAssetNextCall(asset)
        bone = GetPedBoneIndex(PlayerPed, 11816)
        if sex == 'male' then
        z = -0.7
        y = -0.6
        elseif sex == 'female' then
        z = 0.45
        y = 0.05
        end
        local particle = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0,  y, z, 0.0, 0.0, 20.0, bone, 1.5, false, false, false)
		table.insert(particleEffects, 1, particle)
		Citizen.Wait(500)
	end

    Citizen.Wait(15000)
    ClearPedTasks(PlayerPed)
    done = true
    distance = GetDistance(GetEntityCoords(plyPed), coord)
    while done do
        local table = {
            ['key'] = 'E', -- key
            ['event'] = 'renzu_hygiene:flush',
            ['title'] = 'Press [E] Flush The Toilet',
            ['server_event'] = true, -- server event or client
            ['unpack_arg'] = true, -- send args as unpack 1,2,3,4 order
            ['fa'] = '<i class="fad fa-toilet"></i>',
            ['custom_arg'] = {}, -- example: {1,2,3,4}
        }
        TriggerEvent('renzu_popui:drawtextuiwithinput',table)
        while distance <= 2.2 do
            distance = GetDistance(GetEntityCoords(plyPed), coord)
            Wait(500)
        end
        TriggerEvent('renzu_popui:closeui')
        Citizen.Wait(500)
    end
	for _,particle in pairs(particleEffects) do
		StopParticleFxLooped(particle, true)
		RemoveParticleFx(particle, 0)
	end
	RemoveParticleFxFromEntity(PlayerPedId())
    RemoveParticleFxInRange(mycoords.x,mycoords.y,mycoords.z)
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

RegisterCommand('shower', function()
    if GetEntityModel(plyPed) == -1667301416 then
        LoadDict("mp_safehouseshower@female@")
        LoadDict("anim@mp_yacht@shower@female@")
    else
        LoadDict("amb@world_human_bum_wash@male@high@idle_a")
        LoadDict("amb@world_human_bum_wash@male@high@base")
        LoadDict("amb@world_human_bum_wash@male@low@base")
        LoadDict("amb@world_human_bum_wash@male@low@idle_a")
        LoadDict("switch@michael@wash_face")
        LoadDict("anim@mp_yacht@shower@male@")
    end
	local hotel = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 10.0, GetHashKey('prop_ld_dstsign_01'))
    if DoesEntityExist(hotel) then
        local mycoords = GetEntityCoords(PlayerPedId())
        local ligo = {pos = vector3(mycoords.x,mycoords.y,mycoords.z+0.3), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=GetEntityHeading(PlayerPedId())}
        local plyPed = PlayerPedId()
        TriggerServerEvent("renzu_hygiene:syncshower", ligo)
        if GetEntityModel(plyPed) == -1667301416 then
            TaskPlayAnim(plyPed, "mp_safehouseshower@female@", "shower_enter_into_idle", 8.0, -8.0, 5.0, 0, 0.0, 0, 0, 0)
            Citizen.Wait(5000)
            TaskPlayAnim(plyPed, "anim@mp_yacht@shower@female@", "shower_idle_a", 8.0, -8.0, 5.0, 0, 0.0, 0, 0, 0)
            Citizen.Wait(5000)
            TaskPlayAnim(plyPed, "anim@mp_yacht@shower@female@", "shower_idle_b", 8.0, -8.0, 5.0, 0, 0.0, 0, 0, 0)
            Citizen.Wait(5000)
            TaskPlayAnim(plyPed, "mp_safehouseshower@female@", "shower_idle_a", 8.0, -8.0, 5.0, 0, 0.0, 0, 0, 0)
            Citizen.Wait(5000)
        else
            TaskPlayAnim(plyPed, "anim@mp_yacht@shower@male@", "male_shower_idle_d", 8.0, -8.0, 5.0, 0, 0.0, 0, 0, 0)
            Citizen.Wait(5000)
            TaskPlayAnim(plyPed, "anim@mp_yacht@shower@male@", "male_shower_idle_a", 8.0, -8.0, 5.0, 0, 0.0, 0, 0, 0)
            Citizen.Wait(5000)
            TaskPlayAnim(plyPed, "anim@mp_yacht@shower@male@", "male_shower_idle_c", 8.0, -8.0, 5.0, 0, 0.0, 0, 0, 0)
            Citizen.Wait(5000)
        end
        --StopAllParticles(ligo)
        ClearPedTasks(plyPed)
        if odor < 10 then
        ExecuteCommand("removebasurar")
        end
        odor = 10000
    end
end, false)


RegisterCommand('poop', function()
    local toilet = GetClosestObjectOfType(GetEntityCoords(PlayerPedId()), 10.0, GetHashKey('prop_ld_dstsign_01'))
    if DoesEntityExist(toilet) then
        Poop2(GetEntityHeading(toilet),GetEntityCoords(toilet))
    end
end, false)