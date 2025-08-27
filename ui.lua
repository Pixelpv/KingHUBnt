-- ui.lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local UI = {}
local Window
local MainFrame

function UI:Init()
    -- Cria a janela principal
    Window = Library.CreateLib("KingHub - 99 Nights", "DarkTheme")

    -- Aba Principal
    local PrincipalTab = Window:NewTab("Principal")
    local TestSec = PrincipalTab:NewSection("Teste")
    TestSec:NewButton("Mensagem", "Mostra no console", function()
        print("KingHub funcionando ✅")
    end)

    -- Aba Configs
    local ConfigsTab = Window:NewTab("Configs")
    local UiSec = ConfigsTab:NewSection("Interface")

    -- Obtém o frame principal da interface
    task.wait(0.5)
    MainFrame = game:GetService("CoreGui"):FindFirstChild("KavoUI")

    -- Minimizar
    UiSec:NewButton("Minimizar", "Esconde o Hub", function()
        if MainFrame then
            MainFrame.Enabled = false
            print("KingHub minimizado")
        end
    end)

    -- Restaurar
    UiSec:NewButton("Restaurar", "Mostra o Hub", function()
        if MainFrame then
            MainFrame.Enabled = true
            print("KingHub restaurado")
        end
    end)

    -- Tela cheia
    UiSec:NewButton("Tela Cheia", "Expande a interface", function()
        if MainFrame then
            local mf = MainFrame:FindFirstChildWhichIsA("Frame", true)
            if mf then
                mf.Size = UDim2.new(1,0,1,0)
                mf.Position = UDim2.new(0,0,0,0)
                print("KingHub em tela cheia")
            end
        end
    end)

    -- Fechar com confirmação
    UiSec:NewButton("Fechar Hub", "Confirma antes de fechar", function()
        if MainFrame then
            local msg = Instance.new("Message", workspace)
            msg.Text = "Deseja realmente fechar o KingHub? Digite Y ou N"
            local uis = game:GetService("UserInputService")
            local conn
            conn = uis.InputBegan:Connect(function(input, gpe)
                if gpe then return end
                if input.KeyCode == Enum.KeyCode.Y then
                    MainFrame:Destroy()
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
