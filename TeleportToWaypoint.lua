function TeleportToWaypoint()
    if not DoesBlipExist(GetFirstBlipInfoId(8)) then
        return
    end

    local blipIterator = GetBlipInfoIdIterator(8)
    local blip = GetFirstBlipInfoId(8, blipIterator)
    local WaypointCoords = Citizen.InvokeNative(0xFA7C7F0AADF25D09, blip, Citizen.ResultAsVector())
    
    local playerPed = GetPlayerPed(-1)
    local entity

    if IsPedInAnyVehicle(playerPed, 0) and (GetPedInVehicleSeat(GetVehiclePedIsIn(playerPed, 0), -1) == playerPed) then
        entity = GetVehiclePedIsIn(playerPed, 0)
    else
        entity = playerPed
    end

    -- Initial teleport to a high altitude
    local height = 1000.0
    SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, height)
    FreezeEntityPosition(entity, true)

    -- Try to get the ground z coordinate directly
    local bool, zHeight = GetGroundZFor_3dcoord(WaypointCoords.x, WaypointCoords.y, height)

    -- If ground detected, set the entity's coords to ground level
    if bool then
        SetEntityCoords(entity, WaypointCoords.x, WaypointCoords.y, zHeight)
    end

    FreezeEntityPosition(entity, false)
end