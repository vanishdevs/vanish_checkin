return {
    Debug = false,

    Framework = 'ESX',
    UseTarget = true,

    PedSettings = {
        model = 's_m_m_doctor_01',
    },

    locations = {
        vector4(311.4203, -594.0041, 42.2841, 339.7307),
        -- ...
    },

    requireEMS = 3,
    treatmentCost = 250000,

    reviveEventTrigger = function(source)
        -- Trigger your revive event here
        TriggerClientEvent('esx_ambulancejob:revive', source)
    end,
}