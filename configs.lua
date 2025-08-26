local Configs = {}
local settings = {
    autoFarm = false,
    espEnemies = true
}

function Configs:getSettings()
    return settings
end

function Configs:setSetting(key, value)
    settings[key] = value
    -- Pode salvar em DataStore/localStorage se quiser persistência
end

return Configs
