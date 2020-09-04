function ShootBullet(player, weapon)
    if IsPedInAnyVehicle(player, true) then
        ClearPedTasksImmediately(player)
    end
    local RootPosition = GetPedBoneCoords(player, SKEL_ROOT, 0, 0, 0)
    local HandPosition = GetPedBoneCoords(player, SKEL_R_Hand, 0, 0, 0.2)
    local WeaponHash = GetHashKey(weapon)
    ShootSingleBulletBetweenCoords(
        HandPosition.x,
        HandPosition.y,
        HandPosition.z,
        RootPosition.x,
        RootPosition.y,
        RootPosition.z,
        1,
        0,
        WeaponHash,
        PlayerPedId(),
        false,
        false,
        1
    )
end
