local DrawLineWithCoords = function(beginCoords, endCoords, r, g, b, a)
    DrawLine(beginCoords.x, beginCoords.y, beginCoords.z, endCoords.x, endCoords.y, endCoords.z, r, g, b, a)
end

local GetOffset = function(ped, offsetX, offsetY, offsetZ)
    return GetOffsetFromEntityInWorldCoords(ped, offsetX, offsetY, offsetZ)
end

Citizen.CreateThread(function()
    while true do
        local rainbow = RGBRainbow(1.0)
        local r, g, b = rainbow.r, rainbow.g, rainbow.b
        local playerCoords = GetEntityCoords(PlayerPedId())
        
        for _, ped in ipairs(GetGamePool('CPed')) do
            local pedCoords = GetEntityCoords(ped)

            local offsets = {
                {-0.3, -0.3, -0.9}, {0.3, -0.3, -0.9}, {0.3, 0.3, -0.9}, {-0.3, 0.3, -0.9},
                {-0.3, -0.3, 0.8},  {0.3, -0.3, 0.8},  {0.3, 0.3, 0.8},  {-0.3, 0.3, 0.8},
            }

            for i = 1, #offsets - 1 do
                local beginCoords = GetOffset(ped, table.unpack(offsets[i]))
                local endCoords   = GetOffset(ped, table.unpack(offsets[i + 1]))
                DrawLineWithCoords(beginCoords, endCoords, r, g, b, 255)
            end

            local connectors = {
                {-0.3, 0.3, 0.8},  {-0.3, 0.3, -0.9},
                {0.3, 0.3, 0.8},   {0.3, 0.3, -0.9},
                {-0.3, -0.3, 0.8}, {-0.3, -0.3, -0.9},
                {0.3, -0.3, 0.8},  {0.3, -0.3, -0.9}
            }

            for i = 1, #connectors, 2 do
                local beginCoords = GetOffset(ped, table.unpack(connectors[i]))
                local endCoords   = GetOffset(ped, table.unpack(connectors[i + 1]))
                DrawLineWithCoords(beginCoords, endCoords, r, g, b, 255)
            end

            DrawLine(playerCoords.x, playerCoords.y, playerCoords.z, pedCoords.x, pedCoords.y, pedCoords.z, r, g, b, 255)
        end
        Citizen.Wait(0)
    end
end)