local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Pixelpv/KingHUBnt/main/source.lua"))()

local UI = {}
local MainWindow

function UI:Init(PlayerGui)
    -- cria a janela Orion dentro do PlayerGui
    MainWindow = OrionLib:MakeWindow({
        Name = "KingHub - 99 Nights",
        HidePremium = false,
        IntroText = "Bem-vindo ao KingHub!",
        SaveConfig = true,
        ConfigFolder = "KingHubConfigs",
        Parent = PlayerGui
    })

    -- Aba Principal
    local PrincipalTab = MainWindow:MakeTab({Name = "Principal", Icon = "rbxassetid://6031075938", PremiumOnly = false})
    PrincipalTab:AddButton({Name = "Teste", Callback = function() print("KingHub funcionando ✅") end})

    -- Aba Trazer
    local TrazerTab = MainWindow:MakeTab({Name = "Trazer", Icon = "rbxassetid://6031075938", PremiumOnly = false})
    TrazerTab:AddButton({Name = "Função de teste", Callback = function() print("Trazer ativado") end})

    -- Outras abas você pode adicionar aqui: Auto, Visuais, Configs
end

return UI
