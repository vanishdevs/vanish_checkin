function ShowInfo(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

Citizen.CreateThread(function()
    local textVisible = false
    RequestModel(Config.pedModel)

    while not HasModelLoaded(Config.pedModel) do
        Wait(500)
    end

    for _, coords in pairs(Config.location) do
        local ped = CreatePed(4, GetHashKey(Config.pedModel), coords.x, coords.y, coords.z, coords.h, false, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
    end

    while true do
        Citizen.Wait(0)
        local player = PlayerPedId()
        local playerCoords = GetEntityCoords(player)
        local nearestDistance = nil

        for _, coords in pairs(Config.location) do
            local distance = #(playerCoords - coords)

            if nearestDistance == nil or distance < nearestDistance then
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
                    Citizen.Wait(Config.healingCooldown)
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
