-- ui.lua
local KavoUI = require(game.ReplicatedStorage.KavoUI)

local UI = {}
function UI:Init(settings)
    local Window = KavoUI.CreateLib("KingHub - 99 Nights", "Dark")
    
    local PrincipalTab = Window:NewTab("Principal")
    local TrazerTab = Window:NewTab("Trazer")
    local AutoTab = Window:NewTab("Auto")
    local VisuaisTab = Window:NewTab("Visuais")
    local ConfigTab = Window:NewTab("Configs")
    
    -- Conecta funções de cada aba
    require(game.ReplicatedStorage.KingHub.principal)(PrincipalTab)
    require(game.ReplicatedStorage.KingHub.trazer)(TrazerTab)
    require(game.ReplicatedStorage.KingHub.auto)(AutoTab)
    require(game.ReplicatedStorage.KingHub.visuais)(VisuaisTab)
    require(game.ReplicatedStorage.KingHub.configs)(ConfigTab)
end

return UI
