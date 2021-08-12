local ebak = false
local text = "Take a Poo [E]"

local done = false
RegisterNetEvent('renzu_hygiene:takepoop')
AddEventHandler('renzu_hygiene:takepoop', function(plyPed, s, entity)
    local plyPed = PlayerPedId()
    if not ebak then
        ebak = true
        if entity ~= nil then
            showerpos = GetEntityCoords(entity)
            showerpos = vector3(showerpos.x,showerpos.y,showerpos.z+0.2)
            s = {pos = showerpos, particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h = GetEntityHeading(entity) + 180.0}
        end
        SetEntityHeading(PlayerPedId(), tonumber(s.h)*1.0)
        local PlayerPed = plyPed
        if GetEntityModel(plyPed) == -1667301416 then
            sex = 'female'
        else
            sex = 'male'
        end
        if sex == 'female' then
            --TaskPlayAnim(PlayerPed, "anim@mp_yacht@shower@male@", "male_shower_idle_d", 8.0, -8.0, 5.0, 0, 0.0, 0, 0, 0)
            BehindPlayer = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0 - 0.5, -0.5);
            ClearPedTasks(plyPed)
            TaskStartScenarioAtPosition(plyPed, 'PROP_HUMAN_SEAT_CHAIR_MP_PLAYER', BehindPlayer['x'], BehindPlayer['y'], BehindPlayer['z'], GetEntityHeading(PlayerPedId()), 0, 1, false)
        else
            LoadAnim('timetable@ron@ig_3_couch')
            TaskPlayAnim(plyPed, "timetable@ron@ig_3_couch", "base", 1.0, -1.0, -1, 1, 1, 0, 0, 0)
        end
        Citizen.Wait(2000)
        --Poop(sex)
        TriggerServerEvent('renzu_hygiene:poosync', sex)
        --TaskPlayAnim(plyPed, "switch@michael@wash_face", "loop_michael", 8.0, -8.0, 3.0, 0, 0.0, 0, 0, 0)
        Citizen.Wait(16000)
        local mycoords = GetEntityCoords(PlayerPedId())
        ClearPedTasks(plyPed)
        done = true
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
            local s = s.pos
            distance = GetDistance(GetEntityCoords(plyPed), vector3(s.x,s.y,s.z))
            while distance <= 2.2 do
                done = false
                distance = GetDistance(GetEntityCoords(plyPed), vector3(s.x,s.y,s.z))
                Wait(500)
            end
            TriggerEvent('renzu_popui:closeui')
            Citizen.Wait(500)
        end
        Citizen.Wait(5000)
        LoadAnim('move_p_m_two_idles@generic')
        TaskPlayAnim(PlayerPed, "move_p_m_two_idles@generic", "fidget_sniff_fingers", 8.0, -8.0, 5.0, 0, 0.0, 0, 0, 0)
        poo = 0
        Citizen.Wait(2222)
        ebak = false
        ClearPedTasks(plyPed)
        TriggerEvent('esx_status:add', config.poostatus, 1000000)
    end
end)

local peeparticleEffects = {}

