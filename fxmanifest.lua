fx_version 'adamant'
games { 'gta5' };
name 'Renzu Hygiene'
ui_page 'html/ui.html'

files {
    'html/audio/*.ogg',
    'html/ui.html',
}

client_scripts {
    'config.lua',
    'client/client.lua',
    'client/event.lua',
}
server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/server.lua'
}
