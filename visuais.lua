return function(tab)
    tab:NewToggle("Highlight Inimigos", "Destaca inimigos próximos", function(state)
        print("ESP ativado:", state)
    end)
end
