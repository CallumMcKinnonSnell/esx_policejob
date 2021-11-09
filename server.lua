ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('esx_society:registerSociety', 'police', 'Police', 'society_police', 'society_police', 'society_police', {type = 'public'})

RegisterServerEvent("esx_policejob:giveWeapon")
AddEventHandler("esx_policejob:giveWeapon", function(weapon)
    local player = ESX.GetPlayerFromId(source)

    if player then
        player.addWeapon(weapon, Config.ReceiveAmmo)

        TriggerClientEvent("esx:showNotification", source, "You just received 1x " .. ESX.GetWeaponLabel(weapon) .. " with " .. Config.ReceiveAmmo .. "x ammo.")
    end
end)

RegisterServerEvent("esx_policejob:GetKit")
AddEventHandler("esx_policejob:GetKit", function()
	local xPlayer = ESX.GetPlayerFromId(source)

	local xGPS = xPlayer.getInventoryItem('gps')
    if xGPS.count > 0 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You were not given a GPS as you already have one'})
    else
        xPlayer.addInventoryItem('gps', 1)
    end

    local xGPS = xPlayer.getInventoryItem('fixkit')
    if xGPS.count > 1 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You were not given Repair Kits as you already have two'})
    else
        xPlayer.addInventoryItem('fixkit', 1)
    end 
    local xGPS = xPlayer.getInventoryItem('radio')
    if xGPS.count > 0 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You were not given a radio as you already have one'})
    else
        xPlayer.addInventoryItem('radio', 1)
    end
    local xGPS = xPlayer.getInventoryItem('phone')
    if xGPS.count > 0 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You were not given a phone as you already have one'})
    else
        xPlayer.addInventoryItem('phone', 1)
    end      
    local xGPS = xPlayer.getInventoryItem('bread')
    if xGPS.count > 4 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You were not given bread as you already have five'})
    else
        xPlayer.addInventoryItem('bread', 1)
    end
    local xGPS = xPlayer.getInventoryItem('water')
    if xGPS.count > 4 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You were not given a water as you already have five'})
    else
        xPlayer.addInventoryItem('water', 1)
    end
    local xGPS = xPlayer.getInventoryItem('weabox')
    if xGPS.count > 1 then
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'You were not given an ammo box as you already have one'})
    else
        xPlayer.addInventoryItem('weabox', 1)
    end
end)

RegisterServerEvent('esx_policejob:CuffPlayer')
AddEventHandler('esx_policejob:CuffPlayer', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem("cuffs")
	if target ~= -1 then
		if xItem.count >= 1 then 
			TriggerClientEvent('esx_policejob:CuffPlayer', target)
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'You need cuffs to cuff someone'})
		end
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'No Player Found!'})
	end
end)

RegisterNetEvent('esx_policejob:drag')
AddEventHandler('esx_policejob:drag', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	if target ~= -1 then
		TriggerClientEvent('esx_policejob:drag', target, source)
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'No Player Found!'})
	end
end)

RegisterNetEvent('esx_policejob:putInVehicle')
AddEventHandler('esx_policejob:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	TriggerClientEvent('esx_policejob:putInVehicle', target)
end)

RegisterNetEvent('esx_policejob:OutVehicle')
AddEventHandler('esx_policejob:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
	if target ~= -1 then
		TriggerClientEvent('esx_policejob:OutVehicle', target)
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'No Player Found!'})
	end
end)


RegisterServerEvent('esx_policejob:putStockItems')
AddEventHandler('esx_policejob:putStockItems', function(itemName, count)
  local xPlayer = ESX.GetPlayerFromId(source)

  TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
    local item = inventory.getItem(itemName)

    if item.count >= 0 then
      xPlayer.removeInventoryItem(itemName, count)
      inventory.addItem(itemName, count)
      
    else
      --TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end
    --TriggerClientEvent('esx:showNotification', xPlayer.source, _U('added') .. count .. ' ' .. item.label)

  end)

end)

