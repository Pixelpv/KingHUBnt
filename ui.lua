-- ui.lua
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/OrionRoblox/Orion/main/source.lua"))()

local UI = {}
local MainWindow

function UI:Init()
    -- cria a janela principal
    MainWindow = OrionLib:MakeWindow({
        Name = "KingHub - 99 Nights",
        HidePremium = false,
        IntroText = "Bem-vindo ao KingHub!",
        SaveConfig = true,
        ConfigFolder = "KingHubConfigs"
    })

    -- aba Principal
    local PrincipalTab = MainWindow:MakeTab({
        Name = "Principal",
        Icon = "rbxassetid://6031075938",
        PremiumOnly = false
    })

    PrincipalTab:AddButton({
        Name = "Mensagem de Teste",
        Callback = function()
            print("KingHub funcionando com Orion UI ✅")
        end
    })

    -- aba Configs
    local ConfigTab = MainWindow:MakeTab({
        Name = "Configs",
        Icon = "rbxassetid://6023426926",
        PremiumOnly = false
    })

    -- Minimizar / Restaurar / Tela cheia
    ConfigTab:AddButton({
        Name = "Minimizar",
        Callback = function()
            MainWindow:Hide()
            print("KingHub minimizado")
        end
    })

    ConfigTab:AddButton({
        Name = "Restaurar",
        Callback = function()
            MainWindow:Show()
            print("KingHub restaurado")
        end
    })

    ConfigTab:AddButton({
        Name = "Tela Cheia",
        Callback = function()
            MainWindow.MainFrame.Size = UDim2.new(1,0,1,0)
            MainWindow.MainFrame.Position = UDim2.new(0,0,0,0)
            print("KingHub em tela cheia")
        end
    })

    ConfigTab:AddButton({
        Name = "Fechar Hub",
        Callback = function()
            MainWindow:Destroy()
            print("KingHub fechado")
        end
    })
end

return UI
