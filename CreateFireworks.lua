Citizen.CreateThread(function()

	RequestAnimDict(animlib)

	while not HasAnimDictLoaded(animlib) do
		   Citizen.Wait(10)
    end
        
	if not HasNamedPtfxAssetLoaded("scr_indep_fireworks") then
		RequestNamedPtfxAsset("scr_indep_fireworks")
		while not HasNamedPtfxAssetLoaded("scr_indep_fireworks") do
		   Wait(10)
		end
	end

	local pedcoords = GetEntityCoords(GetPlayerPed(-1))
	local ped = GetPlayerPed(-1)
	local times = 20

	TaskPlayAnim(ped, animlib, 'place_firework_3_box', -1, -8.0, 3000, 0, 0, false, false, false)
	Citizen.Wait(4000)
	ClearPedTasks(ped)
		   
	box = CreateObject(GetHashKey('ind_prop_firework_03'), pedcoords, true, false, false)
	PlaceObjectOnGroundProperly(box)
	FreezeEntityPosition(box, true)
	local firecoords = GetEntityCoords(box)

	Citizen.Wait(10000)
	repeat
	UseParticleFxAssetNextCall("scr_indep_fireworks")
	local part1 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_trailburst", firecoords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
	times = times - 1
	Citizen.Wait(2000)
	until(times == 0)
	DeleteEntity(box)
	box = nil
end)
