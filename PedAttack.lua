function PedAttack(targetPed, weapon)
    local targetCoords = GetEntityCoords(targetPed)

    local retval, madPedsGroup = AddRelationshipGroup("madPeds")
    local retval, playerGroup = AddRelationshipGroup("players")
    
    SetRelationshipBetweenGroups(0, madPedsGroup, madPedsGroup)
    SetRelationshipBetweenGroups(5, madPedsGroup, playerGroup)
    SetRelationshipBetweenGroups(5, playerGroup, madPedsGroup)
    
    SetPedRelationshipGroupHash(targetPed, playerGroup)

    for _, ped in ipairs(GetGamePool('CPed')) do
        if ped ~= targetPed and not IsPedAPlayer(ped) then
            GiveWeaponToPed(ped, GetHashKey(weapon), 9999, false, true)
            ClearPedTasks(ped)
            SetPedRelationshipGroupHash(ped, madPedsGroup)
            TaskCombatPed(ped, targetPed, 0, 16)
            SetPedFiringPattern(ped, 0xC6EE6B4C)
            SetPedCombatAbility(ped, 100)
            SetPedCombatRange(ped, 2)
            SetPedCombatAttributes(ped, 46, true)
            SetPedCombatAttributes(ped, 5, true)
        end
    end
end

-- Example usage
PedAttack(GetPlayerPed(-1), "WEAPON_CARBINERIFLE")