RegisterNetEvent('renzu_hygiene:peesync')
AddEventHandler('renzu_hygiene:peesync', function(coord, id, sex)
    local id = id
    local dist = GetDistance(GetEntityCoords(PlayerPedId()), coord)
    if dist < 40 then
        if GetPlayerFromServerId(id) ~= nil or GetPlayerFromServerId(id) ~= 0 then
            local PlayerPed = GetPlayerPed(GetPlayerFromServerId(id))
            if GetEntityModel(PlayerPed) == -1667301416 then
            sex = 'female'
            else
            sex = 'male'
            end
            local particleDictionary = "core"
            local particleName = "ent_amb_peeing"
            local animDictionary = 'misscarsteal2peeing'
            local animName = 'peeing_loop'
        
            local mycoords = GetEntityCoords(PlayerPed)
            local loopAmount = 0
            --createdParticle[id] = {}
            local asset = "core"
            local particleName = 'ent_amb_peeing'
            RequestNamedPtfxAsset(asset)
        
            while not HasNamedPtfxAssetLoaded(asset) do
                Wait(100)
            end
            peeparticleEffects[id] = {}
            if sex == 'male' then
                local bone = GetPedBoneIndex(PlayerPed, 11816)
                for x=0,loopAmount do
                    UseParticleFxAssetNextCall(asset)
                    bone = GetPedBoneIndex(PlayerPed, 11816)
                    local particle = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.2, 0.0, -140.0, 0.0, 0.0, bone, 1.0, false, false, false)
                    table.insert(peeparticleEffects[id], 1, particle)
                    Citizen.Wait(500)
                end
                Citizen.Wait(8000)
                for _,particle in pairs(peeparticleEffects[id]) do
                    StopParticleFxLooped(particle, true)
                    RemoveParticleFx(particle, 0)
                    Citizen.Wait(0)
                end
                RemoveParticleFxFromEntity(PlayerPedId())
                RemoveParticleFxInRange(mycoords.x,mycoords.y,mycoords.z)
                peeparticleEffects[id] = {}
            else
                local bone = GetPedBoneIndex(PlayerPed, 11816)
                for x=0,loopAmount do
                    UseParticleFxAssetNextCall(asset)
                    bone = GetPedBoneIndex(PlayerPed, 11816)
                    local particle = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.35, 0.0, 0.0, 20.0, bone, 0.1, false, false, false)
                    table.insert(peeparticleEffects[id], 1, particle)
                    Citizen.Wait(500)
                end
                Citizen.Wait(15000)
                for _,particle in pairs(peeparticleEffects[id]) do
                    StopParticleFxLooped(particle, true)
                    RemoveParticleFx(particle, 0)
                end
                RemoveParticleFxFromEntity(PlayerPedId())
                RemoveParticleFxInRange(mycoords.x,mycoords.y,mycoords.z)
                peeparticleEffects[id] = {}
            end
        end
    end
end)

RegisterNetEvent('renzu_hygiene:flush')
AddEventHandler('renzu_hygiene:flush', function(coord, id, sex)
    done = false
    if #(GetEntityCoords(PlayerPedId()) - coord) < 5 then
        playsound(coord,4,'flush',0.7)
    end
end)

local pooparticleEffects = {}

RegisterNetEvent('renzu_hygiene:poosync')
AddEventHandler('renzu_hygiene:poosync', function(coord, id, sex)
    local id = id
    local dist = GetDistance(GetEntityCoords(PlayerPedId()), coord)
    if dist < 40 then
        if GetPlayerFromServerId(id) ~= nil or GetPlayerFromServerId(id) ~= 0 then
            local PlayerPed = GetPlayerPed(GetPlayerFromServerId(id))
            local mycoords = GetEntityCoords(PlayerPed)
            local loopAmount = 5
            createdParticle = {}
            local asset = "scr_amb_chop"
            local particleName = 'ent_anim_dog_poo'
            RequestNamedPtfxAsset(asset)

            while not HasNamedPtfxAssetLoaded(asset) do
                Wait(100)
            end
            pooparticleEffects[id] = {}
            for x=0,loopAmount do
                UseParticleFxAssetNextCall(asset)
                bone = GetPedBoneIndex(PlayerPed, 11816)
                if sex == 'male' then
                    z = -0.7
                    y = -0.6
                elseif sex == 'female' then
                    z = -0.25
                    y = -0.1
                end
                local particle = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0,  y, z, 0.0, 0.0, 20.0, bone, 1.5, false, false, false)
                table.insert(pooparticleEffects[id], 1, particle)
                Citizen.Wait(1500)
            end
            for _,particle in pairs(pooparticleEffects[id]) do
                StopParticleFxLooped(particle, true)
                RemoveParticleFx(particle, 0)
            end
            pooparticleEffects[id] = {}
        end
    end
end)

RegisterNetEvent('renzu_hygiene:WashFace')
AddEventHandler('renzu_hygiene:WashFace', function(h)
    local plyPed = PlayerPedId()
    LoadDict("switch@michael@wash_face")
    SetEntityHeading(plyPed, h)
    TaskPlayAnim(plyPed, "switch@michael@wash_face", "loop_michael", 8.0, -8.0, 3.0, 0, 0.0, 0, 0, 0)
    Citizen.Wait(3000)
    ClearPedTasks(plyPed)
    TriggerEvent('esx_status:add', config.washface_effectstatus, config.washfaceadd_status)
end)

