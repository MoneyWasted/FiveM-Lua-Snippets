function ScreenToWorld(screenCoord)
    -- Get camera rotation and position
    local camRot = GetGameplayCamRot(2)
    local camPos = GetGameplayCamCoord()

    -- Initial calculations for the direction vectors
    local direction = RotationToDirection(camRot)
    local direction1 = RotationToDirection(vector3(camRot.x, camRot.y, camRot.z + 10.0)) - RotationToDirection(vector3(camRot.x, camRot.y, camRot.z - 10.0))
    local direction2 = RotationToDirection(vector3(camRot.x + 10.0, camRot.y, camRot.z)) - RotationToDirection(vector3(camRot.x - 10.0, camRot.y, camRot.z))

    -- Calculating the rotation in radians
    local radians = -(math.rad(camRot.y))

    -- Adjusting the direction vectors based on the rotation
    local adjustedDir1 = (direction1 * math.cos(radians)) - (direction2 * math.sin(radians))
    local adjustedDir2 = (direction1 * math.sin(radians)) + (direction2 * math.cos(radians))

    -- Converting world coordinates to screen coordinates for comparison
    local case1, x1, y1 = WorldToScreenRel(camPos + (direction * 10.0) + adjustedDir1 + adjustedDir2)
    if not case1 then
        return camPos + (direction * 10.0)
    end

    local case2, x2, y2 = WorldToScreenRel(camPos + (direction * 10.0))
    if not case2 then
        return camPos + (direction * 10.0)
    end

    -- Checking if the converted screen coordinates are within a small threshold
    if math.abs(x1 - x2) < 0.001 or math.abs(y1 - y2) < 0.001 then
        return camPos + (direction * 10.0)
    end

    -- Calculating the final world coordinates
    local xFactor = (screenCoord.x - x2) / (x1 - x2)
    local yFactor = (screenCoord.y - y2) / (y1 - y2)
    return camPos + (direction * 10.0) + (adjustedDir1 * xFactor) + (adjustedDir2 * yFactor)
end