--[[ RegisterServerEvent('esx_policejob:logBill')
AddEventHandler("esx_policejob:logBill", function(issuer, Recipient, sharedAccountName, label, amount)
	--print(GetPlayerName(Recipient))
	local issuerID = issuer.identifier
	MySQL.Async.fetchAll("SELECT * FROM users where identifier = @issuer", { 
		["@issuer"] = issuerID
	}, function(result)
		if result ~= nil then
			--print("Officer Name: "..result[1].name)
			
		else
			print("No Officer Found, please clip this and report to admin")

		end
	end)
end) ]]

--Put weapon in armory
ESX.RegisterServerCallback('esx_policejob:addArmoryWeapon', function(source, cb, weaponName, removeWeapon)

	local xPlayer = ESX.GetPlayerFromId(source)
  
	if removeWeapon then
	 xPlayer.removeWeapon(weaponName)
	 
	end
  
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
	  local weapons = store.get('weapons')
  
	  if weapons == nil then
		weapons = {}
	  end
	  local foundWeapon = false
	  for i=1, #weapons, 1 do
		if weapons[i].name == weaponName then
		  weapons[i].count = weapons[i].count + 1
		  foundWeapon = true
		end
	  end
	  if not foundWeapon then
		table.insert(weapons, {
		  name  = weaponName,
		  count = 1
		})
	  end
	   store.set('weapons', weapons)
	   cb()
	end)
  end)

--Get Player Inventory
  ESX.RegisterServerCallback('esx_policejob:getPlayerInventory', function(source, cb)

	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory
  
	cb({
	  items = items
	})
  
  end)
--Sell drugs to researchers
RegisterServerEvent('DA&D92nD_293kTeu:sell82jdgh26drug')
AddEventHandler('DA&D92nD_293kTeu:sell82jdgh26drug', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = Config.DrugPrices[itemName]
	local xItem = xPlayer.getInventoryItem(itemName)

	if not price then
		print(('esx_illegal: %s attempted to sell an invalid drug!'):format(xPlayer.identifier))
		return
	end

	if xItem.count < amount then
		TriggerClientEvent('esx:showNotification', source, _U('dealer_notenough'))
		return
	end

	price = ESX.Math.Round(price * amount)
	xPlayer.addMoney(price)
	xPlayer.removeInventoryItem(xItem.name, amount)

end)

RegisterServerEvent('637D_dmlo:WashMoney*nn2jdad')
AddEventHandler('637D_dmlo:WashMoney*nn2jdad', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local amount = xPlayer.GetAccount('black_money')
	xPlayer.removeAccountMoney(amount)
	xPlayer.addMoney(amount)
end)

RegisterServerEvent('esx_policejob:getStockItem')
AddEventHandler('esx_policejob:getStockItem', function(itemName, count)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
    local item = inventory.getItem(itemName)

    if item.count >= count then
    	inventory.removeItem(itemName, count)
      	xPlayer.addInventoryItem(itemName, count)
      	
    else
      	TriggerClientEvent('esx:showNotification', xPlayer.source, _U('quantity_invalid'))
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, _U('have_withdrawn') .. count .. ' ' .. item.label)

  	end)

end)

ESX.RegisterServerCallback('esx_policejob:getArmoryWeapons', function(source, cb)
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)

	local weapons = store.get('weapons')

	if weapons == nil then
		weapons = {}
	end

	cb(weapons)

	end)
end)

ESX.RegisterServerCallback('esx_policejob:removeArmoryWeapon', function(source, cb, weaponName)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addWeapon(weaponName, 250)
	
  
	TriggerEvent('esx_datastore:getSharedDataStore', 'society_police', function(store)
  
	  local weapons = store.get('weapons')
  
	  if weapons == nil then
		weapons = {}
	  end
  
	  local foundWeapon = false
  
	  for i=1, #weapons, 1 do
		if weapons[i].name == weaponName then
		  weapons[i].count = (weapons[i].count > 0 and weapons[i].count - 1 or 0)
		  foundWeapon = true
		end
	  end
  
	  if not foundWeapon then
		table.insert(weapons, {
		  name  = weaponName,
		  count = 0
		})
	  end
  
	   store.set('weapons', weapons)
  
	   cb()
  
	end)
  
  end)

  ESX.RegisterServerCallback('esx_policejob:getStockItems', function(source, cb)

	TriggerEvent('esx_addoninventory:getSharedInventory', 'society_police', function(inventory)
	  cb(inventory.items)
	end)
  
  end)