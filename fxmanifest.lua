fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'vanishdev'
description 'Simple ESX Check-in system to revive players'

client_script 'client.lua'
server_script 'server.lua'
shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'config.lua'
}
