local zonePoint

if not Config.UseTarget then
    for _, coords in pairs(Config.PedSettings.locations) do
        zonePoint = lib.points.new(coords, 1.5)

        function zonePoint:onEnter()
            lib.showTextUI('Press ~INPUT_VEH_HORN~ to be treated ~r~(~h~~g~$%s~r~)'):format(Config.treatmentCost)
        end

        function zonePoint:onExit()
            lib.hideTextUI()
        end

        function zonePoint:nearby()
            DrawMarker(2, self.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.1, 0.05, 255, 0, 0, 255, false, false, 2, false, nil, nil, false)

            if IsControlJustPressed(1, 38) then
                if GetEntityHealth(self.id) < 200 then
                    local emsCount = lib.callback.await('vanishdevs:server:emsCount', false)

                    if emsCount >= Config.requireEMS then
                    TriggerServerEvent('vanishdev:server:recieveTreatment', Config.ShowNotifications, Config.treatmentCost)
                    else
                        ShowNotification(locale('ems_not_enough'))
                    end
                else
                    ShowNotification(locale('treatment_not_needed''))
                end
            end
        end
    end
end

local function createPedTreatement()
    lib.requestModel(Config.pedModel)

    for _, coords in pairs(Config.location) do
        local ped = CreatePed(4, pedModel, coords.x, coords.y, coords.z - 1, coords.w, false, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        if Config.UseTarget then
            local options = {
                {
                    label = 'Recieve Treatment',
                    icon = 'fa-regular fa-hospital',
                    distance = 3.0,
                    onSelect = function()
                        local playerPed = cache.ped
                        local playerHealth = GetEntityHealth(playerPed)
                        local emsCount = lib.callback.await('vanishdevs:server:emsCount', false)
                        
                        if playerHealth < 200 then
                            if emsCount >= Config.requireEMS then
                                TriggerServerEvent('vanishdev:recievetreatment', Config.treatmentCost)
                            else
                                ShowNotification(locale('ems_not_enough'))
                            end
                        else
                            ShowNotification(locale('treatment_not_needed'))
                        end
                    end
                },
            }
            exports.ox_target:addLocalEntity(ped, options)
        end
    end
end

CreateThread(createPedTreatement)
