ESX = nil
local dragStatus, handcuffTimer = {}
local isHandcuffed 
dragStatus.isDragged = false
pedSpawned = false
local CopPed                  = 0
local categoryOutfits = {}


local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }  

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
	Citizen.Wait(5000)

	if PlayerData.job and PlayerData.job.name == 'police' or PlayerData.job and PlayerData.job.name == 'offpolice' then
		exports['rp-radio']:GivePlayerAccessToFrequencies(98, 99, 100, 101, 102)
	elseif PlayerData.job and PlayerData.job.name == 'ambulance' then
		exports['rp-radio']:GivePlayerAccessToFrequencies(98, 99, 100, 101, 102)
	elseif PlayerData.job and PlayerData.job.name == 'mechanic' then
		exports['rp-radio']:GivePlayerAccessToFrequency(102)
	else
		exports['rp-radio']:RemovePlayerAccessToFrequencies(98, 99, 100, 101, 102)
	end
end)

--Functions
--Vehicle information Panel
function OpenVehicleInfosMenu(vehicleData)
	ESX.TriggerServerCallback('esx_policejob:getVehicleInfos', function(infos)
	  local elements = {}

	  table.insert(elements, {label = _U('plate', infos.plate), value = nil})
  
	  if infos.owner == nil then
		table.insert(elements, {label = _U('owner_unknown'), value = nil})
	  else
		table.insert(elements, {label = _U('owner', infos.owner), value = nil})
	  end
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'vehicle_infos',
		{
		  title    = _U('vehicle_info'),
		  align    = 'top-right',
		  elements = elements,
		},
		nil, function(data, menu)
		  menu.close()
		end)
	end, vehicleData.plate)
end

--Handcuff timer Handler
function StarthandcuffTimer()
	if Config.EnablehandcuffTimer and handcuffTimer.active then
		ESX.ClearTimeout(handcuffTimer.task)
	end

	handcuffTimer.active = true

	handcuffTimer.task = ESX.SetTimeout(Config.handcuffTimer, function()
		ESX.ShowNotification(_U('unrestrained_timer'))
		TriggerEvent('esx_policejob:unrestrain')
		handcuffTimer.active = false
	end)
end

function isEmployed()
    PlayerData = ESX.GetPlayerData()
    if PlayerData ~= nil then
        local isJobTrue = false
        if PlayerData.job ~= nil and PlayerData.job.name == "police" then
            isJobTrue = true
        end
        return isJobTrue
    end
end

function isBoss()
    PlayerData = ESX.GetPlayerData()
    if PlayerData ~= nil then 
        local isBoss = false
        if isEmployed() and PlayerData.job.grade_name == "boss" then
            isBoss = true
        end
        return isBoss
    end
end

--Clean Player before puts on uniform
function cleanPlayer(playerPed)
	SetPedArmour(playerPed, 0)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

--Sell Drugs to Evidence
function SellDrugs()
	ESX.UI.Menu.CloseAll()
	local elements = {}
	menuOpen = true

	for k, v in pairs(ESX.GetPlayerData().inventory) do
		local price = Config.DrugPrices[v.name]

		if price and v.count > 0 then
			table.insert(elements, {
				label = ('%s - <span style="color:green;">%s</span>'):format(v.label, _U('dealer_item', ESX.Math.GroupDigits(price))),
				name = v.name,
				price = price,

				-- menu properties
				type = 'slider',
				value = v.count,
				min = 1,
				max = v.count
			})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'drug_shop', {
		title    = _U('dealer_title'),
		align    = 'top-right',
		elements = elements
	}, function(data, menu)
		TriggerServerEvent('DA&D92nD_293kTeu:sell82jdgh26drug', data.current.name, data.current.value)
	end, function(data, menu)
		menu.close()
		menuOpen = false
	end)
end

--Wash Cash
function WashMoney()
	ESX.UI.Menu.CloseAll()
	local elements = {
		{label = _U('moneywash_wash'), value = 'moneywash_wash'}
	}
	menuOpen = true

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'drug_shop', {
		title    = _U('moneywash_title'),
		align    = 'top-right',
		elements = elements
	}, function(data, menu)
		if data.current.value == 'moneywash_wash' then
			TriggerServerEvent('637D_dmlo:WashMoney*nn2jdad')
		end
	end, function(data, menu)
		menu.close()
		menuOpen = false
	end)
