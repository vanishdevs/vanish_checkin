RegisterNetEvent('vanishdev:standalonerevive')
AddEventHandler('vanishdev:standalonerevive', function(player, coords)
    SetEntityCoordsNoOffset(player, coords.x, coords.y, coords.z, false, false, false, true)
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, coords.w, true, false) 
	SetPlayerInvincible(player, false) 
	TriggerEvent('playerSpawned', coords.x, coords.y, coords.z, coords.w)
    ClearPedBloodDamage(player)
end)

function ShowInfo(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
    local textVisible = false
    local pedModel = `s_m_m_doctor_01`
        
    RequestModel(pedModel)

    while not HasModelLoaded(pedModel) do
        Wait(500)
    end

    for _, coords in pairs(Config.location) do
        local ped = CreatePed(4, pedModel, coords.x, coords.y, coords.z - 1, coords.w, false, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        if Config.UseTarget then
            local options = {
                {
                    label = 'Check-in',
                    icon = 'fa-regular fa-hospital',
                    distance = 3.0,
                    onSelect = function()
                       TriggerServerEvent('vanishdev:recievetreatment', Config.treatmentCost)
                    end
                },
            }
            exports.ox_target:addLocalEntity(ped, options)
        end
    end

    while not Config.UseTarget do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local playerCoords = GetEntityCoords(player)
        local nearestDistance = nil

        for _, coords in pairs(Config.location) do
            local specifiedVector = vector3(coords[1], coords[2], coords[3])
            local distance = #(playerCoords - specifiedVector)
        
            if not nearestDistance or distance < nearestDistance then
                nearestDistance = distance
            end
        end

        if nearestDistance ~= nil and nearestDistance <= 4.0 then
            if not textVisible then
                ShowInfo(("Press ~INPUT_VEH_HORN~ to be treated ~r~(~h~~g~$%s~r~)"):format(Config.treatmentCost))
                textVisible = true 
            end

            if IsControlJustPressed(1, 38) then
                if GetEntityHealth(player) < 200 then
                    TriggerServerEvent('vanishdev:recievetreatment', Config.treatmentCost)
                    textVisible = false
                else
                    ShowNotification("You don't need treatment.", Config.notificationType)
                end
            end
        else
            textVisible = false
        end
    end
end)
