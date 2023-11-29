function ShootBullet(player, weapon)
    local weaponHash = GetHashKey(weapon)
    
    -- Request the weapon asset and wait for it to load
    RequestWeaponAsset(weaponHash)
    local attempts = 0
    local maxAttempts = 50
    while not HasWeaponAssetLoaded(weaponHash) do
        Wait(1)
        attempts = attempts + 1
        if attempts > maxAttempts then
            print("Failed to load weapon asset.")
            return
        end
    end

    -- Get the coordinates for the hand and root bone of the player
    local handPosition = GetPedBoneCoords(player, SKEL_R_Hand, 0, 0, 0.2)
    local rootPosition = GetPedBoneCoords(player, SKEL_ROOT, 0, 0, 0)

    -- Shoot a single bullet from the hand position towards the root position
    ShootSingleBulletBetweenCoords(
        handPosition.x, handPosition.y, handPosition.z,
        rootPosition.x, rootPosition.y, rootPosition.z,
        1, false, weaponHash, GetPlayerServerId(player), false, false, 1000
    )
end