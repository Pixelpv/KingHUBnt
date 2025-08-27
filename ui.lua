local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/OrionRoblox/Orion/main/source.lua"))()
local player = game.Players.LocalPlayer
local PlayerGui = player:WaitForChild("PlayerGui")

local MainWindow = OrionLib:MakeWindow({
    Name = "Test Orion UI",
    IntroText = "Olá!",
    SaveConfig = false,
    Parent = PlayerGui
})

local Tab = MainWindow:MakeTab({Name = "Principal"})
Tab:AddButton({Name = "Teste", Callback = function()
    print("Funcionando!")
end})
