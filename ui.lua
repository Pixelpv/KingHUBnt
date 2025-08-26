-- ui.lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local UI = {}

function UI:Init()
    local Window = Library.CreateLib("KingHub - 99 Nights", "DarkTheme")

    local PrincipalTab = Window:NewTab("Principal")
    local TestSection = PrincipalTab:NewSection("Testes")

    TestSection:NewButton("Clique aqui", "Botão de teste", function()
        print("Você clicou no botão!")
    end)
end

return UI
