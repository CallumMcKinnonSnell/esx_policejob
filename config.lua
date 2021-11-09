Config = {}
Config.Locale = 'en'
Config.HandCuffTimer = 8 * 60000

Config.DrugPrices = {
	crackbrick = 525,
	crack10g = 4,
	crack1g = 3,
	labmeth_100g = 563,
	labmeth_baggie = 55,
	shit_meth = 450,
	cokebrick = 825,
	coke10g = 70,
	coke1g = 5,
	stawdawg_bagged = 190,
	alien_brick = 490,
	cayo_brick = 245,
	alien_bagged = 40,
}

Config.Armourer = {x =480.33, y=-996.69,z=29.69}
Config.ArmourerHeading = 90.00


Config.OnlyPolicemen = true
Config.ReceiveAmmo = 250
Config.ArmoryWeapons = {
	{ ["hash"] = "WEAPON_NIGHTSTICK", ["type"] = "pistol" },
	{ ["hash"] = "WEAPON_COMBATPISTOL", ["type"] = "pistol" },
	{ ["hash"] = "WEAPON_COMBATPDW", ["type"] = "rifle" },
	{ ["hash"] = "WEAPON_SMG", ["type"] = "rifle" },
	{ ["hash"] = "WEAPON_SPECIALCARBINE", ["type"] = "rifle" },
	{ ["hash"] = "WEAPON_PUMPSHOTGUN", ["type"] = "rifle" },
--	{ ["hash"] = "WEAPON_PUMPSHOTGUN_MK2", ["type"] = "rifle" },
	{ ["hash"] = "WEAPON_STUNGUN", ["type"] = "pistol" },
	{ ["hash"] = "WEAPON_HEAVYSNIPER", ["type"] = "rifle" },
--	{ ["hash"] = "WEAPON_GRENADELAUNCHER", ["type"] = "rifle" },
	{ ["hash"] = "WEAPON_FLASHLIGHT", ["type"] = "pistol" },
	{ ["hash"] = "WEAPON_FIREEXTINGUISHER", ["type"] = "pistol" },
	{ ["hash"] = "WEAPON_CARBINERIFLE", ["type"] = "rifle" },
	{ ["hash"] = "WEAPON_SNIPERRIFLE", ["type"] = "rifle" },
}

