-- main.lua
local function import(file)
    local url = "https://raw.githubusercontent.com/Pixelpv/KingHUBnt/main/" .. file
    return loadstring(game:HttpGet(url))()
end

-- importa a interface Orion
local UI = import("ui.lua")

-- inicializa a interface
UI:Init()
