lib.versionCheck('vanishdevs/vanish_checkin')

lib.callback.register('vanishdev:server:emsCount', function()
    local xPlayers = ESX.GetPlayers()
    local emsCount = 0

    for i = 1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])

        if xPlayer.job.name == 'ambulance' then
            emsCount = emsCount + 1
        end
    end

    return emsCount
end)

RegisterNetEvent('vanishdev:server:recieveTreatment', function(treatmentCost)
    local source = source

    if Config.Framework == 'ESX' then
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer then
            if xPlayer.getAccount('bank').money >= treatmentCost then
                xPlayer.removeAccountMoney('bank', treatmentCost)
                Config.reviveEventTrigger(source)

                ShowNotification(locale('revive_complete', treatmentCost), source)
            else
                ShowNotification(locale('revive_incomplete'), source)
            end
        end
    else
        -- Add your own logic for your framework if needed, I will add a bridge for this in an update
    end
end)