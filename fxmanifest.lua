fx_version "cerulean"

game "gta5"

client_script {
    "lua/client.lua", 
    "lua/config.lua"
}

server_scripts {
    'lua/server.lua',
    "lua/config.lua"
}

ui_page {
    'html/index.html'
}

files {
    'html/*.html',
    'html/*.js',
    'html/*.css',
    'html/img/*.png'
}