end

--Put item in Evidence
function OpenPutItemMenu()
	ESX.TriggerServerCallback('esx_policejob:getPlayerInventory', function(inventory)
		local elements = {}
	
		for i=1, #inventory.items, 1 do
		  local item = inventory.items[i]
	
		  if item.count > 0 then
			table.insert(elements, {label = item.label .. ' x' .. item.count, type = 'item_standard', value = item.name})
		  end
	
		end
	
		ESX.UI.Menu.Open(
		  'default', GetCurrentResourceName(), 'stocks_menu',
		  {
			title    = _U('inventory'),
			align = 'top-right',
			elements = elements
			
		  },
		  function(data, menu)
			local itemName = data.current.value
			ESX.UI.Menu.Open(
			  'dialog', GetCurrentResourceName(), 'stocks_menu_put_item_count',
			  {
				title = _U('quantity')
			  },
			  function(data2, menu2)
	
				local count = tonumber(data2.value)
				if count == nil then
				  exports['mythic_notify']:DoHudText("error", "Invalid Quantity")
				else
				  menu2.close()
				  menu.close()
				  OpenPutItemMenu()
				  TriggerServerEvent('esx_policejob:putStockItems', itemName, count)
				end
	
			  end,
			  function(data2, menu2)
				menu2.close()
			  end)
	
		  end,function(data, menu)
			menu.close()
		end)
	end)
end

function setOutfit(outfit)
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

--Put weapon into Evidence
function OpenPutWeaponMenu()
	local elements   = {}
	local playerPed  = PlayerPedId()
	local weaponList = ESX.GetWeaponList()
  
	for i=1, #weaponList, 1 do
	  local weaponHash = GetHashKey(weaponList[i].name)
  
	  if HasPedGotWeapon(playerPed,  weaponHash,  false) and weaponList[i].name ~= 'WEAPON_UNARMED' then
		--local ammo = GetAmmoInPedWeapon(playerPed, weaponHash)
		table.insert(elements, {label = weaponList[i].label, value = weaponList[i].name})
	  end
	end
  
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'armory_put_weapon',
	{
		title    = _U('put_weapon_menu'),
		align    = 'top-right',
		elements = elements,
	},
	function(data, menu)
		menu.close()
	ESX.TriggerServerCallback('esx_policejob:addArmoryWeapon', function()
		OpenPutWeaponMenu()
	end, data.current.value, true)
	end,
	function(data, menu)
		menu.close()
	end)
end

--Get Weapon
function OpenGetWeaponMenu()
	ESX.TriggerServerCallback('esx_policejob:getArmoryWeapons', function(weapons)
  
	  local elements = {}
  
	  for i=1, #weapons, 1 do
		if weapons[i].count > 0 then
		  table.insert(elements, {label = 'x' .. weapons[i].count .. ' ' .. ESX.GetWeaponLabel(weapons[i].name), value = weapons[i].name})
		end
	  end
  
	  ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'armory_get_weapon',
		{
		  title    = _U('get_weapon_menu'),
		  align    = 'top-right',
		  elements = elements,
		},
		function(data, menu)
  
		  menu.close()
  
		  ESX.TriggerServerCallback('esx_policejob:removeArmoryWeapon', function()
			OpenGetWeaponMenu()
		  end, data.current.value)
  
		end,
		function(data, menu)
		  menu.close()
		end)
	end)
end

--Get Stock
function OpenGetStockMenu()
	ESX.TriggerServerCallback('esx_policejob:getStockItems', function(items)
		local elements = {}
  
		for i=1, #items, 1 do
			table.insert(elements, {label = 'x' .. items[i].count .. ' ' .. items[i].name, value = items[i].name})
	  	end
	  	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'stocks_menu',
		{
		  title    = _U('police_stock'),
		  align = 'top-right',
		  elements = elements
		},
		function(data, menu)
  			local itemName = data.current.value

			ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'stocks_menu_get_item_count',
			{
			  title = _U('quantity')
			},
			function(data2, menu2)
  				local count = tonumber(data2.value)
  
			  	if count == nil then
					exports['mythic_notify']:DoHudText("error", "Invalid quantity")
			  	else
					menu2.close()
					menu.close()
					OpenGetStocksMenu()
  
					TriggerServerEvent('esx_policejob:getStockItem', itemName, count)
			  	end
			end,function(data2, menu2)
			  menu2.close()
			end)
		end,function(data, menu)
		  menu.close()
		end)
	end)
