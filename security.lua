local Security = {}

function Security:init()
    print("Security: Inicializado")
    -- Ex: verificar instância privada
    if game:GetService("Players").LocalPlayer.Character == nil then
        warn("Character não carregado ainda!")
    end
end

return Security
