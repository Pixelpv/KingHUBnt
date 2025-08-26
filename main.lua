-- main.lua
local function import(file)
    local url = "https://raw.githubusercontent.com/Pixelpv/KingHUBnt/main/" .. file
    return loadstring(game:HttpGet(url))()
end

-- Importa módulos
local UI = import("ui.lua")
local Principal = import("principal.lua")
local Trazer = import("trazer.lua")
local Auto = import("auto.lua")
local Visuais = import("visuais.lua")
local Configs = import("configs.lua")
local Security = import("security.lua")
local Utils = import("utils.lua")

-- Inicia o hub
Security:init()
UI:Init(Configs:getSettings(), {
    Principal = Principal,
    Trazer = Trazer,
    Auto = Auto,
    Visuais = Visuais,
    Configs = Configs
})
