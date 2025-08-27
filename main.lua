-- main.lua
local function import(file)
    local url = "https://raw.githubusercontent.com/Pixelpv/KingHUBnt/main/" .. file
    return loadstring(game:HttpGet(url))()
end

-- Delay para garantir que o jogo carregou
task.spawn(function()
    task.wait(1) -- espera 1 segundo para CoreGui carregar

    local UI = import("ui.lua")
    UI:Init()
end)
