return {
    Debug = true,

    Framework = 'ESX',
    UseTarget = true,

    PedSettings = {
        model = 's_m_m_doctor_01',
        locations = {
            vector4(293.2893, -560.7271, 43.2677, 79.6240),

        }
    },

    requireEMS = 3,
    treatmentCost = 250000,

    reviveEventTrigger = function(source)
        -- Trigger your revive event here
        TriggerClientEvent('esx_ambulancejob:revive', source)
    end,
}