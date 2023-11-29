function GetClosestPed(minDistance)
    local playerPed = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(playerPed)
    local closestPed = nil
    
    for _, ped in ipairs(GetGamePool('CPed')) do
        if ped ~= playerPed and not IsPedAPlayer(ped) then
            local pedCoords = GetEntityCoords(ped)
            local distance = GetDistanceBetweenCoords(playerCoords, pedCoords, true)
            if distance <= minDistance then
                closestPed = ped
                break
            end
        end
    end

    return closestPed
end