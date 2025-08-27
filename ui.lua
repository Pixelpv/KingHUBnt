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

    PrincipalTab:AddButton({
        Name = "Mensagem de Teste",
        Callback = function()
            print("KingHub com Orion UI funcionando ✅")
        end
    })
end

return UI
