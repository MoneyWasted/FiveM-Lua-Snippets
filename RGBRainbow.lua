function RGBRainbow(frequency)
    -- Initialize the result table
    local result = {}
    local curtime = GetGameTimer() / 1000

    -- Constants for the sine wave calculation
    local amplitude = 127
    local offset = 128
    local phaseShift = 2 -- Phase shift for G and B components

    -- Calculate each color component using a sine wave
    result.r = math.floor(math.sin(curtime * frequency) * amplitude + offset)
    result.g = math.floor(math.sin(curtime * frequency + phaseShift) * amplitude + offset)
    result.b = math.floor(math.sin(curtime * frequency + 2 * phaseShift) * amplitude + offset)

    return result
end