fx_version 'cerulean'
games {'gta5'}

author 'FX-CODER'
description 'FİSHİNG JOBS 1.0'
version '1.0.0'

-- What to run
client_scripts {
    'client/main.lua',
    'client/shops.lua',

}
server_script 'server/main.lua'


shared_scripts {
    'config.lua'
}

