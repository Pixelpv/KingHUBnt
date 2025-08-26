-- ui.lua
-- carrega Kavo UI original (precisa de internet para puxar do repo do Heptc)
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local UI = {}

function UI:Init()
    -- cria a janela principal
    local Window = Library.CreateLib("KingHub - 99 Nights", "DarkTheme")

    -- abas
    local PrincipalTab = Window:NewTab("Principal")
    local TrazerTab = Window:NewTab("Trazer")
    local AutoTab = Window:NewTab("Auto")
    local VisuaisTab = Window:NewTab("Visuais")
    local ConfigsTab = Window:NewTab("Configs")

    -- só pra testar, adicionamos botões em cada aba
    local pSec = PrincipalTab:NewSection("Testes")
    pSec:NewButton("Clique aqui", "Botão de teste na aba Principal", function()
        print("Você clicou no botão da aba Principal!")
    end)

    local tSec = TrazerTab:NewSection("Testes")
    tSec:NewLabel("Ainda nada aqui...")

    local aSec = AutoTab:NewSection("Testes")
    aSec:NewToggle("Auto Farm", "Liga/Desliga Auto Farm", function(state)
        print("Auto Farm:", state)
    end)

    local vSec = VisuaisTab:NewSection("Testes")
    vSec:NewToggle("Highlight", "Destacar inimigos (futuro)", function(state)
        print("Highlight:", state)
    end)

    local cSec = ConfigsTab:NewSection("Configurações")
    cSec:NewButton("Resetar", "Reseta configs", function()
        print("Configurações resetadas (placeholder)")
    end)
end

return UI
