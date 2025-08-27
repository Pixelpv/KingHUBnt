local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local UI = {}
local Window
local mainGui
local isMinimized = false
local isFullscreen = false
local originalSize = UDim2.new(0.5, 0, 0.6, 0)
local originalPosition = UDim2.new(0.25, 0, 0.2, 0)
local menuVisible = true

-- Serviços
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

-- Configurações de animação
local animInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)

function UI:CreateNotification(title, text, duration)
    local notification = Instance.new("ScreenGui")
    notification.Name = "KingHubNotification"
    notification.Parent = CoreGui
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 80)
    frame.Position = UDim2.new(1, 10, 0, 50)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BorderSizePixel = 0
    frame.Parent = notification
    
    -- Corner radius
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame
    
    -- Stroke
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 162, 255)
    stroke.Thickness = 2
    stroke.Parent = frame
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -20, 0, 25)
    titleLabel.Position = UDim2.new(0, 10, 0, 5)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = frame
    
    -- Description
    local descLabel = Instance.new("TextLabel")
    descLabel.Size = UDim2.new(1, -20, 0, 40)
    descLabel.Position = UDim2.new(0, 10, 0, 30)
    descLabel.BackgroundTransparency = 1
    descLabel.Text = text
    descLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    descLabel.TextScaled = true
    descLabel.Font = Enum.Font.Gotham
    descLabel.TextXAlignment = Enum.TextXAlignment.Left
    descLabel.TextWrapped = true
    descLabel.Parent = frame
    
    -- Animação de entrada
    local slideIn = TweenService:Create(frame, animInfo, {Position = UDim2.new(1, -310, 0, 50)})
    slideIn:Play()
    
    -- Auto-remover
    task.spawn(function()
        wait(duration or 3)
        local slideOut = TweenService:Create(frame, animInfo, {Position = UDim2.new(1, 10, 0, 50)})
        slideOut:Play()
        slideOut.Completed:Wait()
        notification:Destroy()
    end)
end

function UI:CreateConfirmDialog(title, message, onConfirm, onCancel)
    local dialog = Instance.new("ScreenGui")
    dialog.Name = "KingHubDialog"
    dialog.Parent = CoreGui
    
    -- Background blur
    local bg = Instance.new("Frame")
    bg.Size = UDim2.new(1, 0, 1, 0)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.BackgroundTransparency = 0.3
    bg.BorderSizePixel = 0
    bg.Parent = dialog
    
    -- Dialog frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 400, 0, 200)
    frame.Position = UDim2.new(0.5, -200, 0.5, -100)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = bg
    
    -- Corner
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = frame
    
    -- Stroke
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 162, 255)
    stroke.Thickness = 2
    stroke.Parent = frame
    
    -- Title
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -40, 0, 40)
    titleLabel.Position = UDim2.new(0, 20, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextScaled = true
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.Parent = frame
    
    -- Message
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Size = UDim2.new(1, -40, 0, 80)
    msgLabel.Position = UDim2.new(0, 20, 0, 50)
    msgLabel.BackgroundTransparency = 1
    msgLabel.Text = message
    msgLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
    msgLabel.TextScaled = true
    msgLabel.Font = Enum.Font.Gotham
    msgLabel.TextWrapped = true
    msgLabel.Parent = frame
    
    -- Confirm button
    local confirmBtn = Instance.new("TextButton")
    confirmBtn.Size = UDim2.new(0, 120, 0, 35)
    confirmBtn.Position = UDim2.new(1, -250, 1, -50)
    confirmBtn.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    confirmBtn.BorderSizePixel = 0
    confirmBtn.Text = "Confirmar"
    confirmBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    confirmBtn.Font = Enum.Font.GothamBold
    confirmBtn.TextScaled = true
    confirmBtn.Parent = frame
    
    local confirmCorner = Instance.new("UICorner")
    confirmCorner.CornerRadius = UDim.new(0, 6)
    confirmCorner.Parent = confirmBtn
    
    -- Cancel button
    local cancelBtn = Instance.new("TextButton")
    cancelBtn.Size = UDim2.new(0, 120, 0, 35)
    cancelBtn.Position = UDim2.new(1, -120, 1, -50)
    cancelBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    cancelBtn.BorderSizePixel = 0
    cancelBtn.Text = "Cancelar"
    cancelBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    cancelBtn.Font = Enum.Font.Gotham
    cancelBtn.TextScaled = true
    cancelBtn.Parent = frame
    
    local cancelCorner = Instance.new("UICorner")
    cancelCorner.CornerRadius = UDim.new(0, 6)
    cancelCorner.Parent = cancelBtn
    
    -- Events
    confirmBtn.MouseButton1Click:Connect(function()
        dialog:Destroy()
        if onConfirm then onConfirm() end
    end)
    
    cancelBtn.MouseButton1Click:Connect(function()
        dialog:Destroy()
        if onCancel then onCancel() end
    end)
    
    -- Escape to cancel
    local escConnection
    escConnection = UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == Enum.KeyCode.Escape then
            dialog:Destroy()
            escConnection:Disconnect()
            if onCancel then onCancel() end
        end
    end)
    
    -- Animação de entrada
    frame.Size = UDim2.new(0, 0, 0, 0)
    local scaleIn = TweenService:Create(frame, animInfo, {Size = UDim2.new(0, 400, 0, 200)})
    scaleIn:Play()
