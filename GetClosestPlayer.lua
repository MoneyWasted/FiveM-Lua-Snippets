function GetClosestPlayer(radius)
    local players = GetActivePlayers()
    local closestDistance = math.huge
    local closestPlayer = nil
    local ply = GetPlayerPed(-1)
    local plyCoords = GetEntityCoords(ply, false)

    for _, playerId in ipairs(players) do
        local target = GetPlayerPed(playerId)
        if target ~= ply then
            local targetCoords = GetEntityCoords(target, false)
            local distance = GetDistanceBetweenCoords(plyCoords.x, plyCoords.y, plyCoords.z, targetCoords.x, targetCoords.y, targetCoords.z, true)
            if distance < closestDistance then
                closestPlayer = playerId
                closestDistance = distance
            end
        end
    end

    if closestDistance <= radius then
        return closestPlayer
    end

    return nil
end