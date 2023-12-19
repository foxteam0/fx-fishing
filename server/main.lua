local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('fishingrod', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player.Functions.GetItemByName(item.name) then return end

    TriggerClientEvent('itemkontrol', source)
end)

RegisterNetEvent('balikitemver')
AddEventHandler('balikitemver', function(itemname)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)

    local random = math.random(1, 5)
    xPlayer.Functions.RemoveItem('fishbait', random)

    TriggerClientEvent("QBCore:Notify", source, "Balıklar Yemi Yedi", "success", 2500)

    xPlayer.Functions.AddItem(itemname, 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[itemname], 'add')
end)

local Shellitem = {
    ['codfish'] = 100,
    -- Diğer balık türlerini ekleyebilirsiniz.
}

RegisterServerEvent('sellfish')
AddEventHandler('sellfish', function(itemName, amount)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local price = Shellitem[itemName]

    if not price then
        return
    end

    local xItem = xPlayer.Functions.GetItemByName(itemName)

    if xItem and xItem.amount >= amount then
        local totalAmount = price * amount
        xPlayer.Functions.AddMoney('cash', totalAmount, "Fish Sale")
        xPlayer.Functions.RemoveItem(itemName, amount)

        TriggerClientEvent("QBCore:Notify", source, "Satış başarılı, $" .. totalAmount .. " kazandın.", "success", 2500)
    else
        TriggerClientEvent("QBCore:Notify", source, "Yeterince malzeme yok", "error", 2500)
    end
end)