local showeropen = false
RegisterNetEvent('renzu_hygiene:takeshower')
AddEventHandler('renzu_hygiene:takeshower', function(plyPed,showerpos,s,entity)
    local plyPed = PlayerPedId()
    local showerpos = showerpos
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
    if entity ~= nil then -- prop based
        showerpos = GetEntityCoords(entity)
        showerpos = vector3(showerpos.x,showerpos.y,showerpos.z+0.2)
        s = {pos = showerpos, particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h = GetEntityHeading(entity)}
    end
    showerpos = vector3(showerpos.x,showerpos.y,showerpos.z+0.5)
    if not showeropen then
        showeropen = true
        text = "Take Off Shower [E]"
        if entity ~= nil then
            s.pos = vector3(showerpos.x,showerpos.y,showerpos.z-0.8)
            TaskTurnPedToFaceEntity(plyPed,entity, 2000)
        else
            SetEntityHeading(plyPed, s.h)
        end
        TriggerServerEvent("renzu_hygiene:syncshower", s)
        if GetEntityModel(plyPed) == -1667301416 then
            TaskPlayAnim(plyPed, "mp_safehouseshower@female@", "shower_enter_into_idle", 8.0, -8.0, 5.0, 0, 0.0, 0, 0, 0)
            Citizen.Wait(5000)
            TaskPlayAnim(plyPed, "anim@mp_yacht@shower@female@", "shower_idle_a", 8.0, -8.0, 5.0, 0, 0.0, 0, 0, 0)
            Citizen.Wait(5000)
            TaskPlayAnim(plyPed, "anim@mp_yacht@shower@female@", "shower_idle_b", 8.0, -8.0, 5.0, 0, 0.0, 0, 0, 0)
            Citizen.Wait(5000)
            TaskPlayAnim(plyPed, "mp_safehouseshower@female@", "shower_idle_a", 8.0, -8.0, 5.0, 0, 0.0, 0, 0, 0)
        else
            TaskPlayAnim(plyPed, "anim@mp_yacht@shower@male@", "male_shower_idle_d", 8.0, -8.0, 5.0, 0, 0.0, 0, 0, 0)
            Citizen.Wait(5000)
            TaskPlayAnim(plyPed, "anim@mp_yacht@shower@male@", "male_shower_idle_a", 8.0, -8.0, 5.0, 0, 0.0, 0, 0, 0)
            Citizen.Wait(5000)
            TaskPlayAnim(plyPed, "anim@mp_yacht@shower@male@", "male_shower_idle_c", 8.0, -8.0, 5.0, 0, 0.0, 0, 0, 0)
        end
        Citizen.Wait(5000)
        odor = 1000000
        TriggerEvent('esx_status:add', config.hygienestatus, 1000000)
        showeropen = false
        text = "Take Shower [E]"
        --StopAllParticles(showers[i])
        ClearPedTasks(plyPed)
    end
end)

RegisterNetEvent('renzu_hygiene:synclamok')
AddEventHandler('renzu_hygiene:synclamok', function(ent)
	if GetPlayerFromServerId(ent) ~= nil or GetPlayerFromServerId(ent) ~= 0 then
	local ent = GetPlayerPed(GetPlayerFromServerId(ent))
    local mycoords = GetEntityCoords(ent)
	local loopAmount = 25
	createdParticle = {}
	local asset = "core"
	local particleName = 'ent_amb_insect_swarm'
	RequestNamedPtfxAsset(asset)

	while not HasNamedPtfxAssetLoaded(asset) do
		Wait(100)
	end
    local particleEffects = {}
	for x=0,loopAmount do
		UseParticleFxAssetNextCall(asset)
		local particle = StartNetworkedParticleFxLoopedOnEntity(particleName, ent, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.45, false, false, false)
		table.insert(particleEffects, 1, particle)
		Citizen.Wait(0)
	end

	Citizen.Wait(8000)
	for _,particle in pairs(particleEffects) do
		StopParticleFxLooped(particle, true)
		RemoveParticleFx(particle, 0)
	end
	RemoveParticleFxFromEntity(ent)
	RemoveParticleFxInRange(mycoords.x,mycoords.y,mycoords.z)
	end
end)

