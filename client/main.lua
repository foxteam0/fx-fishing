local QBCore = exports['qb-core']:GetCoreObject()
local tutmadurum = false

function AttachEntityToPed(prop,bone_ID,x,y,z,RotX,RotY,RotZ)
	BoneID = GetPedBoneIndex(PlayerPedId(), bone_ID)
	obj = CreateObject(GetHashKey(prop),  1729.73,  6403.90,  34.56,  true,  true,  true)
	vX,vY,vZ = table.unpack(GetEntityCoords(PlayerPedId()))
	xRot, yRot, zRot = table.unpack(GetEntityRotation(PlayerPedId(),2))
	AttachEntityToEntity(obj,  PlayerPedId(),  BoneID, x,y,z, RotX,RotY,RotZ,  false, false, false, false, 2, true)
	return obj
end

function fishgame()

    while not HasAnimDictLoaded('amb@world_human_stand_fishing@idle_a') do 
    Citizen.Wait(1) 
    RequestAnimDict('amb@world_human_stand_fishing@idle_a') 
 
    end
    rod = AttachEntityToPed('prop_fishing_rod_01',60309, 0,0,0, 0,0,0)
    TaskPlayAnim(PlayerPedId(), 'amb@world_human_stand_fishing@idle_a', 'idle_b', 8.0, 8.0, -1, 1, 1, 0, 0, 0)
    exports['ps-ui']:Circle(function(success)
        if success then
          local random = math.random(1,100) 
          if (random < 50 ) then
        TriggerServerEvent('balikitemver','codfish')
        DeleteEntity(rod)
        DeleteObject(rod)
        ClearPedTasks(GetPlayerPed(PlayerId()))
        StopAnimTask(GetPlayerPed(PlayerId()), 'amb@world_human_stand_fishing@idle_a', 'idle_b', 1.0)
        tutmadurum = false
        elseif(random >= 50 and random <= 55 ) then
            TriggerServerEvent('balikitemver','phone')
            DeleteEntity(rod)
            DeleteObject(rod)
            ClearPedTasks(GetPlayerPed(PlayerId()))
            StopAnimTask(GetPlayerPed(PlayerId()), 'amb@world_human_stand_fishing@idle_a', 'idle_b', 1.0)
            tutmadurum = false
        elseif(random> 55 ) then
            TriggerServerEvent('balikitemver','codfish')
            DeleteEntity(rod)
            DeleteObject(rod)
            ClearPedTasks(GetPlayerPed(PlayerId()))
            StopAnimTask(GetPlayerPed(PlayerId()), 'amb@world_human_stand_fishing@idle_a', 'idle_b', 1.0)
            tutmadurum = false
        end

    else
        QBCore.Functions.Notify("Balık Kaçtı", "error")
        DeleteEntity(rod)
        DeleteObject(rod)
        ClearPedTasks(GetPlayerPed(PlayerId()))
        StopAnimTask(GetPlayerPed(PlayerId()), 'amb@world_human_stand_fishing@idle_a', 'idle_b', 1.0)
        tutmadurum = false

    end
   
    end, 2, 20) -- NumberOfCircles, MS

end


RegisterNetEvent('itemkontrol',function()

    local playerPed = PlayerPedId()
	local pos = GetEntityCoords(playerPed) 
    if IsPedSwimming(playerPed) then return QBCore.Functions.Notify("Yüzerken balık tutamazsın", "error") end 
	if IsPedInAnyVehicle(playerPed) then return QBCore.Functions.Notify("Araçtan balık tutamazsın.", "error") end 
  --  if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, -1844.72, -1227.81, 13.02, false) < 50 then
		if GetWaterHeight(pos.x, pos.y, pos.z-2, pos.z)  then
			
            local hasItem = QBCore.Functions.HasItem('fishbait')

            if hasItem then
               
     

                if not tutmadurum then
                    fishgame()
                   
             --       tutmadurum = true

                else
                    QBCore.Functions.Notify("Balık Tutuyorum Zaten", "error")

            end

        else
            QBCore.Functions.Notify("Üstünde Yem Yok Yem Alman Gerek", "error")
        
        end
        
		else
			QBCore.Functions.Notify('Suya yakın biryerde tutmalısın.', 'error')
		end

end)



RegisterNetEvent('shopsfish',function()
    local ShopItems = {}
    ShopItems.label = "Balık Marketi"
    ShopItems.items = Config.balikmarketi
    ShopItems.slots = #Config.balikmarketi
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "balikmarketi_"..math.random(1, 99), ShopItems)
    
end)

Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_autoshop_01")) -- ped kodu
    while not HasModelLoaded(GetHashKey("s_m_m_autoshop_01")) do -- ped kodu
        Wait(1)
    end
    npc = CreatePed(1, GetHashKey("s_m_m_autoshop_01"), -1830.78, -1181.18, 18.18, 329.19, false, true) -- ped kodu ve kordinatı
    SetPedCombatAttributes(npc, 46, true)              
    SetPedFleeAttributes(npc, 0, 0)              
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
end)


Citizen.CreateThread(function()
    RequestModel(GetHashKey("s_m_m_autoshop_01")) -- ped kodu
    while not HasModelLoaded(GetHashKey("s_m_m_autoshop_01")) do -- ped kodu
        Wait(1)
    end
    npc = CreatePed(1, GetHashKey("s_m_m_autoshop_01"), -1816.83, -1193.99, 13.3, 329.19, false, true) -- ped kodu ve kordinatı
    SetPedCombatAttributes(npc, 46, true)              
    SetPedFleeAttributes(npc, 0, 0)              
    SetBlockingOfNonTemporaryEvents(npc, true)
    SetEntityAsMissionEntity(npc, true, true)
    SetEntityInvincible(npc, true)
    FreezeEntityPosition(npc, true)
end)
