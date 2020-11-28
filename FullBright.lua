function StartTransitionTimecycle(modifier)
    if GetTimecycleTransitionModifierIndex() == -1 and GetTimecycleModifierIndex() == -1 then
        SetTransitionTimecycleModifier(modifier, 5.0)
    else
        ClearTimecycleModifier()
    end
end

StartTransitionTimecycle("int_lesters")
