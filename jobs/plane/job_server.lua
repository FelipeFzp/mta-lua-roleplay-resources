-- AIRPORT TO FINISH QUESTS
local AIRPORTS_BY_ZONE = {}
AIRPORTS_BY_ZONE["Bone County"] = { "372.5,2503.3,15.4" }
AIRPORTS_BY_ZONE["Tierra Robada"] = AIRPORTS_BY_ZONE["Bone County"]
AIRPORTS_BY_ZONE["Las Venturas"] = { "1315.9,1341.7,9.7", "1366.3,1736.9,9.8", "1608.7,1620.7,9.8" }
AIRPORTS_BY_ZONE["Red County"] = AIRPORTS_BY_ZONE["Las Venturas"]
AIRPORTS_BY_ZONE["San Fierro"] = { "-1280.3,8.9,13.1", "-1397.6,-613.20001,13.1", "-1212.5,-151.3,13.1" }
AIRPORTS_BY_ZONE["Whetstone"] = AIRPORTS_BY_ZONE["San Fierro"]
AIRPORTS_BY_ZONE["Los Santos"] = { "2112.8,-2435.8,12.5", "1854.6,-2414.7,12.5", "1922.7,-2253.1001,12.5" }
AIRPORTS_BY_ZONE["Flint County"] = AIRPORTS_BY_ZONE["Los Santos"]
AIRPORTS_BY_ZONE["Unknown"] = AIRPORTS_BY_ZONE["Los Santos"]

-- AIRDROP QUEST ROUTES
local AIRDROP_ROUTES = {}
AIRDROP_ROUTES["Bone County"] = { 
    "TODO" 
}
AIRDROP_ROUTES["Tierra Robada"] = AIRDROP_ROUTES["Bone County"]
AIRDROP_ROUTES["Las Venturas"] = { 
    "TODO"
}
AIRDROP_ROUTES["Red County"] = AIRDROP_ROUTES["Las Venturas"]
AIRDROP_ROUTES["San Fierro"] = { 
    "TODO"
}
AIRDROP_ROUTES["Whetstone"] = AIRDROP_ROUTES["San Fierro"]
AIRDROP_ROUTES["Los Santos"] = { 
    "1307.7470703125,-2478.3173828125,69.470222473145,1306.7476530119,-2478.2832498492,69.470222473145;842.404296875,-1875.990234375,61.688091278076,842.10587835711,-1875.0357992603,61.688091278076;523.490234375,-1236.130859375,96.078620910645,522.63995783399,-1235.604523167,96.078620910645;53.3076171875,-1473.1279296875,119.275390625,52.501541231968,-1473.7197417809,119.275390625;351.037109375,-2061.5458984375,88.400062561035,352.03534237953,-2061.6053195504,88.400062561035;1182.9912109375,-2035.560546875,112.47093963623,1183.9911720193,-2035.5693692806,112.47093963623;2030.8681640625,-1644.142578125,105.63436126709,2031.6240050468,-1643.4878228986,105.63436126709;2571.2021484375,-1662.154296875,102.31507873535,2571.9820630912,-1662.7801827535,102.31507873535;2374.3037109375,-2285.26953125,79.279998779297,2373.497634982,-2285.8613433434,79.279998779297"
}
AIRDROP_ROUTES["Flint County"] = AIRDROP_ROUTES["Los Santos"]
AIRDROP_ROUTES["Unknown"] = AIRDROP_ROUTES["Los Santos"]

-- AIRCRAFTS
local AIRCRAFTS = {
    593, --Dodo
    -- 511, --Beagle
    553, --Nevada
    519, --Shamal
    -- 577, --AT-400
    592 --Andromada
}


