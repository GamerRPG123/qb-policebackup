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

    function ShowInfo(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
    end

function playCode99Sound()
    PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", 1)
    Wait(900)
    PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", 1)
    Wait(900)
    PlaySoundFrontend(-1, "TIMER_STOP", "HUD_MINI_GAME_SOUNDSET", 1)
end

RegisterNetEvent('Fax:ShowInfo')
AddEventHandler('Fax:ShowInfo', function(notetext)
	ShowInfo(notetext)
end)

RegisterCommand("cp", function(QBCore, jobName)
    local src = s
    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(src)))
    local street1 = GetStreetNameAtCoord(coords.x, coords.y, coords.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
    local streetName = (GetStreetNameFromHashKey(street1))
    local count = 0
    local QBCore = exports["qb-core"]:GetCoreObject()
    local PlayerData = QBCore.Functions.GetPlayerData() 

    if true then
        jobName = PlayerData.job.name
        if jobName == "police" then
           exports['mythic_notify']:DoHudText('inform', 'Now you can send codes!', { ['background-color'] = '#ffffff', ['color'] = '#000000' })
       end
    end

while true do
Citizen.Wait(0)

  if IsControlPressed(0, 36) and IsControlPressed(1, 174) and jobName == "police" then
    if count == 0 then 
      local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(src)))
      exports['mythic_notify']:DoHudText('inform', 'CODE 1 A police officer is asking for help', { ['background-color'] = '#001B7F', ['color'] = '#ffffff' })
      local Blip1 = AddBlipForCoord(coords.x, coords.y)
      SetBlipSprite(Blip1, 304)
      SetBlipColour(Blip1, 38)
      SetBlipScale(Blip1, 0.5)
      SetBlipAsShortRange(Blip1, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString('CODIGO 1')
      EndTextCommandSetBlipName(Blip1)
      Citizen.CreateThread(function()
        Citizen.Wait(40000)
        RemoveBlip(Blip1)
      end)
      count = 1
      Citizen.CreateThread(function()
       Citizen.Wait(1000)
       count = 0
      end)
    end
  end



  if IsControlPressed(0, 36) and IsControlPressed(1,  173) and jobName == "police" then
    if count == 0 then 
      local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(src)))
      exports['mythic_notify']:DoHudText('inform', 'CODE 2 A police officer is asking for help', { ['background-color'] = '#001B7F', ['color'] = '#ffffff' })
      local Blip2 = AddBlipForCoord(coords.x, coords.y)
      SetBlipSprite(Blip2, 304)
      SetBlipColour(Blip2, 38)
      SetBlipScale(Blip2, 0.5)
      SetBlipAsShortRange(Blip2, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString('CODIGO 2')
      EndTextCommandSetBlipName(Blip2)
      Citizen.CreateThread(function()
        Citizen.Wait(40000)
          RemoveBlip(Blip2)
      end)
      count = 1
      Citizen.CreateThread(function()
       Citizen.Wait(1000)
       count = 0
      end)
    end
  end

  if IsControlPressed(1, 36) and IsControlPressed(1,  175) and jobName == "police" then
    if count == 0 then 
      local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(src)))
      exports['mythic_notify']:DoHudText('inform', 'CODE 3 A police officer is asking for help', { ['background-color'] = '#BFBA23', ['color'] = '#ffffff' })
      SetNewWaypoint(coords.x, coords.y)
      PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 1)
      local Blip3 = AddBlipForCoord(coords.x, coords.y)
      SetBlipSprite(Blip3, 304)
      SetBlipColour(Blip3, 46)
      SetBlipScale(Blip3, 0.5)
      SetBlipAsShortRange(Blip3, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString('CODIGO 3')
      EndTextCommandSetBlipName(Blip3)
      Citizen.CreateThread(function()
        Citizen.Wait(50000)
        RemoveBlip(Blip3)
      end)
      count = 1
      Citizen.CreateThread(function()
        Citizen.Wait(1000)
        count = 0
      end)
    end
  end

  if IsControlPressed(1, 36) and IsControlPressed(1,  27) and jobName == "police" then
    if count == 0 then 
      local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(src)))
      exports['mythic_notify']:DoHudText('inform', 'CODE 99 A police officer is asking for help', { ['background-color'] = '#FF0000', ['color'] = '#ffffff' })
      SetNewWaypoint(coords.x, coords.y)
      playCode99Sound()
      local Blip99 = AddBlipForCoord(coords.x, coords.y)
      SetBlipSprite(Blip99, 304)
      SetBlipColour(Blip99, 1)
      SetBlipScale(Blip99, 0.5)
      SetBlipAsShortRange(Blip99, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString('CODIGO 99')
      EndTextCommandSetBlipName(Blip99)
      Citizen.CreateThread(function()
        Citizen.Wait(60000)
        RemoveBlip(Blip99)
      end)
      count = 1
      Citizen.CreateThread(function()
        Citizen.Wait(1000)
        count = 0
      end)
    end
  end

end
end)

