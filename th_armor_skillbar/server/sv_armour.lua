ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

RegisterServerEvent('th_armor:armorremove')
AddEventHandler('th_armor:armorremove', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('armor', 1)
end)

ESX.RegisterUsableItem('armor', function(source)
	TriggerClientEvent('th_armor:armor', source)
end)