Config.ArmouryWeaponsAndAttachments = {
	{ weaponHash = 'WEAPON_FLASHLIGHT', label = 'Flashlight', type = 'other', attachment = false, flashlight = nil, scope = nil, suppressor = nil},
	{ weaponHash = 'WEAPON_FIREEXTINGUISHER', label = 'Fire Extinguisher', type = 'other', attachment = false, flashlight = nil, scope = nil, suppressor = nil},
	{ weaponHash = 'WEAPON_NIGHTSTICK', label = 'Baton', type = 'other', attachment = false, flashlight = nil, scope = nil, suppressor = nil  },
	{ weaponHash = 'WEAPON_PUMPSHOTGUN', label = 'Benelli M1', type = 'rifle', attachment = true, flashlight = 0x7BC4CDDC, scope = nil, suppressor = 0xE608B35E  },
--	{ weaponHash = 'WEAPON_PUMPSHOTGUN_MK2', label = 'Mossberg 590', type = 'rifle', attachment = true, flashlight = 0x7BC4CDDC, scope = 0x420FD713, suppressor = 0xAC42DF71  },
	{ weaponHash = 'WEAPON_HEAVYSNIPER', label = 'Barret', type = 'rifle', attachment = false, flashlight = nil, scope = nil, suppressor = nil  },
	{ weaponHash = 'WEAPON_STUNGUN', label = 'Stungun', type = 'other', attachment = false, flashlight = nil, scope = nil, suppressor = nil  },
	{ weaponHash = 'WEAPON_COMBATPISTOL', label = 'Glock-17', type = 'pistol', attachment = true, flashlight = 0x359B7AAE, scope = nil, suppressor = 0xC304849A},
	{ weaponHash = 'WEAPON_SMG', label = 'MP5', type = 'smg', attachment = true, flashlight = 	0x7BC4CDDC, scope = 0x3CC6BA57, suppressor = nil },
	{ weaponHash = 'WEAPON_SPECIALCARBINE', label = 'G36C', type = 'rifle', attachment = true, flashlight = 0x7BC4CDDC, scope = 0xA0D89C42, suppressor = 0xA73D4664  },
	{ weaponHash = 'WEAPON_COMBATPDW', label = 'Combat PDW', type = 'smg', attachment = true, flashlight = 	0x7BC4CDDC, scope = 0xAA2C45B4, suppressor = nil },	
	{ weaponHash = 'WEAPON_CARBINERIFLE', label = 'HK416', type = 'rifle', attachment = true, flashlight = 0x7BC4CDDC, scope = 0xA0D89C42, suppressor = 0x837445AA  },
	{ weaponHash = 'WEAPON_SNIPERRIFLE', label = 'Artic Warfare L96', type = 'rifle', attachment = true, flashlight = nil, scope = 0xBC54DA77, suppressor = 0xA73D4664  },
--	{ weaponHash = 'WEAPON_CARBINERIFLE_MK2', label = 'CARBINE_MK2', type = 'rifle', attachment = true, flashlight = ('COMPONENT_AT_AR_FLSH'), scope = ('COMPONENT_AT_SIGHTS'), suppressor = ('COMPONENT_AT_AR_SUPP') },
}
Config.FemaleOutfits = {
	{
		name = "CTSFO Uniform",
        ped = 'mp_f_freemode_01',
        props = {
            { 0, 156, 1 },
            { 1, -1, 1 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 },
            { 3, 19, 1 },
            { 4, 35, 1 },
            { 5, 1, 1 },
            { 6, 26, 1 },
            { 7, 0, 0 },
            { 8, 8, 1 },
            { 9, 8, 2 },
            { 10, 1, 1},
            { 11, 63, 1 },
        },
    },{
		name = "PCSO Uniform",
		ped = 'mp_f_freemode_01',
		props = {
			{ 0, 22, 1 },
			{ 1, 0, 1 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 3, 1, 1 },
			{ 4, 18, 1 },
			{ 5, 1, 1 },
			{ 6, 26, 1 },
			{ 7, 0, 0 },
			{ 8, 17, 1 },
			{ 9, 12, 1 },
			{ 10, 1, 1},
			{ 11, 23, 2 },
		},
	},{
		name = "Standard Patrol Uniform",
		ped = 'mp_f_freemode_01',
		props = {
			{ 0, 26, 1 },
			{ 1, 0, 1 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 3, 1, 1 },
			{ 4, 18, 1 },
			{ 5, 1, 1 },
			{ 6, 26, 1 },
			{ 7, 0, 0 },
			{ 8, 17, 1 },
			{ 9, 10, 1 },
			{ 10, 1, 1},
			{ 11, 20, 2 },
		},
	},{
		name = "ARU Patrol Uniform",
		ped = 'mp_f_freemode_01',
		props = {
			{ 0, 10, 5 },
			{ 1, 0, 1 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 3, 19, 1 },
			{ 4, 35, 1 },
			{ 5, 1, 1 },
			{ 6, 26, 1 },
			{ 7, 0, 0 },
			{ 8, 17, 1 },
			{ 9, 36, 3 },
			{ 10, 1, 1},
			{ 11, 52, 4 },
		},
	},{
		name = 'CID Operations Uniform',
		ped = 'mp_f_freemode_01',
		props = {
			{ 0, 10, 5 },
			{ 1, -1, 1 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 3, 19, 1 },
			{ 4, 59, 3 },
			{ 5, 1, 1 },
			{ 6, 28, 1 },
			{ 7, 0, 0 },
			{ 8, 3, 1 },
			{ 9, 36, 2 },
			{ 10, 1, 1},
			{ 11, 145, 4 },
		},
	},{
		name = 'ARU Response Uniform',
		ped = 'mp_f_freemode_01',
		props = {
			{ 0, 10, 5 },
			{ 1, -1, 1 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 3, 19, 1 },
			{ 4, 35, 1 },
			{ 5, 1, 1 },
			{ 6, 26, 1 },
			{ 7, 0, 0 },
			{ 8, 8, 1 },
			{ 9, 8, 1 },
			{ 10, 1, 1},
			{ 11, 63, 1 },
		},
	}
}

