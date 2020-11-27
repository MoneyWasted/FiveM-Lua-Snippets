function PedAttack(target, weapon)
    local coords = GetEntityCoords(GetPlayerPed(target))
    
    local retval, peds = AddRelationshipGroup("madPeds")
    SetRelationshipBetweenGroups(0, peds, peds)

    local retval, players = AddRelationshipGroup("players")
    SetRelationshipBetweenGroups(5, peds, players)
    SetRelationshipBetweenGroups(5, players, peds)
    SetPedRelationshipGroupHash(GetPlayerPed(target), players)

    for k in EnumeratePeds() do
        if k ~= GetPlayerPed(target) and not IsPedAPlayer(k) then
            GiveWeaponToPed(k, GetHashKey(weapon), 9999, 0, 1)
            ClearPedTasks(k)
            SetPedRelationshipGroupHash(k, peds)
            TaskCombatPed(k, GetPlayerPed(target), 0, 16)
            SetPedFiringPattern(k, 0xC6EE6B4C)
            SetPedCombatAbility(k, 100)
            SetPedCombatRange(k, 2)
            SetPedCombatAttributes(k, 46, 1)
            SetPedCombatAttributes(k, 5, 1)
        end
    end
end

PedAttack(GetPlayerPed(-1), "WEAPON_CARBINERIFLE")
