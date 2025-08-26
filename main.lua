-- main.lua
local UI = require(game.ReplicatedStorage.KingHub.ui)
local Security = require(game.ReplicatedStorage.KingHub.security)
local Configs = require(game.ReplicatedStorage.KingHub.configs)

-- Inicializa segurança
Security:init()

-- Carrega interface
UI:Init(Configs:getSettings())
