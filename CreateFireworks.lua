Citizen.CreateThread(function()
    local assetName = "scr_indep_fireworks"
    if not HasNamedPtfxAssetLoaded(assetName) then
        RequestNamedPtfxAsset(assetName)
        while not HasNamedPtfxAssetLoaded(assetName) do
            Citizen.Wait(10)
        end
    end

    local ped = GetPlayerPed(-1)
    local fireworkType = "scr_indep_firework_trailburst"
    local times = 20

    for i = 1, times do
        local pedCoords = GetEntityCoords(ped)
        UseParticleFxAssetNextCall(assetName)
        StartNetworkedParticleFxNonLoopedAtCoord(fireworkType, pedCoords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
        Citizen.Wait(2000)
    end
end)