ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('givePlayerMoney')
AddEventHandler('givePlayerMoney', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer then
        local payout = math.random(Config.payOutMin, Config.payOutMax)
        print("Payout: " .. payout)
        xPlayer.addMoney(payout)
    else
        print("Player not found")
    end
end)
