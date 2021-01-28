function makePedHostile(target, ped, swat, clone)
    if swat == 1 or swat == true then
        RequestNetworkControl(ped)
        TaskCombatPed(ped, GetPlayerPed(SelectedPlayer), 0, 16)
        SetPedCanSwitchWeapon(ped, true)
    elseif clone == 1 or clone == true then
        local Hash = GetEntityModel(ped)
        if DoesEntityExist(ped) then
            DeletePed(ped)
            RequestModel(Hash)
            local coords = GetEntityCoords(GetPlayerPed(target), true)
            if HasModelLoaded(Hash) then
                local newPed = CreatePed(21, Hash, coords.x, coords.y, coords.z, 0, 1, 0)
                if GetEntityHealth(newPed) == GetEntityMaxHealth(newPed) then
                    SetModelAsNoLongerNeeded(Hash)
                    RequestNetworkControl(newPed)
                    TaskCombatPed(newPed, GetPlayerPed(target), 0, 16)
                    SetPedCanSwitchWeapon(ped, true)
                end
            end
        end
    else
        local TargetHandle = GetPlayerPed(target)
        RequestNetworkControl(ped)
        TaskCombatPed(ped, TargetHandle, 0, 16)
    end
end
