local FIRE_SPOTS_BY_ZONE = {}
FIRE_SPOTS_BY_ZONE["Tierra Robada"] = {}
FIRE_SPOTS_BY_ZONE["Bone County"] = {}
FIRE_SPOTS_BY_ZONE["Las Venturas"] = {}
FIRE_SPOTS_BY_ZONE["San Fierro"] = {}
FIRE_SPOTS_BY_ZONE["Red County"] = {
    ROAD_ACCIDENT_1 = { "30,-18,2", "-30, 18, 2" }
}
FIRE_SPOTS_BY_ZONE["Whetstone"] = {}
FIRE_SPOTS_BY_ZONE["Flint County"] =  FIRE_SPOTS_BY_ZONE["Whetstone"]
FIRE_SPOTS_BY_ZONE["Los Santos"] = {}
FIRE_SPOTS_BY_ZONE["Unknown"] = FIRE_SPOTS_BY_ZONE["Los Santos"]

-- QUESTS
addEvent("onPedHitByWaterCannon", true)
local function xxxxQuest(container, player, job)
    -- Quest 1
    -- LOAD RANDOM ACCIDENT TO accidentContainer
    local accidentContainer = createElement("firefighter_accident"..getAccountID(getPlayerAccount(player)))
    setElementParent(accidentContainer, container)
    local map = xmlLoadFile("firefighter/firefighter_spots_base_map.xml") 
    --TODO: REVER ESSA LÓGICA abaixo PORQUE NÃO PDOE TER IDS REPETIDOS E O MAPA DE LOCALIZAÇÕES ESTÁ SENDO VIA IDS
    local accident = xmlFindChild(map, "marker", math.random(0, (#xmlNodeGetChildren(map) - 1))) 
    --TODO: REVER ESSA LÓGICA acima PORQUE NÃO PDOE TER IDS REPETIDOS E O MAPA DE LOCALIZAÇÕES ESTÁ SENDO VIA IDS
	if (accident) then
		loadMapData(accident, accidentContainer)
		xmlUnloadFile(map)
	end

    --REPLACE PEDS FOR FIRE AND ADD EVENTS LISTENER
    for k, dummyPed in ipairs(getElementsByType("ped", accidentContainer)) do 
        setElementAlpha(dummyPed, 0)
        setElementFrozen(dummyPed, true)
        local dummyPedFireTimer = setTimer(function() setPedOnFire(dummyPed, true) end, 2000, 0)
        addEventHandler("onElementDestroy", dummyPed, function() if isTimer(dummyPedFireTimer) then killTimer(dummyPedFireTimer) end end)
        
        local function handlePedHitByWaterCannon()
            removeEventHandler("onPedHitByWaterCannon", dummyPed, handlePedHitByWaterCannon)
            if isElement(dummyPed) then destroyElement(dummyPed) end
            if isTimer(dummyPedFireTimer) then killTimer(dummyPedFireTimer) end

            outputChatBox("Ped fire extinguished")
        end
        addEventHandler("onPedHitByWaterCannon", dummyPed, handlePedHitByWaterCannon)
        triggerClientEvent(player, "listenPedHitByWaterCannon", player, dummyPed)
    end

    --GET ACCIDENT RANDOM POSITION BY ACCIDENT ID
    local mainElement = getElementsByType("marker", accidentContainer)[1]
    local px, py, pz = getElementPosition(player)
    local zoneName = getZoneName(px, py, pz, true)

    local accidentPositionsByZoneAndType = FIRE_SPOTS_BY_ZONE[zoneName][getElementID(mainElement)]
    local targetX, targetY, targetZ = accidentPositionsByZoneAndType[math.random(1, #accidentPositionsByZoneAndType)]:match("([^,]+),([^,]+),([^,]+)")

    --MOVE ELEMENTS TO TARGET POSITION
    local mainElementX, mainElementY, mainElementZ = getElementPosition(mainElement)
    for k, element in ipairs(getElementChildren(mainElement)) do
        setElementParent(element, accidentContainer)
        local elementX, elementY, elementZ = getElementPosition(element)
        local offsetX, offsetY, offsetZ = elementX - mainElementX, elementY - mainElementY, elementZ - mainElementZ

        setElementPosition(element, targetX + offsetX, targetY + offsetY, targetZ + offsetZ)
        setTimer(function() setElementFrozen(element, true) end, 1000, 1)
    end
    setElementAlpha(mainElement, 0)

end

local function yyyyQuest(container, player, job)
    -- Quest 2
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
    quests[1] = xxxxQuest
    quests[2] = yyyyQuest

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
addCommandHandler("cancelarServico", cancelFirefighterJob)