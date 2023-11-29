Citizen.CreateThread(function()
    for _, vehicle in ipairs(GetGamePool('CVehicle')) do
        if DoesEntityExist(vehicle) then
            if not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1)) then
                SetVehicleHasBeenOwnedByPlayer(vehicle, false)
                SetEntityAsMissionEntity(vehicle, false, false)
                DeleteVehicle(vehicle)
            end
        end
    end
end)