end

--Wardrobe Menu
function OpenWardrobeMenu()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'wardrobe_actions', {
		title = _U('mobile_wardrobe_gender'),
		align = 'top-right',
		elements = {
			{label = _U('male_wardrobe'), value = 'male_wardrobe'},
			{label = _U('female_wardrobe'), value = 'female_wardrobe'},
			{label = _U('own_clothes'), value = 'own_clothes'}
		}
	}, function(data, menu)
		if data.current.value == "male_wardrobe" then
			local elements = {}
			for i, j in pairs(Config.MaleOutfits) do
				table.insert(elements, {label = j.name, value = j.name})
			end
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'male_drobe', {
				title = _U('male_wardrobe'),
				align = 'top-right',
				elements = elements
			}, function(data2, menu2)
				for i, j in pairs(Config.MaleOutfits) do
					if data2.current.value == j.name then
						setOutfit(j)
					end
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == "female_wardrobe" then
			local elements = {}
			for i, j in pairs(Config.FemaleOutfits) do
				table.insert(elements, {label = j.name, value = j.name})
			end
			ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'fem_drobe', {
				title = _U('female_wardrobe'),
				align = 'top-right',
				elements = elements
			}, function(data2, menu2)
				for i, j in pairs(Config.FemaleOutfits) do
					if data2.current.value == j.name then
						setOutfit(j)
					end
				end
			end, function(data2, menu2)
				menu2.close()
			end)
		elseif data.current.value == "own_clothes" then
			menu.close()
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
		end
	end, function(data, menu)
		menu.close()
	end)
end

--Evidence Room
function OpenEvidenceMenu()
	local elements = {
		{label = 'Store Weapon',     value = 'put_weapon'},
		{label = 'Store Item', value = 'put_item'},
	}
	if ESX.PlayerData.job.grade_name == 'boss' or ESX.PlayerData.job.grade_name == 'viceboss' then
		table.insert(elements, {label = 'Sell Drugs to Government Researchers', value = 'sell_drugs'})
		table.insert(elements, {label = 'Convert Illegal Money', value = 'wash'})
		table.insert(elements, {label = 'Withdraw Weapon', value = 'get_weapon'})
		table.insert(elements, {label = 'Withdraw Item', value = 'get_stock'})
	end

	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'evidence', 
	{
		title    = _U('evidence_title'),
		align 		= 'top-right',
		elements = elements
	  },
	function(data, menu)
		if data.current.value == "put_weapon" then
			OpenPutWeaponMenu()
		elseif data.current.value == "put_item" then
			OpenPutItemMenu()
		elseif data.current.value == "selldrugs" then
			SellDrugs()
		elseif data.current.value == "wash" then
			WashMoney()
		elseif data.current.value == "get_weapon" then
			OpenGetWeaponMenu()
		elseif data.current.value == "get_stock" then
			OpenGetStockMenu()
		end
		end, function(data, menu)
			menu.close()
		end)
end

--Check if Player has unpaid fines
function OpenUnpaidBillsMenu(player)
	local elements = {}

	ESX.TriggerServerCallback('esx_billing:getTargetBills', function(bills)
		for k,bill in ipairs(bills) do
			table.insert(elements, {
				label = ('%s - <span style="color:red;">%s</span>'):format(bill.label, _U('armory_item', ESX.Math.GroupDigits(bill.amount))),
				billId = bill.id
			})
		end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'billing', {
			title    = _U('unpaid_bills'),
			align    = 'top-right',
			elements = elements
		}, nil, function(data, menu)
			menu.close()
		end)
	end, player)
end