end

function UI:CreateQuickMenu()
    local quickMenu = Instance.new("ScreenGui")
    quickMenu.Name = "KingHubQuickMenu"
    quickMenu.Parent = CoreGui
    
    local menuFrame = Instance.new("Frame")
    menuFrame.Size = UDim2.new(0, 60, 0, 200)
    menuFrame.Position = UDim2.new(0, -60, 0.5, -100)
    menuFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    menuFrame.BorderSizePixel = 0
    menuFrame.Parent = quickMenu
    
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = menuFrame
    
    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 162, 255)
    stroke.Thickness = 2
    stroke.Parent = menuFrame
    
    -- Botões do menu
    local buttons = {
        {name = "🏠", action = function() UI:RestoreWindow() end, tooltip = "Restaurar"},
        {name = "📦", action = function() UI:MinimizeWindow() end, tooltip = "Minimizar"},
        {name = "🖼️", action = function() UI:ToggleFullscreen() end, tooltip = "Tela Cheia"},
        {name = "⚙️", action = function() UI:ShowSettings() end, tooltip = "Configurações"},
        {name = "❌", action = function() UI:ConfirmClose() end, tooltip = "Fechar"}
    }
    
    for i, btn in ipairs(buttons) do
        local button = Instance.new("TextButton")
        button.Size = UDim2.new(1, -10, 0, 35)
        button.Position = UDim2.new(0, 5, 0, (i-1) * 40 + 5)
        button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        button.BorderSizePixel = 0
        button.Text = btn.name
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        button.Font = Enum.Font.GothamBold
        button.TextScaled = true
        button.Parent = menuFrame
        
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 6)
        btnCorner.Parent = button
        
        button.MouseButton1Click:Connect(btn.action)
        
        -- Hover effect
        button.MouseEnter:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
        end)
        
        button.MouseLeave:Connect(function()
            button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        end)
    end
    
    -- Toggle menu visibility
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size = UDim2.new(0, 30, 0, 30)
    toggleBtn.Position = UDim2.new(0, 10, 0.5, -15)
    toggleBtn.BackgroundColor3 = Color3.fromRGB(0, 162, 255)
    toggleBtn.BorderSizePixel = 0
    toggleBtn.Text = "☰"
    toggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleBtn.Font = Enum.Font.GothamBold
    toggleBtn.TextScaled = true
    toggleBtn.Parent = CoreGui
    
    local toggleCorner = Instance.new("UICorner")
    toggleCorner.CornerRadius = UDim.new(0, 15)
    toggleCorner.Parent = toggleBtn
    
    toggleBtn.MouseButton1Click:Connect(function()
        menuVisible = not menuVisible
        local targetPos = menuVisible and UDim2.new(0, 10, 0.5, -100) or UDim2.new(0, -60, 0.5, -100)
        local slide = TweenService:Create(menuFrame, animInfo, {Position = targetPos})
        slide:Play()
        toggleBtn.Text = menuVisible and "☰" or "▶"
    end)
end

function UI:MinimizeWindow()
    if mainGui and not isMinimized then
        isMinimized = true
        local tween = TweenService:Create(mainGui, animInfo, {
            Size = UDim2.new(0, 0, 0, 0)
        })
        tween:Play()
        tween.Completed:Connect(function()
            mainGui.Enabled = false
        end)
        UI:CreateNotification("KingHub", "Interface minimizada", 2)
    end
end

function UI:RestoreWindow()
    if mainGui and isMinimized then
        isMinimized = false
        mainGui.Enabled = true
        local tween = TweenService:Create(mainGui, animInfo, {
            Size = isFullscreen and UDim2.new(1, 0, 1, 0) or originalSize
        })
        tween:Play()
        UI:CreateNotification("KingHub", "Interface restaurada", 2)
    end
end

