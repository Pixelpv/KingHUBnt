return function(tab)
    tab:NewToggle("Auto Farm", "Ativa coleta automática", function(state)
        print("Auto Farm:", state)
        -- Loop seguro para instâncias privadas
    end)
end