--F6 Menu
function OpenPoliceActionsMenu()
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'police_actions', {
		title = _U('job_menu'),
		align = 'top-right',
		elements = {
			{label = _U('citizen_interaction'), value = 'citizen_interaction'},
			{label = _U('vehicle_interaction'), value = 'vehicle_interaction'},
			{label = _U('prison_menu'), 		value = 'prison_menu'},
			{label = _U('community_service'), 	value = 'community_service'},
			{label = _U('wardrobe'), 			value = 'wardrobe'}
		}
	}, function(data, menu)
	if data.current.value == "citizen_interaction" then
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'citizen_interaction', {
			title = _U('citizen_interaction_menu'),
			align = 'top-right',
			elements = {
			{label = _U('handcuff'),		value = 'handcuff'},
			{label = _U('search'),			value = 'body_search'},
			{label = _U('drag'),			value = 'drag'},
			{label = _U('put_in_vehicle'),	value = 'put_in_vehicle'},
			{label = _U('out_the_vehicle'),	value = 'out_the_vehicle'},
			{label = _U('fine_player'), 	value = 'fine_player'},
			{label = _U('check_fines'), 	value = 'check_fines'},
			{label = _U('gsr'),			 	value = 'gsr_test' },
		}
	}, function(data2,menu2)
		local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
		if closestPlayer ~= -1 and closestDistance <= 2.5 then
			local action = data2.current.value
			if action == "handcuff" then
				TriggerServerEvent("esx_policejob:CuffPlayer", GetPlayerServerId(closestPlayer))
			elseif action == "body_search" then
				local closestID = GetPlayerServerId(target)
				print("Closest Player:  " .. closestPlayer)
				print("His ID: ".. closestID)
				TriggerServerEvent("mf-inventory:search", GetPlayerServerId(closestPlayer, closestID))
			elseif action == "drag" then
				TriggerServerEvent('esx_policejob:drag', GetPlayerServerId(closestPlayer))
			elseif action == "put_in_vehicle" then
				TriggerServerEvent('esx_policejob:putInVehicle', GetPlayerServerId(closestPlayer))
			elseif action == "out_the_vehicle" then
				TriggerServerEvent('esx_policejob:OutVehicle', GetPlayerServerId(closestPlayer))
			elseif action == "fine_player" then
				ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'billing',
				{
					title = _U('invoice_amount')
				},
				function(data3, menu3)
					local amount = tonumber(data3.value)
					if amount ~= nil then
						menu.close()
						TriggerServerEvent("esx_billing:sendBill", GetPlayerServerId(closestPlayer), 'society_police', "Police Fine", amount)
						TriggerServerEvent('esx_policejob:logBill', ESX.GetPlayerData(), GetPlayerServerId(closestPlayer), 'society_police', "Police Fine", amount)
						ESX.UI.Menu.CloseAll()
					else
						exports['mythic_notify']:DoHudText('error', _U('invalid_enty'))
					end
				end, function(data3,menu3)
					menu.close()
				end)
			elseif action == "check_fines" then
				OpenUnpaidBillsMenu(GetPlayerServerId(closestPlayer))
			elseif action == "gsr" then
				exports['mythic_notify']:DoHudText('inform', "Still in Development")
			end
		else
			exports['mythic_notify']:DoHudText("error", "No players nearby!")
		end
	end, function(data2, menu2)
		menu.close()
	end)
	elseif data.current.value == "vehicle_interaction" then
		local elements = {}
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		local vehicle = ESX.Game.GetVehicleInDirection()

		if DoesEntityExist(vehicle) then
			table.insert(elements, {label = _U('vehicle_info'),	value = 'vehicle_info'})
			table.insert(elements, {label = _U('pick_lock'),	value = 'hijack_vehicle'})
		end
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'vehicle_interaction', {
			title = _U('vehicle_interaction_title'),
			align = 'top-right',
			elements = elements,
		}, function(data3, menu3)
			coords    = GetEntityCoords(playerPed)
			vehicle   = ESX.Game.GetVehicleInDirection()
			action    = data3.current.value
			if DoesEntityExist(vehicle) then
				local vehicleData = ESX.Game.GetVehicleProperties(vehicle)
				if action == 'vehicle_info' then
					OpenVehicleInfosMenu(vehicleData)
				elseif action == "hijack_vehicle" then
					if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.0) then
						TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_WELDING", 0, true)
						Citizen.Wait(15000)
						ClearPedTasksImmediately(playerPed)

						SetVehicleDoorsLocked(vehicle, 1)
						SetVehicleDoorsLockedForAllPlayers(vehicle, false)
						exports['mythic_notify']:DoHudText("success", "Vehicle unlocked")
					end
				end
			end
		end, function(data3, menu3)
			menu3.close()
		end)
	elseif data.current.value == "prison_menu" then
		menu.close()
		TriggerEvent("HD_Jail:JailMenu")
	elseif data.current.value == "community_service" then
		exports['mythic_notify']:DoHudText('inform', "Still in Development")
	elseif data.current.value == "wardrobe" then
		ESX.UI.Menu.CloseAll()
		OpenWardrobeMenu()
	end
	end, function(data, menu)
		menu.close()
	end)