RegisterNetEvent('renzu_hygiene:Wash')
AddEventHandler('renzu_hygiene:Wash', function(coords, id)
    local plyPed = PlayerPedId()
    TriggerEvent('renzu_notify:Notify','info','Info', 'You are now cleaning off your body dirt.')
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
    local mycoords = GetEntityCoords(PlayerPedId())
    local ligo = {pos = vector3(mycoords.x,mycoords.y,mycoords.z+0.3), particle = "ent_amb_car_wash_jet", xRot = -180.0, nextWait = 0, h=GetEntityHeading(PlayerPedId())}
    local plyPed = PlayerPedId()
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
    ClearPedTasks(plyPed)
    odor = 400
    TriggerEvent('esx_status:add', config.hygienestatus, 100000)
end)

local cdbaho = {}
RegisterNetEvent('renzu_hygiene:odoreffect')
AddEventHandler('renzu_hygiene:odoreffect', function(coords, id)
    if not antiodor and cdbaho[id] == nil or not antiodor and cdbaho[id] ~= nil and cdbaho[id] < GetGameTimer() then
        cdbaho[id] = GetGameTimer() + 10000
        local id = id
        local dist = GetDistance(GetEntityCoords(PlayerPedId()), coords)
        if dist < 40 then
            TriggerEvent('renzu_hygiene:synclamok', id)
        end
        if dist < 5.0 then
            if GetPlayerFromServerId(id) ~= PlayerId() then
                LoadDict("switch@trevor@bear_floyds_face_smell")
                TaskPlayAnim(PlayerPedId(), "switch@trevor@bear_floyds_face_smell", "bear_floyds_face_smell_loop_floyd", 8.0, -8.0, 3.0, 0, 0.0, 0, 0, 0)
                TriggerEvent('renzu_notify:Notify','warning','Oh no!', 'You feel uneasy because you smell something very bad..')
                SetEntityHealth(PlayerPedId(),GetEntityHealth(PlayerPedId()) - config.badhygiene_hp_effect)
                TriggerEvent('esx_status:add', config.badhygienestatus_effect, config.badhygiene_effect_value)
            else
                TriggerEvent('renzu_notify:Notify','warning','Oh no!', 'i Smell like shit')
            end
        end
    end
end)

local forcepoo = 0
local forcepee = 0
poo,pee = 5000, 5000
RegisterNetEvent('renzu_hygiene:addpee')
AddEventHandler('renzu_hygiene:addpee', function(o)
    if pee <= 1000000 then
        TriggerEvent('esx_status:remove', config.peestatus, o)
        pee = pee + o
        if pee > 1000000 then
            pee = 1000000
        end
    end
end)

RegisterNetEvent('renzu_hygiene:addpoo')
AddEventHandler('renzu_hygiene:addpoo', function(o)
    if poo <= 1000000 then
        TriggerEvent('esx_status:remove', config.poostatus, o)
        poo = poo + o
        if poo > 1000000 then
        poo = 1000000
        end
    end
end)

RegisterNetEvent('renzu_hygiene:mask')
AddEventHandler('renzu_hygiene:mask', function(o)
        antiodor = o
end)

RegisterNetEvent("renzu_hygiene:addhygiene")
AddEventHandler("renzu_hygiene:addhygiene", function(k,v)
    odor = odor + config.items[k].value
    TriggerEvent('esx_status:add', config.hygienestatus, config.items[k].value)
end)

RegisterNetEvent('esx_status:add')
AddEventHandler('esx_status:add', function(name, val)
	if name == 'thirst' then
        TriggerEvent('renzu_hygiene:addpee', val * config.thirst_to_pee)
    end
    if name == 'hunger' then
        TriggerEvent('renzu_hygiene:addpoo', val * config.hunger_to_poo)
    end
end)

