local zonePoint

if not Config.UseTarget then
    for _, coords in pairs(Config.PedSettings.locations) do
        zonePoint = lib.points.new(coords, 4.0)

        function zonePoint:onEnter()
            Debug('Entered treatment zone')
            lib.showTextUI(locale('textui_text', Config.treatmentCost))
        end

        function zonePoint:onExit()
            Debug('Exited treatment zone')
            lib.hideTextUI()
        end

        function zonePoint:nearby()
            DrawMarker(2, self.coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.4, 255, 0, 0, 255, false, false, 2, false, nil, nil, false)

            if IsControlJustPressed(1, 38) then
                if GetEntityHealth(cache.ped) < 200 then
                    local emsCount = lib.callback.await('vanishdev:server:emsCount', false)

                    if emsCount >= Config.requireEMS then
                        TriggerServerEvent('vanishdev:server:recieveTreatment', Config.treatmentCost)
                    else
                        ShowNotification(locale('ems_not_enough'))
                    end
                else
                    ShowNotification(locale('treatment_not_needed'))
                end
            end
        end
    end
end

local function createPedTreatement()
    if not Config.UseTarget then return end

    local pedModel = Config.PedSettings.model

    lib.requestModel(pedModel)

    for _, coords in pairs(Config.PedSettings.locations) do
        local ped = CreatePed(4, pedModel, coords.x, coords.y, coords.z - 1, coords.w, false, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)

        local options = {
            {
                label = 'Recieve Treatment',
                icon = 'fa-regular fa-hospital',
                distance = 3.0,
                onSelect = function()
                    local playerPed = cache.ped
                    local playerHealth = GetEntityHealth(playerPed)
                    local emsCount = lib.callback.await('vanishdev:server:emsCount', false)

                    if playerHealth < 200 then
                        if emsCount >= Config.requireEMS then
                            TriggerServerEvent('vanishdev:server:recieveTreatment', Config.treatmentCost)
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

        Debug('Created treatment ped & added options')
    end
end

CreateThread(createPedTreatement)