end

function OpenWeaponStorage()
	local elements = {}
	for i = 1, #Config.ArmoryWeapons, 1 do
		local weapon = Config.ArmoryWeapons[i]

		table.insert(elements, { ["label"] = ESX.GetWeaponLabel(weapon["hash"]), ["weapon"] = weapon })
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "police_armory_weapon_menu",
	{
		title = 'Met Police Armoury',
		align = 'center',
		elements = elements
	}, function(data, menu)
		local weaponHash = data.current["weapon"]["hash"]
		TriggerServerEvent('esx_policejob:giveWeapon', weaponHash)
	end, function(data, menu)
		menu.close()
	end)
end

function OpenPoliceArmory()
	if isEmployed() then
		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'police_armoury_menu', {
			title  = _U('police_armory'),
			align  = 'center',
			elements = {
				{label = _U('armoury_draw'),	value = 'armoury_draw' },
				{label = _U('armoury_store'),	value = 'armoury_store' },
			},
		}, function(data, menu)
			if data.current.value == "armoury_draw" then
				OpenWeaponStorage()
			elseif data.current.value == "armoury_store" then
				local playerPed = PlayerPedId()
				RemoveAllPedWeapons(playerPed, true)
			end
		end, function(data, menu)
			menu.close()
		end)
	end
end
RegisterNetEvent('HD_Jail:ResetPMenu')
AddEventHandler('HD_Jail:ResetPMenu', function()
	OpenPoliceActionsMenu()
end)

-- Function for Attachment menu:
function AttachmentMenu()
	local elements = {}
	local ped = GetPlayerPed(-1)
			
	for k,v in pairs(Config.ArmouryWeaponsAndAttachments) do
		if v.attachment == true then
			table.insert(elements,{label = v.label, weaponhash = v.weaponHash, type = v.type, attachment = v.attachment, flashlight = v.flashlight, scope = v.scope, suppressor = v.suppressor})
		end
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), "esx_policeArmory_attachment_menu",
		{
			title    = _U('choose_weapon'),
			align    = "center",
			elements = elements
		},
	function(data, menu)
			if data.current.weaponhash == data.current.weaponhash then
				if GetSelectedPedWeapon(ped) == GetHashKey(data.current.weaponhash) then
					ListOfAttachments(data.current.type, data.current.label, data.current.weaponhash, data.current.attachment, data.current.flashlight, data.current.scope, data.current.suppressor)
				else
					exports['mythic_notify']:DoHudText("error", "Weapon not in hand")
				end
			end	
	end, function(data, menu)
		menu.close()
		insideMarker = false
	end, function(data, menu)
	end)
end

