-- Remake of esx_armour
-- Made By thicc#9999
-- Enjoy!


ESX          = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('th_armor:armor')
AddEventHandler('th_armor:armor', function()

  if GetPedArmour(GetPlayerPed(-1)) == 100 then
    TriggerEvent('notification', 'You are already wearing armor ')
  else
    local finished = exports["reload-skillbar"]:taskBar(4000,math.random(5,15))
    if finished ~= 100 then
        TriggerEvent('notification', 'Failed to equip armor', 2)
    else
      local finished2 = exports["reload-skillbar"]:taskBar(4000,math.random(5,15))
      if finished2 ~= 100 then
          TriggerEvent('notification', 'Failed to equip armor', 2)
      else
      TriggerEvent('th_armor:vest')
      exports['np-taskbar']:taskBar(5000, 'Setting Up Armor...')
      TriggerEvent('notification', 'Succseesfully equiped an armor')
      SetPedArmour(GetPlayerPed(-1), 100)
      end
    end
  end
end)

RegisterNetEvent("th_armor:vest")
AddEventHandler("th_armor:vest", function()
    local playerPed = GetPlayerPed(-1)
    vestDrawable, vestTexture, vestPalette = GetPedDrawableVariation(playerPed, 9), GetPedTextureVariation(playerPed, 9), GetPedPaletteVariation(playerPed, 9)
    TaskPlayAnim(playerPed, "clothingshirt", "try_shirt_positive_a", 3.5, -8, -1, 49, 0, 0, 0, 0)
  end)