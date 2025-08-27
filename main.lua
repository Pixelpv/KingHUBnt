-- main.lua
local function import(file)
    local url = "https://raw.githubusercontent.com/Pixelpv/KingHUBnt/main/" .. file
    return loadstring(game:HttpGet(url))()
end

-- Garante que o CoreGui está pronto antes de criar UI
task.spawn(function()
    local player = game.Players.LocalPlayer
    while not player or not player.PlayerGui do
        task.wait(0.1)
    end
    -- Delay extra pra mobile
    task.wait(1)
    
    local UI = import("ui.lua")
    UI:Init()
end)
