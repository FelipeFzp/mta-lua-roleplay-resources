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


local function handlePedHitByFireExtinguisher(ped)
    setPedVoice(ped, "PED_TYPE_DISABLED", nil)
    local function handlePedHit(attacker, weaponId)
        local pedHitted = source
        if(pedHitted ~= ped) then cancelEvent() return end
        if(attacker ~= localPlayer) then cancelEvent() return end
        if(weaponId ~= getWeaponIDFromName("fire extinguisher")) then cancelEvent() return end
        if(getElementHealth(ped) > 90) then return end
        
        removeEventHandler("onClientPedDamage", ped, handlePedHit) 
        triggerServerEvent("onPedHitByFireExtinguisher", pedHitted)
        playSFX("script", 217, 0, false)
    end
    addEventHandler("onClientPedDamage", ped, handlePedHit) 
end
addEvent("listenPedHitByFireExtinguisher", true)
addEventHandler("listenPedHitByFireExtinguisher", localPlayer, handlePedHitByFireExtinguisher)
