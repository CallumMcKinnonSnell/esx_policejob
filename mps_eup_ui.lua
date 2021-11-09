----NJD SCRIPTS
--------THIS WAS MODIFED BY NJD AND R41ND4Y5 
----------Version 1.0
local outfits = {
	['Student Constable'] = {
		category = 'Met Police Male',
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
	},
	['CTSFO Uniform'] = {
        category = 'Met Police Female',
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
    },
	['RPU - Basic'] = {
        category = 'Met Police Male',
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
    },
	['RPU - APV'] = {
        category = 'Met Police Male',
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
    },
	['RPU - Interceptor'] = {
        category = 'Met Police Male',
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
    },
	['RPU - Motorcycle Unit'] = {
        category = 'Met Police Male',
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
    },
	['Patrol Outfit - Constables'] = {
        category = 'Met Police Male',
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
    },
	['Patrol Outfit - Sergeants'] = {
        category = 'Met Police Male',
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
    },
	['Patrol Outfit - Bronze Command'] = {
        category = 'Met Police Male',
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
    },
	['Patrol Outfit - Silver Command'] = {
        category = 'Met Police Male',
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
    },
	['Hazard Containment Suit'] = {
		category = 'Met Police Male',
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
	},
	['Hazard Containment Suit 2'] = {
		category = 'Met Police Male',
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
	},
	['EOD Suit'] = {
		category = 'Met Police Male',
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
	},
	['NPAS Flight Outfit'] = {
		category = 'Met Police Male',
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
	},
	['Bike Unit Outfit'] = {
		category = 'Met Police Male',
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
	},
	['RPU - Basic'] = {
        category = 'Met Police Male',
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
    },
	['RPU - Interceptor'] = {
        category = 'Met Police Male',
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
    },
	
	['RPU - Motorcycle Unit'] = {
        category = 'Met Police Male',
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
    },

	['Gold Command Formalwear'] = {
		category = 'Met Police Male',
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
	},
	['ARU Standard Patrol'] = {
		category = 'Met Police Male',
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
	},
	['ARU Blue Response'] = {
		category = 'Met Police Male',
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
	},
	['TSG Riot Response'] = {
		category = 'Met Police Male',
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
	},
	['PCSO Uniform'] = {
		category = 'Met Police Female',
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
	},
	['Standard Patrol Uniform'] = {
		category = 'Met Police Female',
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
	},
	['ARU Patrol Uniform'] = {
		category = 'Met Police Female',
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
	},
	['CID Operations Uniform'] = {
		category = 'Met Police Female',
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
	},
	['ARU Response Uniform'] = {
		category = 'Met Police Female',
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
	},
	['CTSFO Black'] = {
		category = 'Met Police Male',
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
	},
	['CTSFO Grey'] = {
		category = 'Met Police Male',
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
	},
	['ARV Response Outfit'] = {
		category = 'Met Police Male',
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

local function setOutfit(outfit)
    local ped = PlayerPedId()

    RequestModel(outfit.ped)

    while not HasModelLoaded(outfit.ped) do
        Wait(0)
    end

    if GetEntityModel(ped) ~= GetHashKey(outfit.ped) then
        SetPlayerModel(PlayerId(), outfit.ped)
    end

    ped = PlayerPedId()

    for _, comp in ipairs(outfit.components) do
       SetPedComponentVariation(ped, comp[1], comp[2] - 1, comp[3] - 1, 0)
    end

    for _, comp in ipairs(outfit.props) do
        if comp[2] == 0 then
            ClearPedProp(ped, comp[1])
        else
            SetPedPropIndex(ped, comp[1], comp[2] - 1, comp[3] - 1, true)
        end
    end
end

local categoryOutfits = {}

for name, outfit in pairs(outfits) do
    if not categoryOutfits[outfit.category] then
        categoryOutfits[outfit.category] = {}
    end

    categoryOutfits[outfit.category][name] = outfit
end

local menuPool = NativeUI.CreatePool()
local mainMenu = NativeUI.CreateMenu('Mobile Wardrobe', 'Choose outfit')

for name, list in pairs(categoryOutfits) do
    local subMenu = menuPool:AddSubMenu(mainMenu, name)

    for id, outfit in pairs(list) do
        outfit.item = NativeUI.CreateItem(id, 'Select this outfit.')
        subMenu:AddItem(outfit.item)
    end

    subMenu.OnItemSelect = function(sender, item, index)
        -- find the outfit
        for _, outfit in pairs(list) do
            if outfit.item == item then
                CreateThread(function()
                    setOutfit(outfit)
                end)
            end
        end
    end
end

menuPool:Add(mainMenu)

menuPool:RefreshIndex()

AddEventHandler("lspdeup", function()
    mainMenu:Visible(not mainMenu:Visible())
end)

CreateThread(function()
    while true do
        Wait(0)

        menuPool:ProcessMenus()
    end
end)