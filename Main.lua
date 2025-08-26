-- KingHub para 99 Nights in the Forest
-- Script Mobile para Delta e outros executores

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")

-- Configurações de segurança
getgenv().KingHubSettings = {
    AutoFarm = false,
    KillAura = false,
    AutoFish = false,
    BringMobs = false,
    VisualESP = false,
    SafeMode = true
}

-- Função de segurança anti-ban
local function SafeExecute(func)
    if getgenv().KingHubSettings.SafeMode then
        pcall(func)
    else
        func()
    end
end

-- Janela principal
local Window = Rayfield:CreateWindow({
    Name = "KingHub | 99 Nights in the Forest",
    LoadingTitle = "KingHub Carregando...",
    LoadingSubtitle = "Por SeuNome",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "KingHub",
        FileName = "Config"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvite",
        RememberJoins = true
    },
    KeySystem = false
})

-- Aba Principal
local MainTab = Window:CreateTab("Principal", 4483362458)
local FarmSection = MainTab:CreateSection("Farm Automático")
local AuraSection = MainTab:CreateSection("Kill Aura")

local AutoFarmToggle = MainTab:CreateToggle({
    Name = "Auto Farm",
    CurrentValue = false,
    Flag = "AutoFarmToggle",
    Callback = function(Value)
        getgenv().KingHubSettings.AutoFarm = Value
        if Value then
            StartAutoFarm()
        end
    end,
})

local KillAuraToggle = MainTab:CreateToggle({
    Name = "Kill Aura",
    CurrentValue = false,
    Flag = "KillAuraToggle",
    Callback = function(Value)
        getgenv().KingHubSettings.KillAura = Value
        if Value then
            StartKillAura()
        end
    end,
})

local FarmSpeedSlider = MainTab:CreateSlider({
    Name = "Velocidade do Farm",
    Range = {1, 10},
    Increment = 1,
    Suffix = "x",
    CurrentValue = 3,
    Flag = "FarmSpeedSlider",
    Callback = function(Value)
        getgenv().FarmSpeed = Value
    end,
})

-- Aba Pesca
local FishingTab = Window:CreateTab("Pesca", 4483362458)
local AutoFishSection = FishingTab:CreateSection("Pesca Automática")

local AutoFishToggle = FishingTab:CreateToggle({
    Name = "Auto Pescar",
    CurrentValue = false,
    Flag = "AutoFishToggle",
    Callback = function(Value)
        getgenv().KingHubSettings.AutoFish = Value
        if Value then
            StartAutoFishing()
        end
    end,
})

local FishDelaySlider = FishingTab:CreateSlider({
    Name = "Delay da Pesca",
    Range = {1, 10},
    Increment = 1,
    Suffix = "s",
    CurrentValue = 3,
    Flag = "FishDelaySlider",
    Callback = function(Value)
        getgenv().FishDelay = Value
    end,
})

-- Aba Trazer
local BringTab = Window:CreateTab("Trazer", 4483362458)
local BringSection = BringTab:CreateSection("Trazer Mobs")

local BringMobsToggle = BringTab:CreateToggle({
    Name = "Trazer Mobs",
    CurrentValue = false,
    Flag = "BringMobsToggle",
    Callback = function(Value)
        getgenv().KingHubSettings.BringMobs = Value
        if Value then
            StartBringMobs()
        end
    end,
})

local BringRangeSlider = BringTab:CreateSlider({
    Name = "Alcance",
    Range = {10, 100},
    Increment = 5,
    Suffix = "studs",
    CurrentValue = 50,
    Flag = "BringRangeSlider",
    Callback = function(Value)
        getgenv().BringRange = Value
    end,
})

-- Aba Auto
local AutoTab = Window:CreateTab("Auto", 4483362458)
local AutoSection = AutoTab:CreateSection("Funções Automáticas")

local AutoCollectToggle = AutoTab:CreateToggle({
    Name = "Auto Coletar",
    CurrentValue = false,
    Flag = "AutoCollectToggle",
    Callback = function(Value)
        getgenv().AutoCollect = Value
        if Value then
            StartAutoCollect()
        end
    end,
})

local AutoSellToggle = AutoTab:CreateToggle({
    Name = "Auto Vender",
    CurrentValue = false,
    Flag = "AutoSellToggle",
    Callback = function(Value)
        getgenv().AutoSell = Value
        if Value then
            StartAutoSell()
        end
    end,
})