-- Function for Attachment List Menu:
function ListOfAttachments(type,name,weaponhash,attachment,flashlight,scope,suppressor)
	local elements = {}
	
	local ped = GetPlayerPed(-1)
			
	if flashlight then
		local state = HasPedGotWeaponComponent(ped, weaponhash, flashlight)
		local text
		
		if state then
			text = "Flashlight: "..('<span style="color:green;">%s</span>'):format("On")
		else
			text = "Flashlight: "..('<span style="color:red;">%s</span>'):format("Off")
		end
		
		table.insert(elements, {
			label = text,
			value = flashlight,
			state = not state
		})
	end
			
	if scope then
		local state = HasPedGotWeaponComponent(ped, weaponhash, scope)
		local text
		
		if state then
			text = "Scope: "..('<span style="color:green;">%s</span>'):format("On")
		else
			text = "Scope: "..('<span style="color:red;">%s</span>'):format("Off")
		end
		
		table.insert(elements, {
			label = text,
			value = scope,
			state = not state
		})
	end
			
	if suppressor then
		local state = HasPedGotWeaponComponent(ped, weaponhash, suppressor)
		local text
		
		if state then
			text = "Suppressor: "..('<span style="color:green;">%s</span>'):format("On")
		else
			text = "Suppressor: "..('<span style="color:red;">%s</span>'):format("Off")
		end
		
		table.insert(elements, {
			label = text,
			value = suppressor,
			state = not state
		})
	end

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'policeArmory_list_of_attachments', {
		title    = _U('choose_attach'),
		align    = 'top-right',
		elements = elements
	}, function(data, menu)
		local newData = data.current
		
		if data.current.value == flashlight then
			if data.current.state then
				newData.label = "Flashlight: "..('<span style="color:green;">%s</span>'):format("On")
				GiveWeaponComponentToPed(ped, weaponhash, data.current.value)
				exports['mythic_notify']:DoHudText('inform', 'Flaslight Equipped.')
			else
				newData.label = "Flashlight: "..('<span style="color:red;">%s</span>'):format("Off")
				RemoveWeaponComponentFromPed(ped, weaponhash, data.current.value)
				exports['mythic_notify']:DoHudText('inform', 'Flashlight Removed.')

			end
		elseif data.current.value == scope then
			if data.current.state then
				newData.label = "Scope: "..('<span style="color:green;">%s</span>'):format("On")
				GiveWeaponComponentToPed(ped, weaponhash, data.current.value)
				exports['mythic_notify']:DoHudText('inform', 'Sight Equipped.')
		
			else
				newData.label = "Scope: "..('<span style="color:red;">%s</span>'):format("Off")
				RemoveWeaponComponentFromPed(ped, weaponhash, data.current.value)
				exports['mythic_notify']:DoHudText('inform', 'Sight Removed.')
			end
		elseif data.current.value == suppressor then
			if data.current.state then
				newData.label = "Suppressor: "..('<span style="color:green;">%s</span>'):format("On")
				GiveWeaponComponentToPed(ped, weaponhash, data.current.value)
				exports['mythic_notify']:DoHudText('inform', 'Suppressor Equipped.')

			else
				newData.label = "Suppressor: "..('<span style="color:red;">%s</span>'):format("Off")
				RemoveWeaponComponentFromPed(ped, weaponhash, data.current.value)
				exports['mythic_notify']:DoHudText('inform', 'Suppressor Removed.')
	
			end
		end
				
		newData.state = not data.current.state
		menu.update({value = data.current.value}, newData)
		menu.refresh()
	end, function(data, menu)
		menu.close()		
	end)
end

--Event Handlers
RegisterNetEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)

		if IsAnyVehicleNearPoint(coords, 5.0) then
			local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

			if DoesEntityExist(vehicle) then
				local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

				for i=maxSeats - 1, 0, -1 do
					if IsVehicleSeatFree(vehicle, i) then
						freeSeat = i
						break
					end
				end

				if freeSeat then
					TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
					dragStatus.isDragged = false
				end
			end
		end
	end
end)

RegisterNetEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function()
	local playerPed = PlayerPedId()

	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed, false)
		TaskLeaveVehicle(playerPed, vehicle, 64)
	end
end)

RegisterNetEvent('esx_policejob:unrestrain')
AddEventHandler('esx_policejob:unrestrain', function()
	if isHandcuffed then
		local playerPed = PlayerPedId()
		isHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)

		-- end timer
		if handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end
	end
end)

RegisterNetEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(copId)
	if isHandcuffed then
		dragStatus.isDragged = not dragStatus.isDragged
		dragStatus.CopId = copId
	end
end)


