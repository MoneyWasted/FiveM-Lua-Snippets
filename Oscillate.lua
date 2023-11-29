function Oscillate(entity, position, angleFreq, dampRatio)
    -- Ensure that the entity and position are valid
    if not entity or not position then
        return
    end

    -- Calculate the force to be applied based on the damping harmonic oscillator model
    local posDifference = SubVectors(position, GetEntityCoords(entity))
    local pos1 = ScaleVector(posDifference, (angleFreq * angleFreq))
    
    local entityVelocity = GetEntityVelocity(entity)
    local pos2 = AddVectors(ScaleVector(entityVelocity, (2.0 * angleFreq * dampRatio)), vector3(0.0, 0.0, 0.1)) -- Adding a small constant vector

    local targetPos = SubVectors(pos1, pos2)

    -- Apply the calculated force to the entity
    ApplyForce(entity, targetPos)
end