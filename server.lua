RegisterServerEvent('vanishdev:recievetreatment')
AddEventHandler('vanishdev:recievetreatment', function()
    local _source = source
    local price = Config.treatmentCost 
    
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    local xPlayers = ESX.GetPlayers()
    local amount = 0
    
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        if xPlayer.job.name == 'ambulance' then
            amount = amount + 1
        end
    end

    if amount > Config.EMSAvailability then
        ShowNotification("There is EMS online, you cannot check in.", Config.notificationType)
    else
        if xPlayer.getAccount('bank').money >= price then
            xPlayer.removeAccountMoney('bank', price)
            ShowNotification("Amount Paid: $" .. price, Config.notificationType)
            TriggerClientEvent('esx_ambulancejob:revive', _source) -- or add your own trigger for reviving players
        else
            ShowNotification("Not enough money: $" .. price, Config.notificationType)
        end
    end
end)
