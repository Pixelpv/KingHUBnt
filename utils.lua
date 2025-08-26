local Utils = {}

function Utils:safeWait(seconds)
    local t = tick()
    while tick() - t < seconds do
        game:GetService("RunService").RenderStepped:Wait()
    end
end

return Utils
