-- ui.lua
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local UI = {}
local Window -- vamos guardar a janela aqui
local mainFrame -- container principal

function UI:Init()
    -- cria a janela principal
    Window = Library.CreateLib("KingHub - 99 Nights", "DarkTheme")

    -- pega o frame principal (Kavo UI cria dentro de CoreGui)
    mainFrame = game:GetService("CoreGui"):WaitForChild("KavoUI")

    -- abas principais
    local PrincipalTab = Window:NewTab("Principal")
    local ConfigsTab = Window:NewTab("Configs")

    -- seção de testes
    local TestSection = PrincipalTab:NewSection("Funções de Teste")
    TestSection:NewButton("Mensagem", "Mostra mensagem no console", function()
        print("KingHub funcionando ✅")
    end)

    -- seção de configurações do hub
    local UiSection = ConfigsTab:NewSection("Interface")

    -- minimizar / restaurar
    UiSection:NewButton("Minimizar", "Esconde o hub temporariamente", function()
        if mainFrame.Enabled then
            mainFrame.Enabled = false
            print("KingHub minimizado")
        end
    end)

    UiSection:NewButton("Restaurar", "Mostra o hub novamente", function()
        mainFrame.Enabled = true
        print("KingHub restaurado")
    end)

    -- tela cheia (expandir o tamanho)
    UiSection:NewButton("Tela Cheia", "Expande interface", function()
        for _,v in pairs(mainFrame:GetDescendants()) do
            if v:IsA("Frame") and v.Name == "MainFrame" then
                v.Size = UDim2.new(1,0,1,0) -- ocupa a tela inteira
                v.Position = UDim2.new(0,0,0,0)
            end
        end
        print("KingHub em tela cheia")
    end)

    -- confirmar antes de fechar
    UiSection:NewButton("Fechar Hub", "Confirma antes de fechar", function()
        local confirm = Instance.new("Message", workspace)
        confirm.Text = "Deseja realmente fechar o KingHub? (y/n)"

        -- escuta entrada do jogador
        local connection
        connection = game:GetService("UserInputService").InputBegan:Connect(function(input)
            if input.KeyCode == Enum.KeyCode.Y then
                mainFrame:Destroy()
                connection:Disconnect()
                confirm:Destroy()
                print("KingHub fechado com sucesso")
            elseif input.KeyCode == Enum.KeyCode.N then
                confirm:Destroy()
                connection:Disconnect()
                print("Ação cancelada")
            end
        end)
    end)
end

return UI