-- QUESTS
addEvent("deliveryPackageQuestTimesEnd", true)
local function deliveryPackageQuest(container, player, job)
    -- CREATE PLANE BY LEVEL
    local level = job.currentLevel;
    if(level >= #AIRCRAFTS) then level = #AIRCRAFTS end
    local x, y, z = getElementPosition(player)
    local rx, ry, rz = getElementRotation(player)
    local plane = createVehicle(AIRCRAFTS[level], 0, 0, 0)
    if(getPedOccupiedVehicle(player) ~= false) then destroyElement(getPedOccupiedVehicle(player)) end

    setElementParent(plane, container)
    spawnVehicle(plane, x, y, z + 2, rx, ry, rz)
    warpPedIntoVehicle(player, plane)

    -- CREATE DESTINY MARKER, GET RANDOM AIRPORT ON A DIFFERENT ZONE OF PLAYER
    local ax, ay, az;
    while(ax == nil or ay == nil or az == nil)
    do
        local zoneName = getZoneName(math.random(-3000, 3000), math.random(-3000, 3000), math.random(0, 100), true)
        if(AIRPORTS_BY_ZONE[zoneName] ~= AIRPORTS_BY_ZONE[getElementZoneName(player, true)]) then 
            local availableAirports = AIRPORTS_BY_ZONE[zoneName];
            airportCoordinates = availableAirports[math.random(1, #availableAirports)]
            ax, ay, az = airportCoordinates:match("([^,]+),([^,]+),([^,]+)")
            outputChatBox("Destino: Aeroporto de " .. getZoneName(ax, ay, az, true).. ", vá até ponto indicado no mapa.", player, 255, 255, 255, true)
        end
    end
    local blip = createBlip(ax, ay, az, 0, 3, 240, 0, 0, 255, 0, 99999, player)
    setElementParent(blip, container)

    local marker = createMarker(ax, ay, az, "cylinder", 5, 0, 0, 240, 255, player)
    setElementParent(marker, container)

    -- LISTEN HIT MARKER WITH SAME PLANE THAT STARTED
    addEventHandler("onMarkerHit", marker, 
    function(hitElement) 
        if(hitElement ~= player) then return end
        
        -- VALIDATION TO USE PLANE TO TRAVEL
        local playerVehicle = getPedOccupiedVehicle(hitElement)
        if (playerVehicle == false or getElementModel(playerVehicle) ~= getElementModel(plane)) then
            outputChatBox("Você precisa estar no seu avião para finalizar está viagem!", player, 240, 0, 0, true)
            return
        end

        if(isTimer(underWaterTimerCheck)) then killTimer(underWaterTimerCheck) end
        local totalReward = get("delivery_package_quest_reward") + (get("delivery_package_quest_reward") * job.currentLevel * get("plane_level_bonus_multiplier"))
        outputChatBox("Você completou sua viagem com segurança. Serviço concluido! +$"..totalReward, player, 0, 240, 0, true)
        destroyElement(container)
        triggerEvent("doneQuest", player, totalReward, job.jobTriggerName)
        triggerClientEvent(player, "toggleMissionTimer", player)
    end)

       
    --LISTEN FOR PLANE UNDER WATER
    local underWaterTimerCheck = setTimer(function() 
        if(not isElement(plane)) then killTimer(underWaterTimerCheck) end

        if(isElement(plane) and isElementInWater(plane)) then 
            blowVehicle(plane, true) 
        end 
    end, 5000, 0)
    addEventHandler("onElementDestroy", plane, function() 
        if(isTimer(underWaterTimerCheck)) then killTimer(underWaterTimerCheck) end 
        if(getPedOccupiedVehicle(player) == plane and not isVehicleOnGround(plane)) then giveWeapon(player, getWeaponIDFromName("parachute"), 1, true) end
    end)

    -- LISTEN FOR PLANE DESTROYED
    local function onPlaneExplode()
        removeEventHandler("onVehicleExplode", plane, onPlaneExplode)
        destroyElement(container)
        if(isTimer(underWaterTimerCheck)) then killTimer(underWaterTimerCheck) end
        triggerClientEvent(player, "toggleMissionTimer", player)
        outputChatBox("Você destruiu seu avião.", player, 240, 0, 0, true)
        outputChatBox("Serviço fracassado!", player, 240, 0, 0, true)
    end
    addEventHandler("onVehicleExplode", plane, onPlaneExplode)

    
    -- ON TIMER END
    local function onTimesEnd()
        destroyElement(container)
        removeEventHandler("deliveryPackageQuestTimesEnd", player, onTimesEnd)
        if(isTimer(underWaterTimerCheck)) then killTimer(underWaterTimerCheck) end
        outputChatBox("Você demorou demais, seu cliente desistiu da encomenda.", player, 240, 0, 0, true)
        outputChatBox("Serviço fracassado!", player, 240, 0, 0, true)
    end
    addEventHandler("deliveryPackageQuestTimesEnd", player, onTimesEnd)

    -- START TIMER
    triggerClientEvent(player, "toggleMissionTimer", player, "Tempo restante ", 300, 60, "deliveryPackageQuestTimesEnd")
end

addEvent("airdropPackagesQuestTimesEnd", true)
local function airdropPackagesQuest(container, player, job)
    outputChatBox("Vá até o ponto marcado para fazer a entrega aérea, os pontos serão marcados em sequência conforme as entregas são feitas.", player, 255, 255, 255, true)

    -- CREATE PLANE BY LEVEL
    local level = job.currentLevel;
    if(level >= #AIRCRAFTS) then level = #AIRCRAFTS end
    local x, y, z = getElementPosition(player)
    local rx, ry, rz = getElementRotation(player)
    local plane = createVehicle(AIRCRAFTS[level], 0, 0, 0)
    if(getPedOccupiedVehicle(player) ~= false) then destroyElement(getPedOccupiedVehicle(player)) end

    setElementParent(plane, container)
    spawnVehicle(plane, x, y, z + 2, rx, ry, rz)
    warpPedIntoVehicle(player, plane)

    --LISTEN FOR PLANE UNDER WATER
    local underWaterTimerCheck = setTimer(function() 
        if(not isElement(plane)) then killTimer(underWaterTimerCheck) end

        if(isElement(plane) and isElementInWater(plane)) then 
            blowVehicle(plane, true) 
        end 
    end, 5000, 0)
    addEventHandler("onElementDestroy", plane, function() 
        if(isTimer(underWaterTimerCheck)) then killTimer(underWaterTimerCheck) end 
        if(getPedOccupiedVehicle(player) == plane and not isVehicleOnGround(plane)) then giveWeapon(player, getWeaponIDFromName("parachute"), 1, true) end
    end)

    -- LISTEN FOR PLANE DESTROYED
    local function onPlaneExplode()
        removeEventHandler("onVehicleExplode", plane, onPlaneExplode)
        destroyElement(container)
        if(isTimer(underWaterTimerCheck)) then killTimer(underWaterTimerCheck) end
        triggerClientEvent(player, "toggleMissionTimer", player)
        outputChatBox("Você destruiu seu avião.", player, 240, 0, 0, true)
        outputChatBox("Serviço fracassado!", player, 240, 0, 0, true)
    end
    addEventHandler("onVehicleExplode", plane, onPlaneExplode)
    
    -- ON TIMER END
    local function onTimesEnd()
        removeEventHandler("airdropPackagesQuestTimesEnd", player, onTimesEnd)
        destroyElement(container)
        if(isTimer(underWaterTimerCheck)) then killTimer(underWaterTimerCheck) end
        outputChatBox("Você demorou demais, seus clientes desistiram das encomendas.", player, 240, 0, 0, true)
        outputChatBox("Serviço fracassado!", player, 240, 0, 0, true)
    end
    addEventHandler("airdropPackagesQuestTimesEnd", player, onTimesEnd)

    -- CREATE AIRDROP POSITIONS MARKER
    local markerPositions = {}
    for i in string.gmatch(AIRDROP_ROUTES["Los Santos"][1], "([^;]+)") do markerPositions[#markerPositions + 1] = i end 

    -- ON HIT MARKER WITH SAME PLANE THAT STARTED
    local currentMarkerIndex = 1
    local function createNextMarker()
        local x, y, z, rx, ry, rz = markerPositions[currentMarkerIndex]:match("([^,]+),([^,]+),([^,]+),([^,]+),([^,]+),([^,]+)")
        local marker = createMarker(x, y, z, "ring", 14, 240, 240, 0, 255, player)
        setMarkerTarget(marker, rx, ry, rz)
        setElementParent(marker, container)
        local blip = createBlipAttachedTo(marker, 0, 3, 240, 240, 0, 255, 0, 99999, player)
        setElementParent(blip, marker)

        local function handleMarkerHit(hitElement) 
            if(hitElement ~= player) then return end
        
            -- VALIDATION TO USE PLANE TO DO DELIVERIES
            local playerVehicle = getPedOccupiedVehicle(hitElement)
            if (playerVehicle == false or getElementModel(playerVehicle) ~= getElementModel(plane)) then
                outputChatBox("Você precisa estar no seu avião para fazer entregas!", player, 240, 0, 0, true)
                return
            end

            removeEventHandler("onMarkerHit", marker, handleMarkerHit)
            destroyElement(marker)

            -- ANIMATE FALLING BOX
            local dummyVehicle = createVehicle(594, 0, 0, 0)
            local object = createObject(3799, 0, 0, -0.5, 0, 0, 0)
            setObjectScale(object, 0.8)
            attachElements(object, dummyVehicle, 0, 0, -0.5)
            local planeX, planeY, planeZ = getElementPosition(plane)
            local planeVX, planeVY, planeVZ = getElementVelocity(plane)
            spawnVehicle(dummyVehicle, planeX, planeY, planeZ - 5)
            setElementVelocity(dummyVehicle, planeVX, planeVY, planeVZ)
            setTimer(function()
                destroyElement(object)
                destroyElement(dummyVehicle)
            end, 10000, 1)

            currentMarkerIndex = currentMarkerIndex + 1
            if(currentMarkerIndex > #markerPositions) then
                local planeContainer = createElement("planeContainer")
                setElementParent(plane, planeContainer)
                destroyElement(container)

                local totalReward = get("airdrop_packages_quest_reward") + (get("airdrop_packages_quest_reward") * job.currentLevel * get("plane_level_bonus_multiplier"))
                outputChatBox("Todas as entregas foram feitas, seus clientes estão satsfeitos. Serviço concluido! +$"..totalReward, player, 0, 240, 0, true)
                triggerEvent("doneQuest", player, totalReward, job.jobTriggerName)
                triggerClientEvent(player, "toggleMissionTimer", player)
                if(isTimer(underWaterTimerCheck)) then killTimer(underWaterTimerCheck) end

                -- DESTROY PLANE IN n SECONDS
                outputChatBox("Seu avião será devolvido em 30 segundos, pouse em um lugar seguro antes de ser ejetado", player, 240, 0, 0, true)
                setTimer(function() 
                    if(isElement(planeContainer)) then destroyElement(planeContainer) end
                end, 30000, 1)
                return
            end
            createNextMarker()
        end
        addEventHandler("onMarkerHit", marker, handleMarkerHit)
    end
    createNextMarker()

    -- START TIMER
    triggerClientEvent(player, "toggleMissionTimer", player, "Tempo restante ", 300, 60, "airdropPackagesQuestTimesEnd")
end

-- HANDLERS
local function handlePlaneJob(job)
    local questContainerId = get("job_container_prefix")..getAccountID(getPlayerAccount(source));
    local questContainer = getElementByID(questContainerId)

    if(questContainer ~= false) then
        outputChatBox("Você já tem um serviço em andamento. Digite /cancelarServico para cancelar o serviço.", source, 240, 0, 0, true)
        return
    end

    if(questContainer ~= nil and questContainer ~= false) then
        destroyElement(questContainer)
    end
    questContainer = createElement("planeJob", questContainerId)
    
    local quests = {}
    quests[1] = deliveryPackageQuest
    quests[2] = airdropPackagesQuest

    local level = job.currentLevel
    if(level > #quests) then level = #quests end
    local quest = quests[math.random(1, level)]
    quest(questContainer, source, job)

end
addEvent('planeJob', true)
addEventHandler('planeJob', getRootElement(), handlePlaneJob)

local function cancelPlaneJob(player)
    local questContainerId = get("job_container_prefix")..getAccountID(getPlayerAccount(player));
    local questContainer = getElementByID(questContainerId)

    if(questContainer == false) then return end

    triggerClientEvent(player, "toggleMissionTimer", player)
    destroyElement(questContainer)
    outputChatBox("O serviço que estava em andamento foi cancelado com sucesso.", player, 255, 255, 255, true)
end
addCommandHandler("cancelarServico", cancelPlaneJob)