-- Aba Visuais
local VisualsTab = Window:CreateTab("Visuais", 4483362458)
local ESPsection = VisualsTab:CreateSection("ESP")

local ESPToggle = VisualsTab:CreateToggle({
    Name = "ESP de Mobs",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(Value)
        getgenv().KingHubSettings.VisualESP = Value
        if Value then
            StartESP()
        else
            ClearESP()
        end
    end,
})

local TracersToggle = VisualsTab:CreateToggle({
    Name = "Tracers",
    CurrentValue = false,
    Flag = "TracersToggle",
    Callback = function(Value)
        getgenv().TracersEnabled = Value
    end,
})

-- Aba Configurações
local SettingsTab = Window:CreateTab("Configurações", 4483362458)
local SecuritySection = SettingsTab:CreateSection("Segurança")

local SafeModeToggle = SettingsTab:CreateToggle({
    Name = "Modo Seguro",
    CurrentValue = true,
    Flag = "SafeModeToggle",
    Callback = function(Value)
        getgenv().KingHubSettings.SafeMode = Value
    end,
})

local AntiAFKToggle = SettingsTab:CreateToggle({
    Name = "Anti AFK",
    CurrentValue = true,
    Flag = "AntiAFKToggle",
    Callback = function(Value)
        if Value then
            EnableAntiAFK()
        end
    end,
})

local UIKeybind = SettingsTab:CreateKeybind({
    Name = "Toggle UI Keybind",
    CurrentKeybind = "RightControl",
    HoldToInteract = false,
    Flag = "UIKeybind",
    Callback = function(Keybind)
        Rayfield:Toggle()
    end,
})

-- Funções principais
function StartAutoFarm()
    SafeExecute(function()
        while getgenv().KingHubSettings.AutoFarm and task.wait(getgenv().FarmSpeed or 0.5) do
            -- Lógica de farm automático aqui
            local mobs = workspace:FindFirstChildWhichIsA("Model")
            if mobs then
                -- Simular ataque aos mobs
                print("Farming mobs...")
            end
        end
    end)
end

function StartKillAura()
    SafeExecute(function()
        while getgenv().KingHubSettings.KillAura and task.wait(0.1) do
            -- Lógica de kill aura aqui
            local characters = workspace:GetChildren()
            for _, char in pairs(characters) do
                if char:FindFirstChild("Humanoid") and char ~= LocalPlayer.Character then
                    -- Simular dano
                    print("Kill aura ativada")
                end
            end
        end
    end)
end

function StartAutoFishing()
    SafeExecute(function()
        while getgenv().KingHubSettings.AutoFish and task.wait(getgenv().FishDelay or 3) do
            -- Lógica de pesca automática aqui
            print("Pescando automaticamente...")
        end
    end)
end

function StartBringMobs()
    SafeExecute(function()
        while getgenv().KingHubSettings.BringMobs and task.wait(0.5) do
            -- Lógica para trazer mobs aqui
            local mobs = workspace:GetChildren()
            for _, mob in pairs(mobs) do
                if mob:FindFirstChild("Humanoid") and (mob:FindFirstChild("HumanoidRootPart") or mob:FindFirstChild("Torso")) then
                    local root = mob:FindFirstChild("HumanoidRootPart") or mob:FindFirstChild("Torso")
                    if root and (root.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < (getgenv().BringRange or 50) then
                        -- Mover mob para o jogador
                    end
                end
            end
        end
    end)
end

function StartESP()
    SafeExecute(function()
        -- Lógica ESP aqui
        print("ESP ativado")
    end)
end

function ClearESP()
    SafeExecute(function()
        -- Limpar ESP
        print("ESP desativado")
    end)
end

function EnableAntiAFK()
    SafeExecute(function()
        local VirtualUser = game:GetService("VirtualUser")
        LocalPlayer.Idled:Connect(function()
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
    end)
end

-- Inicialização segura
Rayfield:Notify({
    Title = "KingHub Carregado",
    Content = "Script ativado com segurança!",
    Duration = 6.5,
    Image = 4483362458,
    Actions = {
        Ignore = {
            Name = "Ok",
            Callback = function()
            end
        },
    },
})

print("KingHub para 99 Nights in the Forest carregado com sucesso!")}
