-- ui.lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local UI = {}
local Window
local mainGui

function UI:Init()
    -- cria a janela principal
    Window = Library.CreateLib("KingHub - 99 Nights", "DarkTheme")

    -- aba Principal
    local PrincipalTab = Window:NewTab("Principal")
    local TestSec = PrincipalTab:NewSection("Teste")
    TestSec:NewButton("Mensagem", "Mostra no console", function()
        print("KingHub funcionando ✅")
    end)

    -- aba Configs
    local ConfigsTab = Window:NewTab("Configs")
    local UiSec = ConfigsTab:NewSection("Interface")

    -- pegar a interface principal do Kavo
    task.wait(0.5)
    mainGui = game:GetService("CoreGui"):FindFirstChild("KavoUI")

    -- Minimizar
    UiSec:NewButton("Minimizar", "Esconde o Hub", function()
        if mainGui then
            mainGui.Enabled = false
            print("KingHub minimizado")
        end
    end)

    -- Restaurar
    UiSec:NewButton("Restaurar", "Mostra o Hub", function()
        if mainGui then
            mainGui.Enabled = true
            print("KingHub restaurado")
        end
    end)

    -- Tela cheia
    UiSec:NewButton("Tela Cheia", "Expande a interface", function()
        if mainGui then
            local mf = mainGui:FindFirstChildWhichIsA("Frame", true)
            if mf then
                mf.Size = UDim2.new(1,0,1,0)
                mf.Position = UDim2.new(0,0,0,0)
                print("KingHub em tela cheia")
            end
        end
    end)

    -- Fechar com confirmação
    UiSec:NewButton("Fechar Hub", "Confirma antes de fechar", function()
        if mainGui then
            local msg = Instance.new("Message", workspace)
            msg.Text = "Deseja realmente fechar o KingHub? Digite Y ou N"
            local uis = game:GetService("UserInputService")
            local conn
            conn = uis.InputBegan:Connect(function(input, gpe)
                if gpe then return end
                if input.KeyCode == Enum.KeyCode.Y then
                    mainGui:Destroy()
                    msg:Destroy()
                    conn:Disconnect()
                    print("KingHub fechado")
                elseif input.KeyCode == Enum.KeyCode.N then
                    msg:Destroy()
                    conn:Disconnect()
                    print("Ação cancelada")
                end
            end)
        end
    end)
end

return UI
