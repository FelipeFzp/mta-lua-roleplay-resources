-- ROAD_ACCIDENT = { "30,-18,2", "-30, 18, 2" },
-- FLORESTAL_ACCIDENT = { "30,-18,2", "-30, 18, 2" },
-- HOUSE_ACCIDENT = {} --THIS USE THE SELF OBJECT POSITIONS, DON'T HAVE SPECIFIC TARGET LOCATION

local FIRE_SPOTS_BY_ZONE = {}
FIRE_SPOTS_BY_ZONE["Tierra Robada"] = {
    ROAD_ACCIDENT = {},
    FLORESTAL_ACCIDENT = {},
    HOUSE_ACCIDENT = {} --THIS USE THE SELF OBJECT POSITIONS, DON'T HAVE SPECIFIC TARGET LOCATION
}
FIRE_SPOTS_BY_ZONE["Bone County"] = {
    ROAD_ACCIDENT = {},
    FLORESTAL_ACCIDENT = {},
    HOUSE_ACCIDENT = {} --THIS USE THE SELF OBJECT POSITIONS, DON'T HAVE SPECIFIC TARGET LOCATION
}
FIRE_SPOTS_BY_ZONE["Las Venturas"] = {
    ROAD_ACCIDENT = {
        "1806.4013671875,843.8974609375,9.6328125",
        "2289.0869140625,926.7236328125,9.9519739151001",
        "2525.1455078125,1073.2255859375,10.02433013916",
        "2366.8076171875,1526.6953125,9.809440612793",
        "2052.59765625,1710.509765625,9.671875",
        "2255.7158203125,2143.9609375,9.9609375",
        "2217.083984375,2453.1767578125,9.671875",
        "1727.9951171875,2274.08203125,10.072297096252",
        "1310.02734375,1868.4306640625,9.5195741653442",
        "1018.8701171875,1190.8271484375,9.7048196792603",
        "1177.259765625,1377.955078125,9.8125076293945",
        "2087.7353515625,1661.419921875,9.8203125",
        "2190.041015625,2345.650390625,9.671875",
        "2010.9990234375,2409.5712890625,9.8203125",
        "1657.2685546875,1796.8359375,9.8203125",
        "1661.9130859375,937.3154296875,9.671875",
        "1218.1982421875,1131.193359375,5.78125",
        "2796.3076171875,1473.154296875,10.065844535828",
        "1006.1552734375,1594.677734375,9.671875",
        "1007.91796875,2067.0791015625,9.671875",
        "1162.515625,1834.1435546875,9.7066564559937",
        "1381.4482421875,1935.9091796875,9.8203125"
    }
}
FIRE_SPOTS_BY_ZONE["San Fierro"] = {
    ROAD_ACCIDENT = {
        "-2006.7021484375,232.9287109375,27.526395797729",
        "-1938.955078125,-63.1689453125,24.5546875",
        "-2041.052734375,-344.7333984375,34.3046875",
        "-1873.0185546875,-579.84375,23.262964248657",
        "-1815.384765625,-959.8232421875,47.29105758667",
        "-2132.1669921875,-1053.46484375,29.880151748657",
        "-2354.916015625,-764.5087890625,95.727798461914",
        "-2701.359375,-208.314453125,3.1796875",
        "-2666.291015625,221.392578125,3.1796875",
        "-2414.4150390625,283.703125,33.994827270508",
        "-2261.033203125,733.0126953125,48.296875",
        "-1886.7177734375,1178.248046875,44.296875",
        "-1883.9013671875,926.8662109375,34.015625",
        "-1560.3017578125,727.9482421875,6.0320682525635",
        "-1691.052734375,374.6806640625,6.0390453338623",
        "-2401.0361328125,693.0869140625,34.171875",
        "-2611.115234375,906.802734375,63.828125",
        "-2263.1513671875,1183.2421875,54.578125",
        "-2143.7529296875,1094.330078125,78.846694946289",
        "-1856.4775390625,1375.849609375,6.0390625",
        "-1574.43359375,933.498046875,6.2310333251953",
        "-2589.3681640625,1143.51953125,54.4296875",
    },
}
FIRE_SPOTS_BY_ZONE["Red County"] = {

    ROAD_ACCIDENT = { "30,-18,2", "-30, 18, 2" },
    FLORESTAL_ACCIDENT = { "30,-18,2", "-30, 18, 2" },
    HOUSE_ACCIDENT = {} --THIS USE THE SELF OBJECT POSITIONS, DON'T HAVE SPECIFIC TARGET LOCATION
}
FIRE_SPOTS_BY_ZONE["Whetstone"] = {}
FIRE_SPOTS_BY_ZONE["Flint County"] =  FIRE_SPOTS_BY_ZONE["Whetstone"]
FIRE_SPOTS_BY_ZONE["Los Santos"] = {
    ROAD_ACCIDENT = {
        "2127.71875,-1523.11328125,1.1410527229309",
        "1657.046875,-937.783203125,61.475219726562",
        "1361.828125,-1036.126953125,25.140625",
        "943.8623046875,-1144.6455078125,22.801322937012",
        "1031.046875,-1400.5576171875,12.204943656921",
        "1241.7255859375,-1366.14453125,12.357081413269",
        "1604.056640625,-1431.0224609375,12.3828125",
        "1726.783203125,-1275.470703125,12.543994903564",
        "1957.0771484375,-1018.580078125,32.67809677124",
        "2561.1171875,-1054.2333984375,68.406517028809",
        "2854.4306640625,-1065.8876953125,22.465835571289",
        "2915.7705078125,-1449.4521484375,9.875",
        "2780.6689453125,-1999.537109375,12.288361549377",
        "2415.177734375,-2089.197265625,12.436618804932",
        "2324.181640625,-1975.25390625,12.340631484985",
        "1960.28125,-1950.970703125,12.748794555664",
        "1570.38671875,-2289.4765625,-3.9921875",
        "1050.044921875,-2044.3818359375,11.972663879395",
        "737.40234375,-1674.2080078125,9.4935894012451",
        "327.2333984375,-1566.0537109375,32.101833343506",
        "630.693359375,-1385.04296875,12.552772521973",
        "636.06640625,-1219.0458984375,17.109375"
    },
    FLORESTAL_ACCIDENT = {},
    HOUSE_ACCIDENT = {} --THIS USE THE SELF OBJECT POSITIONS, DON'T HAVE SPECIFIC TARGET LOCATION
}
FIRE_SPOTS_BY_ZONE["Unknown"] = FIRE_SPOTS_BY_ZONE["Los Santos"]