function UI:ToggleFullscreen()
    if not mainGui then return end
    
    isFullscreen = not isFullscreen
    local mf = mainGui:FindFirstChildWhichIsA("Frame", true)
    
    if mf then
        local targetSize = isFullscreen and UDim2.new(1, 0, 1, 0) or originalSize
        local targetPos = isFullscreen and UDim2.new(0, 0, 0, 0) or originalPosition
        
        local sizeTween = TweenService:Create(mf, animInfo, {Size = targetSize})
        local posTween = TweenService:Create(mf, animInfo, {Position = targetPos})
        
        sizeTween:Play()
        posTween:Play()
        
        UI:CreateNotification("KingHub", isFullscreen and "Modo tela cheia ativado" or "Modo janela ativado", 2)
    end
end

function UI:ConfirmClose()
    UI:CreateConfirmDialog(
        "Fechar KingHub",
        "Tem certeza que deseja fechar o KingHub? Esta ação não pode ser desfeita.",
        function()
            -- Confirmar
            if mainGui then
                local fadeOut = TweenService:Create(mainGui, animInfo, {
                    BackgroundTransparency = 1
                })
                fadeOut:Play()
                fadeOut.Completed:Connect(function()
                    mainGui:Destroy()
                    -- Limpar quick menu
                    local quickMenu = CoreGui:FindFirstChild("KingHubQuickMenu")
                    if quickMenu then quickMenu:Destroy() end
                    UI:CreateNotification("KingHub", "Interface fechada com sucesso", 3)
                end)
            end
        end,
        function()
            -- Cancelar
            UI:CreateNotification("KingHub", "Ação cancelada", 2)
        end
    )
end

function UI:ShowSettings()
    UI:CreateNotification("KingHub", "Menu de configurações em desenvolvimento", 2)
end

function UI:Init()
    -- Cria a janela principal
    Window = Library.CreateLib("KingHub - 99 Nights", "DarkTheme")

    -- Aba Principal
    local PrincipalTab = Window:NewTab("Principal")
    local TestSec = PrincipalTab:NewSection("Teste")
    
    TestSec:NewButton("Mensagem", "Mostra no console", function()
        print("KingHub funcionando ✅")
        UI:CreateNotification("KingHub", "Teste executado com sucesso!", 2)
    end)

    -- Aba Configs
    local ConfigsTab = Window:NewTab("Configs")
    local UiSec = ConfigsTab:NewSection("Interface")

    -- Aguardar interface carregar
    task.wait(0.5)
    mainGui = CoreGui:FindFirstChild("KavoUI")
    
    if mainGui then
        local mf = mainGui:FindFirstChildWhichIsA("Frame", true)
        if mf then
            originalSize = mf.Size
            originalPosition = mf.Position
        end
    end

    -- Criar menu lateral
    UI:CreateQuickMenu()

    -- Botões da interface
    UiSec:NewButton("Minimizar Hub", "Esconde a interface com animação", function()
        UI:MinimizeWindow()
    end)

    UiSec:NewButton("Restaurar Hub", "Mostra a interface novamente", function()
        UI:RestoreWindow()
    end)

    UiSec:NewButton("Alternar Tela Cheia", "Liga/desliga o modo tela cheia", function()
        UI:ToggleFullscreen()
    end)

    UiSec:NewButton("Fechar Hub", "Fecha com confirmação visual", function()
        UI:ConfirmClose()
    end)

    -- Aba Features
    local FeaturesTab = Window:NewTab("Features")
    local NotifSec = FeaturesTab:NewSection("Sistema de Notificações")
    
    NotifSec:NewButton("Teste Notificação", "Mostra uma notificação de teste", function()
        UI:CreateNotification("Teste", "Esta é uma notificação de exemplo!", 3)
    end)

    NotifSec:NewButton("Notificação de Sucesso", "Notificação verde", function()
        UI:CreateNotification("Sucesso ✅", "Operação realizada com êxito", 2)
    end)

    NotifSec:NewButton("Notificação de Aviso", "Notificação amarela", function()
        UI:CreateNotification("Aviso ⚠️", "Atenção: Verifique as configurações", 4)
    end)

    -- Teclas de atalho
    UserInputService.InputBegan:Connect(function(input, gameProcessed)
        if gameProcessed then return end
        
        if input.KeyCode == Enum.KeyCode.F1 then
            UI:MinimizeWindow()
        elseif input.KeyCode == Enum.KeyCode.F2 then
            UI:RestoreWindow()
        elseif input.KeyCode == Enum.KeyCode.F11 then
            UI:ToggleFullscreen()
        elseif input.KeyCode == Enum.KeyCode.Delete then
            UI:ConfirmClose()
        end
    end)

    -- Notificação de inicialização
    task.wait(1)
    UI:CreateNotification("KingHub Carregado", "Interface inicializada com sucesso! Use F1-F11 para atalhos", 4)
    
    print("🚀 KingHub carregado com interface aprimorada!")
    print("📋 Atalhos: F1=Minimizar | F2=Restaurar | F11=Tela Cheia | Del=Fechar")
end

return UI
