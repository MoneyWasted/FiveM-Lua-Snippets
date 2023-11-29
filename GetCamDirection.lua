function GetCamDirection()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local pitch = GetGameplayCamRelativePitch()

    local radHeading = heading * math.pi / 180.0
    local radPitch = pitch * math.pi / 180.0

    local x = -math.sin(radHeading)
    local y = math.cos(radHeading)
    local z = math.sin(radPitch)

    local len = math.sqrt(x * x + y * y + z * z)
    if len == 0 then
        return 0, 0, 0
    end

    return x / len, y / len, z / len
end