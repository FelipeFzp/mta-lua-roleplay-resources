local FIRE_SPOTS_BY_ZONE = {}
FIRE_SPOTS_BY_ZONE["Tierra Robada"] = {}
FIRE_SPOTS_BY_ZONE["Bone County"] = {}
FIRE_SPOTS_BY_ZONE["Las Venturas"] = {}
FIRE_SPOTS_BY_ZONE["San Fierro"] = {}
FIRE_SPOTS_BY_ZONE["Red County"] = {
    ROAD_ACCIDENT = { "30,-18,2", "-30, 18, 2" },
    FLORESTAL_ACCIDENT = {},
    HOUSE_ACCIDENT = {}
}
FIRE_SPOTS_BY_ZONE["Whetstone"] = {}
FIRE_SPOTS_BY_ZONE["Flint County"] =  FIRE_SPOTS_BY_ZONE["Whetstone"]
FIRE_SPOTS_BY_ZONE["Los Santos"] = {}
FIRE_SPOTS_BY_ZONE["Unknown"] = FIRE_SPOTS_BY_ZONE["Los Santos"]

-- QUESTS
addEvent("onPedHitByWaterCannon", true)
addEvent("firetruckExtinguishQuestTimesEnd", true)
local function firetruckExtinguishQuest(container, player, job)
    outputChatBox("Utilizando o canhão de água de caminhão de bombeiros apague urgentemente o incêndio indicado no mapa.", player, 255, 255, 255, true)

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
    local accidentPositionsByZoneAndCategory = FIRE_SPOTS_BY_ZONE[zoneName][accidentCategory]
    local targetX, targetY, targetZ = accidentPositionsByZoneAndCategory[math.random(1, #accidentPositionsByZoneAndCategory)]:match("([^,]+),([^,]+),([^,]+)")

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

local function fireExtinguisherQuest(container, player, job)
    -- COPIAR A OUTRA E ALTERAR PARA SER COM EXTINTOR DE INCÊNDIO
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
    -- quests[2] = fireExtinguisherQuest

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