local poostart, peestart = false, false
RegisterNetEvent("esx_status:onTick")
AddEventHandler("esx_status:onTick", function(vitals) -- use renzu_status
    if vitals[config.hygienestatus] == nil then -- support esx status
        for k,v in pairs(vitals) do
           if v.name == config.hygienestatus then
              odor = v.val
           end
           if v.name == config.peestatus then
              pee = v.val
           end
           if v.name == config.poostatus then
              poo = v.val
           end
        end
    else
        odor = vitals[config.hygienestatus]
        pee = vitals[config.peestatus]
        poo = vitals[config.poostatus]
    end
    if odor <= 6 then
        TriggerServerEvent('renzu_hygiene:odoreffectsync')
    end
    TriggerEvent('esx_status:remove', config.hygienestatus, config.hygieneremove)
    if not poostart and poo <= 10000 then
        poostart = true
        Citizen.CreateThread(function ()
            while poo <= 10000 do
                forcepoo = forcepoo + 1
                TriggerEvent('renzu_notify:Notify','warning','Oh no!', 'Your poopoo is about to burst..')
                if forcepoo > 20 then
                    if GetEntityModel(PlayerPedId()) == -1667301416 then
                        sex = 'female'
                    else
                        sex = 'male'
                    end    
                    TriggerServerEvent('renzu_hygiene:poosync', sex)
                    poo = 0
                    odor = 0
                    TriggerEvent('esx_status:add', config.poostatus, 700000)
                    break
                end
                Citizen.Wait(10000)
            end
            forcepoo = 0
            poostart = false
        end)
    end
    if not peestart and pee <= 10000 then
        peestart = true
        Citizen.CreateThread(function ()
            while pee <= 10000 do
                forcepee = forcepee + 1
                TriggerEvent('renzu_notify:Notify','warning','Oh no!', 'Your pee is about to burst..')
                if forcepee > 20 then
                    if GetEntityModel(PlayerPedId()) == -1667301416 then
                        sex = 'female'
                    else
                        sex = 'male'
                    end
                    TriggerServerEvent('renzu_hygiene:peesync', sex)
                    pee = 0
                    odor = 0
                    TriggerEvent('esx_status:add', config.peestatus, 700000)
                    break
                end
                Citizen.Wait(10000)
            end
            peestart = false
            forcepee = 0
        end)
    end
end)

local sparticleEffects = {}

RegisterNetEvent('renzu_hygiene:syncshower')
AddEventHandler('renzu_hygiene:syncshower', function(actualZone, coord, id, sex)
    Citizen.CreateThread(function ()
        local id = id
        local dist = GetDistance(GetEntityCoords(PlayerPedId()), coord)
        if dist < 40 then
            playsound(coord,4,'shower',0.7)
            if GetPlayerFromServerId(id) ~= nil or GetPlayerFromServerId(id) ~= 0 then
                local PlayerPed = GetPlayerPed(GetPlayerFromServerId(id))
                local asset = "scr_carwash"
                local currentParticle = actualZone
                local loopAmount = 0
                RequestNamedPtfxAsset(asset)

                while not HasNamedPtfxAssetLoaded(asset) do
                    Wait(100)
                end
                sparticleEffects[id] = {}
                -- Loop from 0 to the loop amount defined above.
                for x=0,loopAmount do
                    UseParticleFxAssetNextCall(asset)
                    --bone = GetPedBoneIndex(PlayerPed, 11816)
                    local pos = vector3(currentParticle.pos.x,currentParticle.pos.y,currentParticle.pos.z+1.0)
                    local particle = StartParticleFxLoopedAtCoord(currentParticle.particle, pos.x,pos.y,pos.z, -180.0, 0.0, 0.0, 1.0, 0, 0, 0)
                    table.insert(sparticleEffects[id], 1, particle)
                    Citizen.Wait(500)
                end
                
                Citizen.Wait(20000)
                local mycoords = GetEntityCoords(PlayerPed)
                for _,particle in pairs(sparticleEffects[id]) do
                    StopParticleFxLooped(particle, true)
                    RemoveParticleFx(particle, 0)
                    Citizen.Wait(0)
                end
                RemoveParticleFxFromEntity(PlayerPed)
                sparticleEffects[id] = {}
            end
        end
    end)
end)