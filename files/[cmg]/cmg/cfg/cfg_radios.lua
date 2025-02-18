local cfg = {}

cfg.standardChannels = {
    ["Police"] = {
        permissions = {
            "police.onduty.permission"
        },
        deleteWhenEmpty = false,
        isDefault = true
    },
    ["NHS"] = {
        permissions = {
            "nhs.onduty.permission",
            "lfb.onduty.permission",
            "police.onduty.permission"
        },
        deleteWhenEmpty = false,
        isDefault = true
    },
    ["HMP"] = {
        permissions = {
            "prisonguard.onduty.permission",
            "nhs.onduty.permission",
            "police.onduty.permission"
        },
        deleteWhenEmpty = false,
        isDefault = true
    },
    ["LFB"] = {
        permissions = {
            "lfb.onduty.permission",
            "nhs.onduty.permission"
        },
        deleteWhenEmpty = false,
        isDefault = true
    },
}

cfg.checkChannelPermissionGroups = {
    ["police"] = true,
    ["nhs"] = true,
    ["prisonguard"] = true,
    ["lfb"] = true
}

cfg.sortOrder = {
    ["police"] = {
        "police.commissioner",
        "police.deputycommissioner",
        "police.assistantcommissioner",
        "police.deputyassistantcommissioner",
        "police.commander",
        "police.chiefsuperintendent",
        "police.superintendent",
        "police.specialconstable",
        "police.chiefinspector",
        "police.inspector",
        "police.sergeant",
        "police.seniorconstable",
        "police.constable",
        "police.pcso"
    },
    ["nhs"] = {
        "nhs.headchief",
        "nhs.assistantchief",
        "nhs.deputychief",
        "nhs.captain",
        "nhs.consultant",
        "nhs.specialist",
        "nhs.seniordoctor",
        "nhs.doctor",
        "nhs.juniordoctor",
        "nhs.criticalcare",
        "nhs.paramedic",
        "nhs.traineeparamedic"
    },
    ["prisonguard"] = {
        "hmp.governor",
        "hmp.deputygovernor",
        "hmp.divisionalcommander",
        "hmp.custodialsupervisor",
        "hmp.custodialofficer",
        "hmp.honourableguard",
        "hmp.supervisingofficer",
        "hmp.principalofficer",
        "hmp.specialistofficer",
        "hmp.seniorofficer",
        "hmp.prisonofficer",
        "hmp.traineeprisonofficer"
    }
}

cfg.advancedEffects = {
    ["freq_low"] = 389.0,
    ["freq_hi"] = 3248.0,
    ["fudge"] = 0.0,
    ["rm_mod_freq"] = 0.0,
    ["rm_mix"] = 0.16,
    ["o_freq_lo"] = 348.0,
    ["o_freq_hi"] = 4900.0
}

return cfg