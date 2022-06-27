local function handlePedHitByWaterCannon(ped)
    local showAlert = true

    setPedVoice(ped, "PED_TYPE_DISABLED", nil)
    addEventHandler("onClientPedDamage", ped, function(attacker, weaponId) 
        local pedHitted = source
        setElementHealth(pedHitted, 99999)
        
        if(pedHitted ~= ped) then return end
        if(attacker ~= localPlayer) then return end
        if(weaponId ~= getWeaponIDFromName("fire extinguisher")) then return end
        if(not showAlert) then return end

        outputChatBox("Você precisa utilizar o #FF0000caminhão de bombeiros#FFFFFF para apagar este incêndio.", 255, 255, 255, true)
        showAlert = false
        setTimer(function() showAlert = true end, 2000, 1)
    end) 
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
    local showAlert = true

    setPedVoice(ped, "PED_TYPE_DISABLED", nil)
    addEventHandler("onClientPedHitByWaterCannon", getRootElement(), function(pedHitted)
        if(pedHitted ~= ped) then return end
        if(getVehicleOccupant(source) ~= localPlayer) then return end
        if(not showAlert) then return end

        outputChatBox("Você precisa utilizar o #FF0000extintor de incêndio#FFFFFF para apagar este incêndio.", 255, 255, 255, true)
        showAlert = false
        setTimer(function() showAlert = true end, 2000, 1)
    end)
    local function handlePedHit(attacker, weaponId)
        local pedHitted = source
        setElementHealth(pedHitted, 99999)

        if(pedHitted ~= ped) then return end
        if(attacker ~= localPlayer) then return end
        if(weaponId ~= getWeaponIDFromName("fire extinguisher")) then return end
        
        removeEventHandler("onClientPedDamage", ped, handlePedHit) 
        triggerServerEvent("onPedHitByFireExtinguisher", pedHitted)
        playSFX("script", 217, 0, false)
    end
    addEventHandler("onClientPedDamage", ped, handlePedHit) 
end
addEvent("listenPedHitByFireExtinguisher", true)
addEventHandler("listenPedHitByFireExtinguisher", localPlayer, handlePedHitByFireExtinguisher)