-- QUESTS
addEvent("onPedHitByWaterCannon", true)
addEvent("firetruckExtinguishQuestTimesEnd", true)
local function firetruckExtinguishQuest(container, player, job)
    outputChatBox("[Missão] Utilizando um #FF0000caminhão de bombeiros#FFFF00 apague urgentemente o incêndio indicado no mapa.", player, 255, 255, 0, true)
    outputChatBox("Dica: Utilize o menu de emprego pressionando X para solicitar um caminhão de bombeiros.", player, 255, 255, 255, true)

    -- LOAD RANDOM ACCIDENT SCENARIO
    local accidentContainer = createElement("firefighter_accident"..getAccountID(getPlayerAccount(player)))
    setElementParent(accidentContainer, container)
    local map = xmlLoadFile("firefighter/firefighter_spots_base_map.xml") 
    local accident = xmlFindChild(map, "marker", math.random(0, (#xmlNodeGetChildren(map) - 1))) 
    local accidentCategory = xmlNodeGetAttribute(accident, "category")
    if not accidentCategory then 
        accidentCategory = "ROAD_ACCIDENT"
        outputServerLog("Accident with missing category, assigning default category: "..accidentCategory)
    end
	if (accident) then
		loadMapData(accident, accidentContainer)
		xmlUnloadFile(map)
	end

    --GET NEAR ACCIDENT BY CATEGORY
    local mainElement = getElementsByType("marker", accidentContainer)[1]
    local px, py, pz = getElementPosition(player)
    local zoneName = getZoneName(px, py, pz, true)
    local accidentPositionsByZoneAndCategory = FIRE_SPOTS_BY_ZONE[zoneName][accidentCategory] --TODO: tratar para caso não tiver coordenadas mantem as originais
    local targetX, targetY, targetZ = accidentPositionsByZoneAndCategory[math.random(1, #accidentPositionsByZoneAndCategory)]:match("([^,]+),([^,]+),([^,]+)")

    --CREATE BLIP ON ACCIDENT AND SET ELEMENT PARENT
    local blip = createBlip(targetX, targetY, targetZ, 0, 3, 255, 0, 0, 255, 0, 99999, player)
    setElementParent(blip, accidentContainer)
    
    --MOVE ELEMENTS TO TARGET POSITION
    local mainElementX, mainElementY, mainElementZ = getElementPosition(mainElement)
    for k, element in ipairs(getElementChildren(mainElement)) do
        setElementParent(element, accidentContainer)
        local elementX, elementY, elementZ = getElementPosition(element)
        local offsetX, offsetY, offsetZ = elementX - mainElementX, elementY - mainElementY, elementZ - mainElementZ

        setElementPosition(element, targetX + offsetX, targetY + offsetY, targetZ + offsetZ)
        setTimer(function() setElementFrozen(element, true) end, 2000, 1)
    end
    setElementAlpha(mainElement, 0)

    -- LISTEN FOR ALL FIRES EXTINGUISHED
    local function handleAllFiresExtinguished()
        triggerClientEvent(player, "fadeScreen", player, 1.5)
        destroyElement(container)
        outputChatBox("Você controlou o incêndio e evitou danos maiores.", player, 0, 240, 0, true)
        local totalReward = get("firetruck_extinguish_quest_reward") + (get("firetruck_extinguish_quest_reward") * job.currentLevel * get("firefighter_level_bonus_multiplier"))
        outputChatBox("Serviço concluido! +$"..totalReward, player, 0, 240, 0, true)
        triggerEvent("doneQuest", player, totalReward, job.jobTriggerName)
        triggerClientEvent(player, "toggleMissionTimer", player)
    end

    --ADD FIRE PEDS EVENTS LISTENER
    local extinguishedFiresCount = 0
    local function addPedHitByWaterHandler(dummyPed, totalFiresCount)
        local dummyPedFireTimer = setTimer(function() setPedOnFire(dummyPed, true) end, 2000, 0)
        addEventHandler("onElementDestroy", dummyPed, function() if isTimer(dummyPedFireTimer) then killTimer(dummyPedFireTimer) end end)

        addEventHandler("onPedHitByWaterCannon", dummyPed, function()
            if isElement(dummyPed) then destroyElement(dummyPed) end
            if isTimer(dummyPedFireTimer) then killTimer(dummyPedFireTimer) end

            extinguishedFiresCount = extinguishedFiresCount + 1
            if(extinguishedFiresCount == totalFiresCount) then
                handleAllFiresExtinguished()
            end
        end)
        triggerClientEvent(player, "listenPedHitByWaterCannon", player, dummyPed)
    end

    --REPLACE PEDS WITH MODELID 0 TO FIRE 
    local elementsToReplace = getElementsByType("ped", accidentContainer)
    for k, dummyPed in ipairs(elementsToReplace) do 
        if getElementModel(dummyPed) == 0 then 
            setElementAlpha(dummyPed, 0)
            setElementFrozen(dummyPed, true)
            
            addPedHitByWaterHandler(dummyPed, #elementsToReplace)
        end
    end

    -- LISTEN FOR TIMER
    triggerClientEvent(player, "toggleMissionTimer", player, "Tempo restante ", 300, 60, "firetruckExtinguishQuestTimesEnd")
    local function onTimesEnd()
        removeEventHandler("firetruckExtinguishQuestTimesEnd", player, onTimesEnd)
        outputChatBox("Você demorou demais, o incêndio causou mais danos do que o esperado.", player, 240, 0, 0, true)
        outputChatBox("Serviço fracassado!", player, 240, 0, 0, true)
        destroyElement(container)
    end
    addEventHandler("firetruckExtinguishQuestTimesEnd", player, onTimesEnd)
end

addEvent("onPedHitByFireExtinguisher", true)
addEvent("fireExtinguisherQuestTimesEnd", true)
local function fireExtinguisherQuest(container, player, job)
    outputChatBox("[Missão] Utilizando o #FF0000exintor de incêndio#FFFF00 apague urgentemente o incêndio indicado no mapa.", player, 255, 255, 0, true)

    --GIVE PLAYER WEAPON
    local playerWeaponId = getPedWeapon(player, 9)
    if(playerWeaponId ~= getWeaponIDFromName("fire extinguisher") or playerWeaponId == getWeaponIDFromName("fire extinguisher") and getPedTotalAmmo(player, 9) < 1000) then
        giveWeapon(player, getWeaponIDFromName("fire extinguisher"), 1000 - getPedTotalAmmo(player, 9), true)
    end

    -- LOAD RANDOM ACCIDENT SCENARIO
    local accidentContainer = createElement("firefighter_accident"..getAccountID(getPlayerAccount(player)))
    setElementParent(accidentContainer, container)
    local map = xmlLoadFile("firefighter/firefighter_spots_base_map.xml") 
    local accident = xmlFindChild(map, "marker", math.random(0, (#xmlNodeGetChildren(map) - 1))) 
    local accidentCategory = xmlNodeGetAttribute(accident, "category")
    if not accidentCategory then 
        accidentCategory = "ROAD_ACCIDENT"
        outputServerLog("Accident with missing category, assigning default category: "..accidentCategory)
    end
	if (accident) then
		loadMapData(accident, accidentContainer)
		xmlUnloadFile(map)
	end

    --GET NEAR ACCIDENT BY CATEGORY
    local mainElement = getElementsByType("marker", accidentContainer)[1]
    local px, py, pz = getElementPosition(player)
    local zoneName = getZoneName(px, py, pz, true)
    local accidentPositionsByZoneAndCategory = FIRE_SPOTS_BY_ZONE[zoneName][accidentCategory] --TODO: tratar para caso não tiver coordenadas mantem as originais
    local targetX, targetY, targetZ = accidentPositionsByZoneAndCategory[math.random(1, #accidentPositionsByZoneAndCategory)]:match("([^,]+),([^,]+),([^,]+)")

    --CREATE BLIP ON ACCIDENT AND SET ELEMENT PARENT
    local blip = createBlip(targetX, targetY, targetZ, 0, 3, 255, 0, 0, 255, 0, 99999, player)
    setElementParent(blip, accidentContainer)

    --MOVE ELEMENTS TO TARGET POSITION
    local mainElementX, mainElementY, mainElementZ = getElementPosition(mainElement)
    for k, element in ipairs(getElementChildren(mainElement)) do
        setElementParent(element, accidentContainer)
        local elementX, elementY, elementZ = getElementPosition(element)
        local offsetX, offsetY, offsetZ = elementX - mainElementX, elementY - mainElementY, elementZ - mainElementZ

        setElementPosition(element, targetX + offsetX, targetY + offsetY, targetZ + offsetZ)
        setTimer(function() setElementFrozen(element, true) end, 2000, 1)
    end
    setElementAlpha(mainElement, 0)

    -- LISTEN FOR ALL FIRES EXTINGUISHED
    local function handleAllFiresExtinguished()
        triggerClientEvent(player, "fadeScreen", player, 1.5)
        destroyElement(container)
        outputChatBox("Você controlou o incêndio e evitou danos maiores.", player, 0, 240, 0, true)
        local totalReward = get("extinguisher_extinguish_quest_reward") + (get("extinguisher_extinguish_quest_reward") * job.currentLevel * get("firefighter_level_bonus_multiplier"))
        outputChatBox("Serviço concluido! +$"..totalReward, player, 0, 240, 0, true)
        triggerEvent("doneQuest", player, totalReward, job.jobTriggerName)
        triggerClientEvent(player, "toggleMissionTimer", player)
    end

    --ADD FIRE PEDS EVENTS LISTENER
    local extinguishedFiresCount = 0
    local function addPedHitByExtinguisherHandler(dummyPed, totalFiresCount)
        local dummyPedFireTimer = setTimer(function() setPedOnFire(dummyPed, true) end, 2000, 0)
        addEventHandler("onElementDestroy", dummyPed, function() if isTimer(dummyPedFireTimer) then killTimer(dummyPedFireTimer) end end)

        addEventHandler("onPedHitByFireExtinguisher", dummyPed, function()
            if isElement(dummyPed) then destroyElement(dummyPed) end
            if isTimer(dummyPedFireTimer) then killTimer(dummyPedFireTimer) end

            extinguishedFiresCount = extinguishedFiresCount + 1
            if(extinguishedFiresCount == totalFiresCount) then
                handleAllFiresExtinguished()
            end
        end)
        triggerClientEvent(player, "listenPedHitByFireExtinguisher", player, dummyPed)
    end

    --REPLACE PEDS WITH MODELID 0 TO FIRE 
    local elementsToReplace = getElementsByType("ped", accidentContainer)
    for k, dummyPed in ipairs(elementsToReplace) do 
        if getElementModel(dummyPed) == 0 then 
            setElementAlpha(dummyPed, 0)
            setElementFrozen(dummyPed, true)
            
            addPedHitByExtinguisherHandler(dummyPed, #elementsToReplace)
        end
    end

    -- LISTEN FOR TIMER
    triggerClientEvent(player, "toggleMissionTimer", player, "Tempo restante ", 300, 60, "fireExtinguisherQuestTimesEnd")
    local function onTimesEnd()
        removeEventHandler("fireExtinguisherQuestTimesEnd", player, onTimesEnd)
        outputChatBox("Você demorou demais, o incêndio causou mais danos do que o esperado.", player, 240, 0, 0, true)
        outputChatBox("Serviço fracassado!", player, 240, 0, 0, true)
        destroyElement(container)
    end
    addEventHandler("fireExtinguisherQuestTimesEnd", player, onTimesEnd)
end

-- HANDLERS
local function handleFirefighterJob(job)
    local questContainerId = get("job_container_prefix")..getAccountID(getPlayerAccount(source));
    local questContainer = getElementByID(questContainerId)

    if(questContainer ~= false) then
        outputChatBox("Você já tem um serviço em andamento. Digite /cancelarServico para cancelar o serviço.", source, 240, 0, 0, true)
        return
    end

    if(questContainer ~= nil and questContainer ~= false) then
        destroyElement(questContainer)
    end
    questContainer = createElement("firefighterJob", questContainerId)
    local quests = {}
    quests[1] = firetruckExtinguishQuest
    quests[2] = fireExtinguisherQuest

    local level = job.currentLevel
    if(level > #quests) then level = #quests end
    local quest = quests[math.random(1, level)]

    quest(questContainer, source, job)
end
addEvent('firefighterJob', true)
addEventHandler('firefighterJob', getRootElement(), handleFirefighterJob)

local function cancelFirefighterJob(player)
    local questContainerId = get("job_container_prefix")..getAccountID(getPlayerAccount(player));
    local questContainer = getElementByID(questContainerId)

    if(questContainer == false) then return end

    triggerClientEvent(player, "toggleMissionTimer", player)
    destroyElement(questContainer)
    outputChatBox("O serviço que estava em andamento foi cancelado com sucesso.", player, 255, 255, 255, true)
end
addCommandHandler("cancelarServico", cancelFirefighterJob, false, false)


addCommandHandler("putScenario", function(player, command, categoryId)
    
    local containerId = getAccountID(getPlayerAccount(player))..categoryId
    local container = getElementByID(containerId)
    if isElement(container) then 
        destroyElement(container)
        return
    end

    --LOAD MAP
    local map = xmlLoadFile("firefighter/firefighter_spots_base_map.xml") 
    local accidents = xmlNodeGetChildren(map) 

    local accident = nil
    for k, el in ipairs(accidents) do
        if(xmlNodeGetAttribute(el, "category") == categoryId) then
            accident = el
            break
        end
    end
    
    local container = createElement("accidentContainer", containerId)
	if (accident) then
		loadMapData(accident, container)
		xmlUnloadFile(map)
    else
        outputChatBox("Não foi possível encontrar elementos na categoria "..categoryId, player, 240, 0, 0, true)
	end

    --REPLACE PEDS WITH MODELID 0 TO FIRE 
    local elementsToReplace = getElementsByType("ped", container)
    for k, dummyPed in ipairs(elementsToReplace) do 
        if getElementModel(dummyPed) == 0 then 
            setElementAlpha(dummyPed, 0)
            setElementFrozen(dummyPed, true)
            local dummyPedFireTimer = setTimer(function() setPedOnFire(dummyPed, true) end, 2000, 0)
            addEventHandler("onElementDestroy", dummyPed, function() if isTimer(dummyPedFireTimer) then killTimer(dummyPedFireTimer) end end)
        end
    end

    --MOVE ELEMENTS TO TARGET POSITION
    local mainElement = getElementsByType("marker", container)[1]
    local targetX, targetY, targetZ = getElementPosition(player)
    
    targetZ = targetZ - 1
    local mainElementX, mainElementY, mainElementZ = getElementPosition(mainElement)
    for k, element in ipairs(getElementChildren(mainElement)) do
        setElementParent(element, container)
        local elementX, elementY, elementZ = getElementPosition(element)
        local offsetX, offsetY, offsetZ = elementX - mainElementX, elementY - mainElementY, elementZ - mainElementZ

        setElementPosition(element, targetX + offsetX, targetY + offsetY, targetZ + offsetZ)
        setTimer(function() setElementFrozen(element, true) end, 2000, 1)
    end
    
    local instruction = "["..getZoneName(targetX, targetY, targetZ, true).."]:"..categoryId.." - "..targetX..","..targetY..","..targetZ
    triggerClientEvent(player, "copyToClipboard", player, instruction)

    setElementPosition(player, targetX + 5, targetY + 5, targetZ + 2)
end, false, false)