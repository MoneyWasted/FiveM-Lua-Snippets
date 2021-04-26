local entityEnumerator = {
    __gc = function(enum)
        if enum.destructor and enum.handle then
            enum.destructor(enum.handle)
        end
        enum.destructor = nil
        enum.handle = nil
    end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(
        function()
            local iter, id = initFunc()
            if not id or id == 0 then
                disposeFunc(iter)
                return
            end

            local enum = {handle = iter, destructor = disposeFunc}
            setmetatable(enum, entityEnumerator)

            local next = true
            repeat
                coroutine.yield(id)
                next, id = moveFunc(iter)
            until not next

            enum.destructor, enum.handle = nil, nil
            disposeFunc(iter)
        end
    )
end

function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

function GetClosestPed()
    local closestPed = 0

    for ped in EnumeratePeds() do
        local distanceCheck = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(ped), true)
        if distanceCheck <= 15 and ped ~= GetPlayerPed(-1) and not IsPedAPlayer(ped)  then
            closestPed = ped
            break
        end
    end

    return closestPed
end

Citizen.CreateThread(function()
    while true do
        local x, y, z = table.unpack(GetPedBoneCoords(GetClosestPed(), 0x796E))
        local heading = math.atan2(z, x)
        
        local greenHypotenuse = math.sqrt(x*x + y*y + z*z)
        local greenOpposite = y
        local greenAdjacent = math.sqrt(x*x + z*z)

        local pitch = math.atan2(greenOpposite, greenAdjacent)

        print("Heading: " .. heading .. "   Pitch: " .. pitch)

        SetGameplayCamRelativeHeading(heading)SetGameplayCamRawPitch(pitch)

        Citizen.Wait(0)
    end
end)
