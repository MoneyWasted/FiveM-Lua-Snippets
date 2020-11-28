function StartTransitionTimecycle(modifier)
  if GetTimecycleTransitionModifierIndex() = -1 and GetTimecycleModifierIndex() = -1 then
    SetTransitionTimecycleModifier(modifier, 5.0)
  end
end

while true do
  StartTransitionTimecycle("int_lesters")
  Citizen.Wait(0)
end
