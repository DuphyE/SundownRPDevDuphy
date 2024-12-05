fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'
description 'Chat for the server sundown'
version "1.0.1"
ui_page 'web/ui.html'
files {
    'web/*.*',
}
shared_script 'config.lua'

client_scripts {
    'client/client.lua',
}

server_scripts {
    'server/server.lua',
}
