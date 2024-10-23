fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'vanishdev'
description 'Check-in system to revive players'
version '1.0.1'

client_scripts { 'client/*.lua' }
server_scripts { 'server/*.lua' }
shared_scripts { '@ox_lib/init.lua', '@es_extended/imports.lua', 'shared/*.lua' }
files { 'locales/*.json' }

dependencies { 
    'ox_lib',
    'es_extended' 
}