Config.MaleOutfits = {
	{
		name = 'Student Constable',
		ped = 'mp_m_freemode_01',
		props = {
			{ 0, 31, 1 },
			{ 1, 1, 1 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 3, 13, 1 },
			{ 4, 27, 1 },
			{ 5, 1, 1 },
			{ 6, 26, 1 },
			{ 7, 0, 0 },
			{ 8, 17, 1 },
			{ 9, 26, 1 },
			{ 10, 1, 1},
			{ 11, 24, 1 },
		},
	},{
        name = 'RPU - Basic',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 43, 2 },-- hat
            { 1, 1, 1 }, -- glasses
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 }, -- mask
            { 3, 1, 1 }, -- arms
            { 4, 27, 1 }, -- pants
            { 5, 1, 1 }, -- parachute
            { 6, 26, 1 }, -- shoes
            { 7, 0, 0 }, -- neck/ties
            { 8, 32, 1 }, -- undershirt
            { 9, 1, 1 }, -- body armour
            { 10, 1, 1},  -- decals
            { 11, 27, 2 },  -- shirts
        },
    },{
        name = 'RPU - APV',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 174, 1 }, -- hat
            { 1, 1, 1 }, -- glasses
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 }, -- mask
            { 3, 43, 1 }, -- arms
            { 4, 27, 1 }, -- pants
            { 5, 1, 1 }, -- parachute
            { 6, 26, 1 }, -- shoes
            { 7, 2, 0 }, -- neck/ties
            { 8, 31, 1 }, -- undershirt
            { 9, 30, 1 }, -- body armour
            { 10, 1, 1},  -- decals
            { 11, 30, 4 },  -- shirts
        },
    },{
        name = 'RPU - Interceptor',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 23, 1 }, -- hat
            { 1, 1, 1 }, -- glasses
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 }, -- mask
            { 3, 2, 1 }, -- arms
            { 4, 27, 1 }, -- pants
            { 5, 1, 1 }, -- parachute
            { 6, 26, 1 }, -- shoes
            { 7, 0, 0 }, -- neck/ties
            { 8, 31, 1 }, -- undershirt
            { 9, 30, 1 }, -- body armour
            { 10, 1, 1},  -- decals
            { 11, 29, 1 },  -- shirts
        },
    },{
        name = 'RPU - Motorcycle Unit',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 32, 1 }, -- hat
            { 1, 1, 1 }, -- glasses
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 }, -- mask
            { 3, 19, 1 }, -- arms
            { 4, 27, 1 }, -- pants
            { 5, 1, 1 }, -- parachute
            { 6, 26, 1 }, -- shoes
            { 7, 0, 0 }, -- neck/ties
            { 8, 31, 1 }, -- undershirt
            { 9, 1, 1 }, -- body armour
            { 10, 1, 1},  -- decals
            { 11, 25, 1 },  -- shirts
        },
    },{
        name = 'Patrol Outfit - Constables',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 23, 1 },
            { 1, 1, 1 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 },
            { 3, 1, 1 },
            { 4, 21, 1 },
            { 5, 1, 1 },
            { 6, 26, 1 },
            { 7, 0, 0 },
            { 8, 18, 1 },
            { 9, 25, 1 },
            { 10, 1, 1},
            { 11, 31, 1 },
        },
    },{
        name = 'Patrol Outfit - Sergeants',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 23, 1 },
            { 1, 1, 1 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 },
            { 3, 1, 1 },
            { 4, 21, 1 },
            { 5, 1, 1 },
            { 6, 26, 1 },
            { 7, 0, 0 },
            { 8, 18, 1 },
            { 9, 25, 2 },
            { 10, 1, 1},
            { 11, 30, 1 },
        },
    },{
        name = 'Patrol Outfit - Bronze Command',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 23, 1 },
            { 1, 1, 1 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 },
            { 3, 1, 1 },
            { 4, 21, 1 },
            { 5, 1, 1 },
            { 6, 26, 1 },
            { 7, 0, 0 },
            { 8, 18, 1 },
            { 9, 25, 3 },
            { 10, 1, 1},
            { 11, 30, 2 },
        },
    },{
        name = 'Patrol Outfit - Silver Command',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 23, 1 },
            { 1, 1, 1 },
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 },
            { 3, 1, 1 },
            { 4, 21, 1 },
            { 5, 1, 1 },
            { 6, 26, 1 },
            { 7, 0, 0 },
            { 8, 18, 1 },
            { 9, 25, 5 },
            { 10, 1, 1},
            { 11, 30, 5 },
        },
    },{
		name = 'Hazard Containment Suit',
		ped = 'mp_m_freemode_01',
		props = {
			{ 0, 0, 1 },
			{ 1, 0, 1 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 2, 1, 1 },
			{ 3, 79, 1 },
			{ 4, 12, 1 },
			{ 5, 1, 1 },
			{ 6, 14, 1 },
			{ 7, 0, 0 },
			{ 8, 15, 1 },
			{ 9, 0, 1 },
			{ 10, 1, 1},
			{ 11, 189, 2 },
		},
	},{
		name = 'Hazard Containment Suit 2',
		ped = 'mp_m_freemode_01',
		props = {
			{ 0, 0, 1 },
			{ 1, 0, 1 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 2, 1, 1 },
			{ 3, 79, 1 },
			{ 4, 12, 1 },
			{ 5, 1, 1 },
			{ 6, 14, 1 },
			{ 7, 0, 0 },
			{ 8, 16, 1 },
			{ 9, 0, 1 },
			{ 10, 1, 1},
			{ 11, 190, 2 },
		},
	},{
		name = 'EOD Suit',
		ped = 'mp_m_freemode_01',
		props = {
			{ 0, 103, 2 },
			{ 1, 0, 1 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 2 },
			{ 3, 19, 1 },
			{ 4, 12, 1 },
			{ 5, 1, 1 },
			{ 6, 14, 1 },
			{ 7, 0, 0 },
			{ 8, 16, 1 },
			{ 9, 0, 1 },
			{ 10, 1, 1},
			{ 11, 128, 2 },
		},
	},{
		name = 'NPAS Flight Outfit',
		ped = 'mp_m_freemode_01',
		props = {
			{ 0, 100, 1 },
			{ 1, 0, 1 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 3, 2, 1 },
			{ 4, 22, 2 },
			{ 5, 1, 1 },
			{ 6, 26, 1 },
			{ 7, 0, 0 },
			{ 8, 29, 1 },
			{ 9, 12, 1 },
			{ 10, 1, 1},
			{ 11, 29, 1 },
		},
	},{
		name = 'Bike Unit Outfit',
		ped = 'mp_m_freemode_01',
		props = {
			{ 0, 33, 1 },
			{ 1, 1, 1 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 3, 32, 1 },
			{ 4, 27, 1 },
			{ 5, 1, 1 },
			{ 6, 26, 1 },
			{ 7, 0, 0 },
			{ 8, 16, 1 },
			{ 9, 1, 1 },
			{ 10, 1, 1},
			{ 11, 25, 1 },
		},
	},{
        name = 'RPU - Basic',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 43, 2 },-- hat
            { 1, 1, 1 }, -- glasses
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 }, -- mask
            { 3, 1, 1 }, -- arms
            { 4, 27, 1 }, -- pants
            { 5, 1, 1 }, -- parachute
            { 6, 26, 1 }, -- shoes
            { 7, 0, 0 }, -- neck/ties
            { 8, 32, 1 }, -- undershirt
            { 9, 1, 1 }, -- body armour
            { 10, 1, 1},  -- decals
            { 11, 27, 2 },  -- shirts
        },
    },{
        name = 'RPU - Interceptor',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 23, 1 }, -- hat
            { 1, 1, 1 }, -- glasses
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 }, -- mask
            { 3, 2, 1 }, -- arms
            { 4, 27, 1 }, -- pants
            { 5, 1, 1 }, -- parachute
            { 6, 26, 1 }, -- shoes
            { 7, 0, 0 }, -- neck/ties
            { 8, 31, 1 }, -- undershirt
            { 9, 30, 1 }, -- body armour
            { 10, 1, 1},  -- decals
            { 11, 29, 1 },  -- shirts
        },
    },{
        name = 'RPU - Motorcycle Unit',
        ped = 'mp_m_freemode_01',
        props = {
            { 0, 32, 1 }, -- hat
            { 1, 1, 1 }, -- glasses
            { 2, 0, 0 },
            { 3, 0, 0 },
        },
        components = {
            { 1, 1, 1 }, -- mask
            { 3, 19, 1 }, -- arms
            { 4, 27, 1 }, -- pants
            { 5, 1, 1 }, -- parachute
            { 6, 26, 1 }, -- shoes
            { 7, 0, 0 }, -- neck/ties
            { 8, 31, 1 }, -- undershirt
            { 9, 1, 1 }, -- body armour
            { 10, 1, 1},  -- decals
            { 11, 25, 1 },  -- shirts
        },
    },{
		name = 'Gold Command Formalwear',
		ped = 'mp_m_freemode_01',
		props = {
			{ 0, 43, 1 },
			{ 1, 1, 1 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 3, 79, 1 },
			{ 4, 21, 1 },
			{ 5, 1, 1 },
			{ 6, 26, 1 },
			{ 7, 0, 0 },
			{ 8, 16, 1 },
			{ 9, 1, 1 },
			{ 10, 1, 1},
			{ 11, 49, 2 },
		},
	},{
		name = 'ARU Standard Patrol',
		ped = 'mp_m_freemode_01',
		props = {
			{ 0, 21, 1 },
			{ 1, 1, 1 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 2, 1, 1 },
			{ 3, 43, 1 },
			{ 4, 21, 1 },
			{ 5, 1, 1 },
			{ 6, 26, 1 },
			{ 7, 0, 0 },
			{ 8, 29, 1 },
			{ 9, 49, 1 },
			{ 10, 1, 1},
			{ 11, 30, 4 },
		},
	},{
		name = 'ARU Blue Response',
		ped = 'mp_m_freemode_01',
		props = {
			{ 0, 36, 1 },
			{ 1, 1, 1 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 3, 19, 1 },
			{ 4, 22, 1 },
			{ 5, 1, 1 },
			{ 6, 26, 1 },
			{ 7, 0, 0 },
			{ 8, 30, 1 },
			{ 9, 17, 1 },
			{ 10, 1, 1},
			{ 11, 29, 4 },
		},
	},{
		name = 'TSG Riot Response',
		ped = 'mp_m_freemode_01',
		props = {
			{ 0, 149, 6 },
			{ 1, 1, 1 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 3, 19, 1 },
			{ 4, 21, 2 },
			{ 5, 1, 1 },
			{ 6, 26, 1 },
			{ 7, 0, 0 },
			{ 8, 23, 1 },
			{ 9, 30, 1 },
			{ 10, 1, 1},
			{ 11, 29, 5 },
		},
	},{
		name = 'CTSFO Black',
		ped = 'mp_m_freemode_01',
		props = {
			{ 0, 37, 3 },
			{ 1, 53, 0 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 3, 19, 1 },
			{ 4, 52, 1 },
			{ 5, 1, 1 },
			{ 6, 26, 1 },
			{ 7, 2, 0 },
			{ 8, 23, 1 },
			{ 9, 49, 2 },
			{ 10, 1, 1},
			{ 11, 258, 1 },
		},
	},{
		name = 'CTSFO Grey',
		ped = 'mp_m_freemode_01',
		props = {
			{ 0, 37, 3 },
			{ 1, 53, 0 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 3, 19, 1 },
			{ 4, 52, 4 },
			{ 5, 1, 1 },
			{ 6, 26, 1 },
			{ 7, 2, 0 },
			{ 8, 23, 1 },
			{ 9, 49, 2 },
			{ 10, 1, 1},
			{ 11, 258, 4 },
		},
	}, {
		name = 'ARV Response Outfit',
		ped = 'mp_m_freemode_01',
		props = {
			{ 0, 36, 1 },
			{ 1, 53, 0 },
			{ 2, 0, 0 },
			{ 3, 0, 0 },
		},
		components = {
			{ 1, 1, 1 },
			{ 3, 21, 1 },
			{ 4, 52, 1 },
			{ 5, 1, 1 },
			{ 6, 26, 1 },
			{ 7, 2, 0 },
			{ 8, 23, 1 },
			{ 9, 49, 1 },
			{ 10, 1, 1},
			{ 11, 256, 2 },
		},
	},
}