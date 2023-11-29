function WorldToScreen(worldCoords)
    -- Convert world coordinates to screen coordinates
    local isOnScreen, screenX, screenY = GetScreenCoordFromWorldCoord(worldCoords.x, worldCoords.y, worldCoords.z)

    -- Check if the position is on screen
    if not isOnScreen then
        return false, 0.0, 0.0
    end

    -- Return true along with the screen coordinates
    return true, screenX, screenY
end