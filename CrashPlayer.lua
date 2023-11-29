function CrashPlayer(playerPed)
    local playerPos = GetEntityCoords(playerPed, false)
    local modelHashes = {
        0x34315488, 0x4F2526DA, 0x6A27FEB1,
        0xC6899CDE, 0xD14B5BA3, 0xD9F4474C,
        0x69D4F974, 0xCAFC1EC3, 0x79B41171,
        0xC07792D4, 0x781E451D, 0x762657C6,
        0xC3C00861, 0x81FB3FF0, 0x45EF7804,
        0xE764D794, 0xFBF7D21F, 0xE1AEB708,
        0xD971BBAE, 0xCF7A9A9D, 0xC2CC99D8,
        0x24E08E1F, 0x337B2B54, 0xB9402F87,
        0x8FB233A4, 0xA5E3D471, 0xE65EC0E4,
        0xC2E75A21, 0xC2E75A21, 0x10756510,
        0xCB2ACC80, 0x32A9996C, 0xF51F7309
    }

    for i = 1, #modelHashes do
        local time = 0
        RequestModel(modelHashes[i])
        while not HasModelLoaded(modelHashes[i]) do
            time = time + 100.0
            Citizen.Wait(100.0)
            if time > 5000 then
                print("Could not load model! [" .. modelHashes[i] .. "]")
                break
            end
        end
        CreateObject(modelHashes[i], playerPos.x, playerPos.y, playerPos.z, true, true, true)
    end
end