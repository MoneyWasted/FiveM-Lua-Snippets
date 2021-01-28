Citizen.CreateThread(function()
    local pedcoords = GetEntityCoords(GetPlayerPed(-1))
    local times = 20

    if not HasNamedPtfxAssetLoaded("scr_indep_fireworks") then
        RequestNamedPtfxAsset("scr_indep_fireworks")
        while not HasNamedPtfxAssetLoaded("scr_indep_fireworks") do
            Wait(10)
        end
    end

    repeat
        UseParticleFxAssetNextCall("scr_indep_fireworks")
        local firework = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", pedcoords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
        times = times - 1
        Citizen.Wait(2000)
    until (times == 0)
end)
