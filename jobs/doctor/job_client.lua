local function listenHealPatientQuestFinish(ped)
    addEventHandler("onClientPedDamage", ped, function(player, weaponId, bodypart, loss)
        if(player == localPlayer and weaponId == getWeaponIDFromName("spraycan") and getElementHealth(ped) < 80) then
            triggerServerEvent("healPatientQuestFinish", localPlayer)
        end
    end)
end
addEvent("listenHealPatientQuestFinish", true)
addEventHandler("listenHealPatientQuestFinish", getRootElement(), listenHealPatientQuestFinish)

local function handleSetPedEnterAmbulance(ped, vehicle)
    local retryTimer;
    local function setPedEnterAmbulance()
        local pedX, pedY, pedZ = getElementPosition(ped)
        local playerX, playerY, playerZ = getElementPosition(localPlayer)
        if(pedX - playerX > 10 or pedY - playerY > 10 or pedZ - playerZ > 10) then return end --IGNORE IF YOU ARE 10m FAR OF PED, AVOID LAG ON CALL setPedEnterVehicle

        if(isPedInVehicle(ped) and isTimer(retryTimer)) then 
            killTimer(retryTimer)
        end
        setPedEnterVehicle(ped, vehicle, true)
    end

    setPedEnterAmbulance()
    retryTimer = setTimer(setPedEnterAmbulance, 2000, 0)
end
addEvent("setPedEnterAmbulance", true)
addEventHandler("setPedEnterAmbulance", getRootElement(), handleSetPedEnterAmbulance)