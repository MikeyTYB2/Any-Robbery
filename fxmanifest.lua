fx_version 'adamant'

game 'gta5'

lua54 'yes'

author 'MikeyTYBV2'

name   'Store Robbery Job'

description  ''

version '1.1'

lua54 'yes'

escrow_ignore {
  'config.lua',
  'client.lua',
  'server.lua'
}


shared_scripts {
  '@ox_lib/init.lua',
  '@es_extended/imports.lua',
  'config.lua'
}
client_scripts {
  '@es_extended/locale.lua',
  'client.lua'
} 
server_scripts {
  '@oxmysql/lib/MySQL.lua',
  '@es_extended/locale.lua',
  '@es_extended/imports.lua',
  'server.lua'
} 
