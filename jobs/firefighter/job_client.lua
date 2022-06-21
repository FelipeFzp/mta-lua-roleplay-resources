local function handlePedHitByWaterCannon(ped)
    setPedVoice(ped, "PED_TYPE_DISABLED", nil)
    addEventHandler("onClientPedDamage", ped, cancelEvent) 
    local function handlePedHitByWater(pedHitted)
        if(pedHitted ~= ped) then return end
        if(getVehicleOccupant(source) ~= localPlayer) then return end
        
        removeEventHandler("onClientPedDamage", ped, cancelEvent) 
        triggerServerEvent("onPedHitByWaterCannon", pedHitted)
        playSFX("script", 217, 0, false)
    end
    addEventHandler("onClientPedHitByWaterCannon", getRootElement(), handlePedHitByWater)
end
addEvent("listenPedHitByWaterCannon", true)
addEventHandler("listenPedHitByWaterCannon", localPlayer, handlePedHitByWaterCannon)
