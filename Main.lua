-- KingHUBnt Main.lua
-- Autor: Pixelpv
-- Para: 99 Noites na Floresta

-- Serviços
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Função para carregar módulos
local function LoadModule(url)
    local success, module = pcall(function()
        return loadstring(game:HttpGet(url))()
    end)
    if success then
        return module
    else
        warn("Erro ao carregar módulo: " .. url)
        return nil
    end
end

-- URLs dos módulos
local Modules = {
    AutoFarm = LoadModule("https://raw.githubusercontent.com/Pixelpv/KingHUBnt/main/Modules/AutoFarm.lua"),
    KillAura = LoadModule("https://raw.githubusercontent.com/Pixelpv/KingHUBnt/main/Modules/KillAura.lua"),
    AutoFish = LoadModule("https://raw.githubusercontent.com/Pixelpv/KingHUBnt/main/Modules/AutoFish.lua"),
    BringItems = LoadModule("https://raw.githubusercontent.com/Pixelpv/KingHUBnt/main/Modules/BringItems.lua"),
    ESP = LoadModule("https://raw.githubusercontent.com/Pixelpv/KingHUBnt/main/Modules/ESP.lua"),
    GUI = LoadModule("https://raw.githubusercontent.com/Pixelpv/KingHUBnt/main/GUI.lua")
}

-- Configurações iniciais
local Config = {
    AutoFarm = false,
    KillAura = false,
    AutoFish = false,
    BringItems = false,
    ESP = false
}

-- Função para alternar funcionalidades
local function ToggleFeature(feature, state)
    if Config[feature] ~= nil then
        Config[feature] = state
        print("[KingHUBnt] " .. feature .. " definido para " .. tostring(state))
    else
        warn("[KingHUBnt] Função desconhecida: " .. feature)
    end
end

-- Loop principal
RunService.RenderStepped:Connect(function()
    if Config.AutoFarm and Modules.AutoFarm then
        Modules.AutoFarm()
    end
    if Config.KillAura and Modules.KillAura then
        Modules.KillAura()
    end
    if Config.AutoFish and Modules.AutoFish then
        Modules.AutoFish()
    end
    if Config.BringItems and Modules.BringItems then
        Modules.BringItems()
    end
    if Config.ESP and Modules.ESP then
        Modules.ESP()
    end
end)

-- Retornar a API do hub
return {
    ToggleFeature = ToggleFeature
}
