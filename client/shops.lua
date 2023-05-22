local QBCore = exports['qb-core']:GetCoreObject()

exports['qb-target']:AddBoxZone("FishShop", vector3(-1830.74, -1180.61, 19.17), 2, 2, {
    name = "FishShop",
    heading = 0,
}, {
    options = {
        {
            type = "client",
            event = "shopsfish",
            icon = "bi bi-basket-fill",
            label = "Balık Marketi",
            job = "all",
        },
    
    },
    distance = 3.5
})




exports['qb-target']:AddBoxZone("FishShell", vector3(-1816.83, -1193.99, 14.3), 2, 2, {
    name = "FishShell",
    heading = 0,
}, {
    options = {
        {
            type = "server",
            event = "sellfish",
            icon = "bi bi-basket-fill",
            label = "Balık Satış",
            job = "all",
        },
    
    },
    distance = 3.5
})




