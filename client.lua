local robbedStores = {}
local lastRobbedLocation = nil
local robberyCooldownDistance = 50.0

for i, location in ipairs(Config.locations) do
    exports.ox_target:addBoxZone({
        coords = location,
        size = vec3(1, 1, 1),
        rotation = 0,
        debug = false,
        options = {
            {
                event = 'storeRobbery:skillcheck',
                icon = "fa-solid fa-mask",
                label = "Rob Store",
                distance = 3.0
            }
        }
    })
end

RegisterNetEvent('storeRobbery:skillcheck')
AddEventHandler('storeRobbery:skillcheck', function(data)
    local playerCoords = GetEntityCoords(PlayerPedId())
    local closeEnough = false
    local targetStore = nil

    for i, loc in ipairs(Config.locations) do
        local distanceFromRegister = #(loc - playerCoords)
        if distanceFromRegister < 50 then
            closeEnough = true
            targetStore = loc
            break
        end
    end

    if not closeEnough then
        TriggerEvent('ox_lib:notify', {
            type = 'error',
            title = 'Robbery',
            description = 'You are too far from the register to rob the store!'
        })
        return
    end

    if lastRobbedLocation then
        local distanceFromLastRobbery = #(lastRobbedLocation - playerCoords)
        if distanceFromLastRobbery < robberyCooldownDistance then
            TriggerEvent('ox_lib:notify', {
                type = 'error',
                title = 'Robbery',
                description = 'You already attempted or robbed this store recently!'
            })
            return
        end
    end

    local locationKey = string.format("%f,%f,%f", targetStore.x, targetStore.y, targetStore.z)

    if robbedStores[locationKey] then
        TriggerEvent('ox_lib:notify', {
            type = 'error',
            title = 'Robbery',
            description = 'You already attempted or robbed this store!'
        })
        return
    end

    local skill = lib.skillCheck({Config.skillCheck1, Config.skillCheck2, Config.skillCheck3}, {'a', 'd'})

    robbedStores[locationKey] = true
    lastRobbedLocation = targetStore

    if skill then
        lib.progressCircle({
            duration = 7000,
            label = 'Grabbing Cash',
            useWhileDead = false,
            canCancel = false,
            position = 'bottom',
            anim = {
                dict = 'mp_car_bomb',
                clip = 'car_bomb_mechanic'
            },
            disable = {
                move = true,
                combat = true,
                sprint = true
            }
        }) 
    
        TriggerEvent('ox_lib:notify', {
            type = 'success',
            title = 'Robbery',
            description = 'Store robbed!'
        })
        
        TriggerServerEvent('givePlayerMoney') 
    else
        TriggerEvent('ox_lib:notify', {
            type = 'error',
            title = 'Robbery',
            description = 'Failed to rob the store'
        })
    end
    
end)