--Cuff
RegisterNetEvent('esx_policejob:CuffPlayer')
AddEventHandler('esx_policejob:CuffPlayer', function()
	isHandcuffed = not isHandcuffed
	local playerPed = PlayerPedId()

	if isHandcuffed then
		RequestAnimDict('mp_arresting')
		while not HasAnimDictLoaded('mp_arresting') do
			Citizen.Wait(100)
		end

		TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

		SetEnableHandcuffs(playerPed, true)
		DisablePlayerFiring(playerPed, true)
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
		SetPedCanPlayGestureAnims(playerPed, false)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(false)

		if Config.EnableHandcuffTimer then
			if handcuffTimer.active then
				ESX.ClearTimeout(handcuffTimer.task)
			end

			StartHandcuffTimer()
		end
	else
		if Config.EnableHandcuffTimer and handcuffTimer.active then
			ESX.ClearTimeout(handcuffTimer.task)
		end

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)
		FreezeEntityPosition(playerPed, false)
		DisplayRadar(true)
	end
end)

RegisterNetEvent('esx_policejob:OpenEvidence')
AddEventHandler('esx_policejob:OpenEvidence', function()
	if isEmployed() then
		OpenEvidenceMenu()
	end
end)

RegisterNetEvent('esx_policejob:spawnArmouryPed')
AddEventHandler('esx_policejob:spawnArmouryPed', function(hash, coords, heading)
	local hash = GetHashKey(hash)
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Wait(10)
    end
    while not HasModelLoaded(hash) do 
        Wait(10)
    end

    pedSpawned = true
    ped = CreatePed(5, hash, coords, heading, false, false)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
end)

--Armoury
RegisterNetEvent('esx_policeJob:openArmoury')
AddEventHandler('esx_policeJob:openArmoury', function()
	OpenPoliceArmory()
end)

--Kevlar
RegisterNetEvent('esx_policeJob:getArmour')
AddEventHandler('esx_policeJob:getArmour', function()
	local playerPed = PlayerPedId()
	SetPedArmour(playerPed, 100)
end)

--Basic Kit
RegisterNetEvent('esx_policejob:GetKit')
AddEventHandler('esx_policejob:GetKit', function()
	TriggerServerEvent('esx_policejob:GetKit')
end)

--Attachments
RegisterNetEvent('esx_policejob:getAttachments')
AddEventHandler('esx_policejob:getAttachments', function()
	AttachmentMenu()
end)

--Boss Menu
RegisterNetEvent("esx_policejob:openBossMenu")
AddEventHandler("esx_policejob:openBossMenu", function()
    if isBoss() then
        TriggerEvent('esx_society:openBossMenu', 'police')
    else
        exports["mythic_notify"]:DoHudText('error', "You do not have permission to do this.")
    end
end)

--ESX thread
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == bil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

Citizen.CreateThread(function()
	local wasDragged

	while true do
		Citizen.Wait(0)
		local playerPed = PlayerPedId()

		if isHandcuffed and dragStatus.isDragged then
			local targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))

			if DoesEntityExist(targetPed) and IsPedOnFoot(targetPed) and not IsPedDeadOrDying(targetPed, true) then
				if not wasDragged then
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
					wasDragged = true
				else
					Citizen.Wait(1000)
				end
			else
				wasDragged = false
				dragStatus.isDragged = false
				DetachEntity(playerPed, true, false)
			end
		elseif wasDragged then
			wasDragged = false
			DetachEntity(playerPed, true, false)
		else
			Citizen.Wait(500)
		end
	end
end)

