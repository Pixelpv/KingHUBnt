return function(tab)
    tab:NewButton("Coletar Ouro", "Coleta ouro automaticamente", function()
        print("Coletando ouro...")
        -- Função real aqui
    end)

    tab:NewButton("Teleportar Base", "Vai para sua base", function()
        print("Teleportando...")
        -- Teleport local sem interferir nos outros
    end)
end
