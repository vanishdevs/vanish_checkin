Config = {}

-- Specify the framework for the script or leave blank ('') if you are using this as a standalone system
Config.Framework = 'ESX'

-- If you want to use a targetting system, set this to true, this will make you be able to interact with the ped (ox_target only)
Config.UseTarget = false

-- The location where the ped is spawed for you to interact with (using vector4 for coordinates)
Config.location = {
    vector4(311.4203, -594.0041, 42.2841, 339.7307),
    -- Add more coordinates here, make sure to have the proper syntax
}

-- If you chose to make this script standalone, define where you want to respawn when you recieve treatment (ignore if you are using framework)
Config.standalonerespawn = vector4(311.4203, -594.0041, 42.2841, 339.7307)

-- The amount of medics/ems that have to be online in order for this system to not work
Config.EMSAvailability = 3

-- Cost of treatment in game currency (e.g., dollars)
Config.treatmentCost = 250000

-- Type of notification system used for displaying messages (e.g., "esx", "chat", etc.)
Config.notificationType = "esx"

-- Function to show notifications to players
function ShowNotification(message, type)
    -- Check the type of notification and trigger the appropriate client event
    if type == "esx" then
        TriggerEvent("esx:showNotification", message)
    elseif type == "chat" then
        -- Display a message in the in-game chat
        TriggerEvent("chatMessage", source, "SYSTEM", {255, 0, 0}, message)
    else
        -- Add conditions for other notification systems if needed
        -- For example, you could add support for a custom UI notification system here
        -- Ensure to implement the corresponding client-side handling in the main script
    end
end
