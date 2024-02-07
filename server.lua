local function CheckVersion()
    PerformHttpRequest('https://github.com/2zVanish/vanish-checkin/blob/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then
            lib.print.error('Currently unable to run a version check.')
            return
        end

        lib.print.info(('Current Version: %s'):format(currentVersion))
        lib.print.info(('Latest Version: %s'):format(text))

        if text == currentVersion then
            lib.print.info('You are running the latest version.')
        else
            lib.print.error(('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end

RegisterServerEvent('vanishdev:recievetreatment')
AddEventHandler('vanishdev:recievetreatment', function(price)
    local _source = source
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

CheckVersion()
