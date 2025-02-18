local cfg = {}

cfg.presets = {
    ["StaffMale"] = {
        model = `mp_m_freemode_01`,
        components = {
            [0] = {22, 0, 2},
            [3] = {4, 0, 2},
            [4] = {175, 4, 0},
            [5] = {0, 0, 2},
            [6] = {145, 0, 2},
            [7] = {0, 0, 0},
            [8] = {15, 0, 2},
            [9] = {0, 0, 0},
            [10] = {0, 0, 0},
            [11] = {200, 0, 2}
        }
    },
    ["StaffFemale"] = {
        model = `mp_f_freemode_01`,
        components = {
            [3] = {3, 0, 2},
            [4] = {180, 0, 2},
            [5] = {0, 0, 2},
            [6] = {119, 14, 2},
            [7] = {0, 0, 0},
            [8] = {3, 0, 2},
            [9] = {0, 0, 0},
            [10] = {0, 0, 0},
            [11] = {202, 0, 2}
        },
    },
    ["StaffHalloweenMale"] = {
        components = {
            [1] = {60, 0, 2}
        }
    },
    ["StaffHalloweenFemale"] = {
        components = {
            [1] = {60, 0, 2}
        }
    },
    ["StaffChristmasMale"] = {
        props = {
            [0] = {22, 0, 1} --Christmas Hat
        }
    },
    ["StaffChristmasFemale"] = {
        props = {
            [0] = {23, 0, 1} --Christmas Hat
        }
    },
    ["DefaultMale"] = {
        model = `mp_m_freemode_01`,
        components = {
            [0] = {0, 0, 0},
            [1] = {0, 1, 0},
            [3] = {0, 0, 0},
            [4] = {0, 1, 0},
            [5] = {0, 1, 0},
            [6] = {0, 1, 0},
            [7] = {0, 1, 0},
            [8] = {15, 1, 0},
            [9] = {0, 1, 0},
            [10] = {0, 1, 0}
        },
        props = {
            [1] = {-1, 0, 0},
            [2] = {-1, 0, 0},
            [6] = {-1, 0, 0},
            [7] = {-1, 0, 0}
        }
    },
    ["DefaultFemale"] = {
        model = `mp_f_freemode_01`,
        components = {
            [0] = {0, 0, 0},
            [1] = {0, 1, 0},
            [3] = {0, 0, 0},
            [4] = {0, 1, 0},
            [5] = {0, 1, 0},
            [6] = {0, 1, 0},
            [7] = {0, 1, 0},
            [8] = {15, 1, 0},
            [9] = {0, 1, 0},
            [10] = {0, 1, 0}
        },
        props = {
            [1] = {-1, 0, 0},
            [2] = {-1, 0, 0},
            [6] = {-1, 0, 0},
            [7] = {-1, 0, 0}
        }
    },
    ["NoBreathingApperatus"] = {
        components = {
            [8] = {15, 0, 0}
        }
    },
    ["BreathingApperatusDown"] = {
        components = {
            [8] = {15, 0, 0}
        }
    },
    ["BreathingApperatusUp"] = {
        components = {
            [8] = {217, 0, 0}
        }
    },
    ["TaserInHolster"] = {
        components = {
            [7] = {186, 0, 0}
        }
    },
    ["TaserOutHolster"] = {
        components = {
            [7] = {162, 0, 0}
        }
    },
    ["PrisonerMale"] = {
        components = {
            [4] = {7, 0, 0},
            [6] = {42, 2, 0},
            [8] = {15, 0, 0},
            [11] = {445, 0, 0}
        },
        props = {
            [0] = {1, 8, 0}
        }
    },
    ["PrisonerFemale"] = {
        components = {
            [3] = {5, 0, 0},
            [4] = {2, 0, 0},
            [6] = {27, 0, 0},
            [8] = {15, 0, 0}
        }
    },
    ["TattooMale"] = {
        components = {
            [1] = {0, 0, 2},
            [3] = {15, 0, 2},
            [4] = {16, 0, 2},
            [5] = {0, 0, 2},
            [8] = {34, 0, 2},
            [9] = {0, 0, 2},
            [11] = {101, 1, 2}
        }
    },
    ["TattooFemale"] = {
        components = {
            [1] = {0, 0, 2},
            [3] = {15, 0, 2},
            [4] = {14, 0, 2},
            [5] = {0, 0, 2},
            [8] = {15, 0, 2},
            [9] = {0, 0, 2},
            [11] = {91, 0, 2}
        }
    },
    ["G4SMale"] = {
        components = {
            [1] = {0, 0, 0},
            [2] = {19, 0, 2},
            [3] = {174, 0, 0},
            [4] = {129, 1, 0},
            [5] = {0, 0, 0},
            [6] = {25, 0, 0},
            [7] = {0, 0, 0},
            [8] = {201, 0, 0},
            [9] = {91, 0, 0},
            [10] = {0, 0, 0},
            [11] = {399, 0, 0}
        }
    },
    ["G4SFemale"] = {
        components = {
            [1] = {0, 0, 0},
            [2] = {19, 0, 2},
            [3] = {222, 0, 0},
            [4] = {136, 0, 0},
            [5] = {0, 0, 0},
            [6] = {25, 0, 0},
            [7] = {0, 0, 0},
            [8] = {159, 0, 0},
            [9] = {68, 0, 0},
            [10] = {0, 0, 0},
            [11] = {329, 0, 0}
        }
    },
    ["TruckerMale"] = {
        model = `mp_m_freemode_01`,
        components = {
            [1] = {0, 0, 0},
            [2] = {19, 0, 0},
            [3] = {0, 0, 0},
            [4] = {63, 0, 0},
            [5] = {0, 0, 0},
            [6] = {12, 0, 0},
            [7] = {0, 0, 0},
            [8] = {59, 1, 0},
            [9] = {0, 0, 0},
            [10] = {0, 1, 0},
            [11] = {56, 0, 0},
        }
    },
    ["TruckerFemale"] = {
        model = `mp_f_freemode_01`,
        components = {
            [1] = {0, 0, 0},
            [2] = {3, 0, 2},
            [3] = {0, 0, 0},
            [4] = {1, 0, 0},
            [5] = {0, 1, 0},
            [6] = {69, 0, 0},
            [7] = {0, 1, 0},
            [8] = {36, 0, 0},
            [9] = {0, 1, 0},
            [10] = {0, 1, 0},
            [11] = {49, 0, 0}
        }
    }
}

return cfg