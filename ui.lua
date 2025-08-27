local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/OrionRoblox/Orion/main/source.lua"))()

local UI = {}
local MainWindow

function UI:Init()
    MainWindow = OrionLib:MakeWindow({
        Name = "KingHub - 99 Nights",
        HidePremium = false,
        IntroText = "Bem-vindo ao KingHub!",
        SaveConfig = false,
        ConfigFolder = "KingHubConfigs"
    })

    local PrincipalTab = MainWindow:MakeTab({
        Name = "Principal",
        Icon = "rbxassetid://6031075938",
        PremiumOnly = false
    })

    -- Botão de teste
    PrincipalTab:AddButton({
        Name = "Mensagem de Teste",
        Callback = function()
            print("KingHub com Orion UI funcionando ✅")
        end
    })

    -- Aba Configs com controle da janela
    local ConfigTab = MainWindow:MakeTab({
        Name = "Configs",
        Icon = "rbxassetid://6023426926",
        PremiumOnly = false
    })

    -- Minimizar / Restaurar / Fullscreen / Fechar
    ConfigTab:AddButton({
        Name = "Minimizar",
        Callback = function() MainWindow:Hide() end
    })
    ConfigTab:AddButton({
        Name = "Restaurar",
        Callback = function() MainWindow:Show() end
    })
    ConfigTab:AddButton({
        Name = "Tela Cheia",
        Callback = function()
            MainWindow.MainFrame.Size = UDim2.new(1,0,1,0)
            MainWindow.MainFrame.Position = UDim2.new(0,0,0,0)
        end
    })
    ConfigTab:AddButton({
        Name = "Fechar Hub",
        Callback = function() MainWindow:Destroy() end
    })
end

return UI
