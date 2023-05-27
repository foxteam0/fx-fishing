local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Functions.CreateUseableItem('fishingrod', function(source, item)
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.GetItemByName(item.name) then return end

    TriggerClientEvent('itemkontrol',source)
end)


RegisterNetEvent('balikitemver',function(itemname)
src=source
local xPlayer = QBCore.Functions.GetPlayer(src)
		
amount = 1
	local random = math.random(1,5) 
	xPlayer.Functions.RemoveItem('fishbait', random)

	TriggerClientEvent("QBCore:Notify",source, "Balıklar Yemi Yedi", "error", 2500)



xPlayer.Functions.AddItem(itemname,1)
TriggerClientEvent('inventory:client:ItemBox',source, QBCore.Shared.Items[itemname], 'add')

end)

local GiveDirty = true

Shellitem = {
    ['codfish'] = 100,

}

RegisterServerEvent('sellfish')
AddEventHandler('sellfish', function(itemName, amount)

	local xPlayer = QBCore.Functions.GetPlayer(source)
	local price = Shellitem['codfish']
	local xItem = QBCore.Functions.HasItem(source,'codfish',Conifg.amount)
	if not price then
		return
	end
if xItem then
	xPlayer.Functions.AddMoney('cash', price, "Bank depost") -- banka
	TriggerClientEvent("QBCore:Notify",source, "Güzel iş biraz daha getir.", "success", 2500)
	xPlayer.Functions.RemoveItem('codfish', amount)

else

	TriggerClientEvent("QBCore:Notify",source, "Yeterince Malzeme Yok", "error", 2500)




end
	
end)