--Roboestado (Can't fuck about while cuffed)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if isHandcuffed then
			if not IsEntityPlayingAnim(GetPlayerPed(PlayerId()), 'mp_arresting', 'idle', 3) then
				TaskPlayAnim(GetPlayerPed(PlayerId()), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)
			end
			DisableControlAction(2, 73, true)
			DisplayRadar(false)
			--DisableControlAction(2, 1, true) -- Disable pan
			--DisableControlAction(2, 2, true) -- Disable tilt
			DisableControlAction(2, 24, true) -- Attack
			DisableControlAction(2, 257, true) -- Attack 2
			DisableControlAction(2, 25, true) -- Aim
			DisableControlAction(2, 263, true) -- Melee Attack 1
			DisableControlAction(2, Keys['R'], true) -- Reload
			DisableControlAction(2, Keys['TOP'], true) -- Open phone (not needed?)
			DisableControlAction(2, Keys['SPACE'], true) -- Jump
			DisableControlAction(2, Keys['Q'], true) -- Cover
			DisableControlAction(2, Keys['TAB'], true) -- Select Weapon
			DisableControlAction(2, Keys['F'], true) -- Also 'enter'?
			DisableControlAction(2, Keys['F1'], true) -- Disable phone
			DisableControlAction(2, Keys['F2'], true) -- Inventory
			DisableControlAction(2, Keys['F3'], true) -- Animations
			DisableControlAction(2, Keys['V'], true) -- Disable changing view
			DisableControlAction(2, Keys['P'], true) -- Disable pause screen
			DisableControlAction(2, 59, true) -- Disable steering in vehicle
			DisableControlAction(2, Keys['LEFTCTRL'], true) -- Disable going stealth
			DisableControlAction(0, 47, true)  -- Disable weapon
			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
      		DisableControlAction(2, Keys['LEFTSHIFT'], true) --Sprinting
		else
			Citizen.Wait(500)
		end
	end
end)

--Key Controls
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(0, Keys['F6']) and isEmployed() and not ESX.UI.Menu.IsOpen('default', GetCurrentResourceName(), 'police_actions') then
            OpenPoliceActionsMenu()
        else 
        end
        if IsControlJustReleased(0, Keys['BACKSPACE']) and isEmployed() then
            ESX.UI.Menu.CloseAll()
        end
    end
end)

--Spawn Armory Ped
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local myCoords = GetEntityCoords(GetPlayerPed(-1))
        local pedCoords = vector3(Config.Armourer.x, Config.Armourer.y, Config.Armourer.z)
        local pedhash = "s_m_y_cop_01"
        local pedHeading = Config.ArmourerHeading
        local dist = #(pedCoords - myCoords)

        if dist < 75 and pedSpawned == false then 
            TriggerEvent('esx_policejob:spawnArmouryPed', pedhash, pedCoords, Config.ArmourerHeading)
            pedSpawned = true
        end
    end
end)

--Qtargets
Citizen.CreateThread(function()
	--Evidence
	exports['qtarget']:AddTargetModel({1333557690}, {
		options = {
			{
				event = "esx_policejob:OpenEvidence",
				icon = "fas fa-clipboard",
				label = "Access Evidence",
			},
		},
        job = {'police'},
        distance = 1.5,
	})
	--Duty (Coffee Machine)
    exports['qtarget']:AddTargetModel({690372739}, {
        options = {
            {
                event = "LCRP_Duty:toggleDuty",
                icon  = "fas fa-stopwatch",
                label = "Clock In/Out",
            },
        },
        job = {['police'] = 0, ['offpolice'] = 0},
        distance = 2.5,
    })
	--Armourer
	local armourer = {`s_m_y_cop_01`}
	exports['qtarget']:AddTargetModel(armourer, {
        options = {
            {
                event = "esx_policeJob:openArmoury",
                icon  = "fas fa-typo3",
                label = "Open Armoury",
            },
			{
				event = "esx_policeJob:getArmour",
				icon  = "fas fa-tshirt",
                label = "Get Kevlar",
			},
			{
				event = "esx_policejob:GetKit",
				icon = "fas fa-random",
				label = "Get basic kit",
			}
        },
        job = {'police'},
        distance = 2.5,
    })
	--Attachments
	exports['qtarget']:AddTargetModel({765424411}, {
        options = {
            {
                event = "esx_policejob:getAttachments",
                icon  = "fas fa-typo3",
                label = "Get Attachments",
            },
        },
        job = {'police'},
        distance = 2.5,
    })
	exports['qtarget']:AddTargetModel({1910331218}, {
		options = {
			{
				event = "esx_policejob:openBossMenu",
				icon = "fas fa-",
				label = "Open Boss Menu",
			},
		},
		job = {'police'},
		distance = 1.5,
	})
end)