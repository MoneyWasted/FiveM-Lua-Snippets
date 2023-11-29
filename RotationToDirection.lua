function RotationToDirection(rotation)
    -- Convert rotation angles from degrees to radians
    local retz = math.rad(rotation.z) -- Yaw
    local retx = math.rad(rotation.x) -- Pitch

    -- Calculate the absolute value of the cosine of the pitch
    local absx = math.abs(math.cos(retx))

    -- Calculate and return the direction vector
    return vector3(
        -math.sin(retz) * absx, -- X component
        math.cos(retz) * absx,  -- Y component
        math.sin(retx)          -- Z component (vertical)
    )
end