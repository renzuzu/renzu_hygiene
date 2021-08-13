ESX = nil

RegisterServerEvent('renzu_hygiene:syncshower')
AddEventHandler('renzu_hygiene:syncshower', function(zone)
    local Source = source
    TriggerClientEvent('renzu_hygiene:syncshower', -1, zone, GetEntityCoords(GetPlayerPed(Source)), Source)
end)

RegisterServerEvent('renzu_hygiene:poosync')
AddEventHandler('renzu_hygiene:poosync', function(sex)
    local Source = source
    TriggerClientEvent('renzu_hygiene:poosync', -1, GetEntityCoords(GetPlayerPed(Source)), Source, sex)
end)

RegisterServerEvent('renzu_hygiene:peesync')
AddEventHandler('renzu_hygiene:peesync', function()
    local Source = source
    TriggerClientEvent('renzu_hygiene:peesync', -1, GetEntityCoords(GetPlayerPed(Source)), Source, sex)
end)

RegisterServerEvent('renzu_hygiene:odoreffectsync')
AddEventHandler('renzu_hygiene:odoreffectsync', function()
    local Source = source
    TriggerClientEvent('renzu_hygiene:odoreffect', -1, GetEntityCoords(GetPlayerPed(Source)), Source)
end)

RegisterServerEvent('renzu_hygiene:flush')
AddEventHandler('renzu_hygiene:flush', function(coord, id, sex)
    local Source = source
    TriggerClientEvent('renzu_hygiene:flush', -1, GetEntityCoords(GetPlayerPed(Source)), Source)
end)

Citizen.CreateThread(function ()
    Wait(1000)
    if config.framework == 'ESX' then
        TriggerEvent('esx:getSharedObject', function(obj)ESX = obj end)
        Wait(500)
        for k,v in pairs(config.items) do
            results = SQLQuery(config.Mysql,'fetchAll',"SELECT * FROM items WHERE name = @name", {
                ['@name'] = k
            })
            if results[1] == nil then
                local weight = 'limit'
                if config.weight_type == 'weight' then
                    SQLQuery(config.Mysql,'execute',"INSERT INTO items (name, label, weight) VALUES (@name, @label, @weight)", {
                        ['@name'] = v.name,
                        ['@label'] = ""..v.name.."",
                        ['@weight'] = 1
                    })
                else
                    SQLQuery(config.Mysql,'execute',"INSERT INTO items (name, label) VALUES (@name, @label)", {
                        ['@name'] = v.name,
                        ['@label'] = ""..v.name.."",
                    })
                end
            end
            ESX.RegisterUsableItem(k, function(source)
                local _source = source
                local xPlayer = ESX.GetPlayerFromId(_source)
                xPlayer.removeInventoryItem(k, 1)
                TriggerClientEvent('renzu_hygiene:addhygiene', _source,k)
                TriggerClientEvent('renzu_notify:Notify',_source, 'success','Hygiene', 'You have used a '..v.name..' anti odor')
            end)
        end
    end
end)

function SQLQuery(plugin,type,query,var)
    if type == 'fetchAll' and plugin == 'mysql-async' then
		local q = nil
		MySQL.Async.fetchAll(query, var, function(result)
            q = result
        end)
		while q == nil do Wait(0) end
		return q
    end
    if type == 'execute' and plugin == 'mysql-async' then
        MySQL.Sync.execute(query,var) 
    end
    if type == 'execute' and plugin == 'ghmattisql' then
        exports['ghmattimysql']:execute(query, var)
    end
    if type == 'fetchAll' and plugin == 'ghmattisql' then
        local data = nil
        exports.ghmattimysql:execute(query, var, function(result)
            data = result
        end)
        while data == nil do Wait(0) end
        return data
    end
end