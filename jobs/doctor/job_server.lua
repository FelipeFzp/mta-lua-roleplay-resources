-- PATIENT ANIMATIONS
local PED_ANIMATIONS = {
    "FOOD,EAT_Vomit_P",
    "FAT,IDLE_tired"
}

-- HOSPITAL TO FINISH QUESTS
local HOSPITALS_BY_ZONE = {}
HOSPITALS_BY_ZONE["Tierra Robada"] = { "-1515,2529.2,54.7" }
HOSPITALS_BY_ZONE["Bone County"] = { "-336.70001,1055.4,18.8", "-295.39999,1049.2,18.8" }
HOSPITALS_BY_ZONE["Las Venturas"] = { "1606.9,1828.1,9.8", "2506.3,1209.1,9.8" }
HOSPITALS_BY_ZONE["San Fierro"] = { "-2679.5,624.29999,13.4", "-2592.3,586,13.4", "-1555.2,1111.4,6.1" }
HOSPITALS_BY_ZONE["Red County"] = { "1223.7,302.89999,18.5" }
HOSPITALS_BY_ZONE["Whetstone"] = { "-2194.3999,-2293.8999,29.6" }
HOSPITALS_BY_ZONE["Flint County"] = HOSPITALS_BY_ZONE["Whetstone"]
HOSPITALS_BY_ZONE["Los Santos"] = { "2000.8,-1447.1,12.5","1179,-1308.8,12.7" }
HOSPITALS_BY_ZONE["Unknown"] = HOSPITALS_BY_ZONE["Los Santos"]

-- PATIENT SPAWNS
local PED_SPAWNS_BY_ZONE = {}
PED_SPAWNS_BY_ZONE["Los Santos"] = { "381.39999,-2026.3,7.8", "1480.6,-1616.5,14", "1246.2,-2048.6001,60", "810.09998,-1883.2,3.3", "2484.3,-1688.4,13.5", "1513,-2298.3999,-2.7", "2134.6001,-1729.4,13.5", "2782.3,-2019.8,13.6", "2649.8999,-2018.2,13.6", "2555.8,-960.09998,82.7", "1090.5,-1381.6,13.8", "2423.3,-1223.2,25.3", "680,-1223.7,16", "2290.2,-1528,26.9", "363.5,-2030.8,7.8", "2115.7,-1625.5,13.6", "2050.7,-1781.1,13.5", "825.20001,-1868.9,12.9", "1940.1,-2087,13.6", "1689.2,-2101.3,13.8", "1722.3,-1608.6,13.5", "2744.3999,-1091.9,69.6", "1362.5,-1719.5,8.6", "2957.5,-1459.5,10.8", "857,-1520.9,13.5", "758.20001,-1358,13.5", "1409.4,-846.09998,46.8", "479.5,-1530.5,19.8", "336.79999,-1340.9,14.5", "472.10001,-1164.7,65.8", "907.59998,-1110.3,24.2", "1124.1,-1096.5,25.3", "1660.4,-1062.5,23.9", "2230.8,-1178.7,25.7" }
PED_SPAWNS_BY_ZONE["San Fierro"] = { "-1704,1339.5,7.2", "-2567.3999,1398.2,7.2", "-2039.1,-98.1,35.2", "-1694.4,22.4,3.6", "-2697,1649.4,66.6", "-1870.5,-216.7,18.4", "-2788.3,-288.89999,7.2", "-1896.3,-867.09998,32", "-1974.3,-863.70001,32.2", "-2719.7,-32.5,4.3", "-2706.3999,382.79999,4.4", "-1421.1,-291.20001,14.1", "-2650.3999,1173.4,35.2", "-2528.3999,1221.4,37.4", "-2129.1001,799,69.6", "-2645.3999,1370.7,7.2", "-2487.1001,363.10001,35.1", "-2442,749.70001,35.2", "-1983.1,142.60001,27.7", "-2288.8,721.90002,49.4", "-2149.1001,-431.39999,35.3", "-2064.5,955,59.6", "-1676,-754,41.5", "-1774.8,1308,62.5", "-1940.1,1272,8.4", "-1924.1,881.70001,35.3", "-1529.7,481.5,7.2", "-1685.6,409.20001,7.4", "-1897.8,352,26.6", "-2063.5,243.89999,35.6", "-2197.7,986.20001,80", "-2143,1223,47.3", "-2357.8999,1005.7,50.9", "-2418.8999,983.79999,45.3", "-1832.4,1040.2,46.1" }
PED_SPAWNS_BY_ZONE["Las Venturas"] = { "2620.2,720.20001,10.8", "2363.3,1216.4,7.2", "2490.3,917.5,11", "2633.3999,1851.9,10.8", "2481.3999,1874.6,10.3", "2035.6,1558.7,10.8", "2458.7,2019.3,11.1", "2306.3999,2349.8,10.8", "1334.4,2060.5,10.8", "2091.5,2078.8999,10.8", "2222.5,2522.5,10.8", "1907.5,1464.8,10.8", "2359.3999,1665.4,11", "1851.5,1524.2,10.8", "1569.9,1364.7,10.9", "1088.1,1073.6,10.8", "2014.5,1242.2,10.8", "1104.7,1704.7,10.8", "2162.3999,1125.2,13.7", "1106.5,2122.8,10.8", "1306.4,2098.1001,11", "2698.3,856.79999,9.8", "2538,745.5,10.8", "1994.2,2241.8999,25.8", "2138,2293.8999,11.7", "2369.5,2165.5,10.8", "1396.3,2385.5,10.8", "2380.8,2005.5,10.8", "1681.9,1452.5,10.8", "2223.6001,1818.5,10.8", "2511.8,1565.9,10.8", "2215.5,1870.8,10.8", "2394.8999,987.29999,10.8", "1953.1,1353.6,9.3", "2074.1001,1948.3,11.7" }
PED_SPAWNS_BY_ZONE["Whetstone"] = { "-2097.8,-2505.6001,30.5", "-2139.1001,-2316.7,88.3", "-2505.6001,-2325.3999,17.8", "-1977.6,-1593.3,87.7", "-1569.2,-2733.5,48.5", "-1645.6,-2233.8,29.6", "-1891.3,-1702.4,21.8", "-2804.7,-1528.7,139.3", "-1179.1,-2644.3999,11.8", "-2792.7,-2512,3", "-2883.8,-1964.3,37.6" }
PED_SPAWNS_BY_ZONE["Red County"] = { "876.29999,-27.8,63.2", "2411.8,54.3,27", "1579.9,258.60001,15.7", "2157.3,-98.6,2.8", "2255.2,-82.5,26.5", "2169.3999,83.5,26.9", "1432.8,373.20001,18.9", "1067,-290.20001,74", "1925.4,171.10001,37.3", "751.20001,275.10001,27.3", "1031.7,-78.8,24.1" }
PED_SPAWNS_BY_ZONE["Tierra Robada"] = { "-1296.5,2493.8999,87", "-2248.1001,2356.3,5", "-1939.2,2380.7,49.5", "-1454,1872.9,32.6", "-2484.8,2404.3999,16.2", "-1210.4,1833.6,41.9", "-1659.8,2552.3999,85.3", "-749,1588.5,27", "-1317.8,2692.1001,50.1", "-546.20001,2593.6001,53.5", "-1820.6,2043.3,8.6" }
PED_SPAWNS_BY_ZONE["Bone County"] = { "-323.29999,1531.3,75.4", "-327.60001,2223.6001,43.2", "601.59998,868.40002,-43", "-734.09998,2042.8,60.4", "-306,1761.6,42.8", "540.5,1555.2,1", "256.29999,1403.4,10.7", "-238.7,2649.6001,62.8", "81.6,1164.5,18.7", "216.8,1683.1,21.4", "414.20001,2529.8999,16.6", "-90.1,1520.1,15.7", "-813.09998,2761.8,45.9", "-25.5,1357.3,9.2" }
PED_SPAWNS_BY_ZONE["Unknown"] = PED_SPAWNS_BY_ZONE["Los Santos"]

-- QUESTS
addEvent("healPatientQuestFinish", true)
addEvent("healPatientQuestTimesEnd", true)
local function healPatientQuest(container, player, job)
    outputChatBox("[Missão] Vá até o ponto vermelho indicado no mapa e utilize o #FF0000spray de medicamento#FFFF00 no paciente", player, 255, 255, 0, true)

    -- GIVE QUEST WEAPON
    local playerWeaponId = getPedWeapon(player, 9)
    if(playerWeaponId ~= getWeaponIDFromName("spraycan") or playerWeaponId == getWeaponIDFromName("spraycan") and getPedTotalAmmo(player, 9) < 200) then
        giveWeapon(player, getWeaponIDFromName("spraycan"), 200 - getPedTotalAmmo(player, 9), true)
    end

    -- SPAWN PED WITH BLIP AND MARKER
    local playerX, playerY, playerZ = getElementPosition(player)
    local zonePedSpawns = PED_SPAWNS_BY_ZONE[getZoneName(playerX, playerY, playerZ, true)]
    local x, y, z = zonePedSpawns[math.random(1, #zonePedSpawns)]:match("([^,]+),([^,]+),([^,]+)")
    
    local ped = createPed(math.random(0, 311), x, y, z)
    setElementParent(ped, container)

    local animBlock, animName = PED_ANIMATIONS[math.random(1, #PED_ANIMATIONS)]:match("([^,]+),([^,]+)")
    setPedAnimation(ped, animBlock, animName, 1, true, false, false)

    local pedBlip = createBlipAttachedTo(ped, 0, 3, 240, 0, 0, 255, 0, 99999, player)
    setElementParent(pedBlip, ped)
        
    -- LISTEN FOR PED WASTED
    addEventHandler("onPedWasted", ped, function(ammo, killer) 
        if(killer == player) then 
            outputChatBox("Você é um médico, não um assasino!", player, 240, 0, 0, true)
            outputChatBox("Punição recebida por não exercer a profissão. -$"..get("heal_patient_quest_reward"), player, 240, 0, 0, true)
            takePlayerMoney(player, get("heal_patient_quest_reward"))
        else
            if(killer ~= nil and getElementType(killer) == "player") then
                outputChatBox("Seu paciente foi morto pelo jogador "..getPlayerName(killer)..".", player, 240, 0, 0, true)
            end
        end

        outputChatBox("Seu paciente não suportou. Serviço fracassado!", player, 240, 0, 0, true)
        triggerClientEvent(player, "toggleMissionTimer", player)
        destroyElement(container)
    end)

    -- LISTEN FOR HEAL PED
    triggerClientEvent(player, "listenHealPatientQuestFinish", player, ped)
    local function onFinish()
        destroyElement(container)
        outputChatBox("Seu paciente está se sentindo melhor.", player, 0, 240, 0, true)
        local totalReward = get("heal_patient_quest_reward") + (get("heal_patient_quest_reward") * job.currentLevel * get("doctor_level_bonus_multiplier"))
        outputChatBox("Serviço concluido! +$"..totalReward, player, 0, 240, 0, true)
        triggerEvent("doneQuest", player, totalReward, job.jobTriggerName)
        removeEventHandler("healPatientQuestFinish", player, onFinish)
        triggerClientEvent(player, "toggleMissionTimer", player)
    end
    addEventHandler("healPatientQuestFinish", player, onFinish)

    -- LISTEN FOR TIMER
    triggerClientEvent(player, "toggleMissionTimer", player, "Tempo restante ", 300, 60, "healPatientQuestTimesEnd")
    local function onTimesEnd()
        removeEventHandler("healPatientQuestTimesEnd", player, onTimesEnd)
        outputChatBox("Você demorou demais, seu paciente não suportou.", player, 240, 0, 0, true)
        outputChatBox("Serviço fracassado!", player, 240, 0, 0, true)
        destroyElement(container)
    end
    addEventHandler("healPatientQuestTimesEnd", player, onTimesEnd)
end

addEvent("rescuePatientQuestPedEnterVehicle", true)
addEvent("rescuePatientQuestTimesEnd", true)
local function rescuePatientQuest(container, player, job)
    outputChatBox("[Missão] Utilizando uma #FF0000ambulância#FFFF00, busque o paciente indicado no mapa e leve-o para o hospital", player, 255, 255, 0, true)
    outputChatBox("Dica: Utilize o menu de emprego pressionando X para solicitar uma ambulância.", player, 255, 255, 255, true)

    -- SPAWN PED WITH BLIP AND MARKER
    local playerX, playerY, playerZ = getElementPosition(player)
    local zonePedSpawns = PED_SPAWNS_BY_ZONE[getZoneName(playerX, playerY, playerZ, true)]
    local x, y, z = zonePedSpawns[math.random(1, #zonePedSpawns)]:match("([^,]+),([^,]+),([^,]+)")
    
    local ped = createPed(math.random(0, 311), x, y, z)
    setElementParent(ped, container)

    local animBlock, animName = PED_ANIMATIONS[math.random(1, #PED_ANIMATIONS)]:match("([^,]+),([^,]+)")
    setPedAnimation(ped, animBlock, animName, -1, true)

    local pedBlip = createBlipAttachedTo(ped, 0, 3, 240, 0, 0, 255, 0, 99999, player)
    setElementParent(pedBlip, ped)

    local rescueMarker = createMarker(x, y, z, "cylinder", 5, 0, 0, 0, 0, player)
    setElementParent(rescueMarker, ped)

    -- LISTEN FOR PED WASTED
    addEventHandler("onPedWasted", ped, function(ammo, killer) 
        if(killer == player) then 
            outputChatBox("Você é um médico, não um assasino!", player, 240, 0, 0, true)
            outputChatBox("Punição recebida por não exercer a profissão. -$"..get("rescue_patient_quest_reward"), player, 240, 0, 0, true)
            takePlayerMoney(player, get("rescue_patient_quest_reward"))
        else
            if(killer ~= nil and killer ~= false and getElementType(killer) == "player") then
                outputChatBox("Seu paciente foi morto pelo jogador "..getPlayerName(killer)..".", player, 240, 0, 0, true)
            end
        end

        destroyElement(container)
        triggerClientEvent(player, "toggleMissionTimer", player)
        outputChatBox("Seu paciente não suportou. Serviço fracassado!", player, 240, 0, 0, true)
    end)

    -- LISTEN FOR TRIGGER MARKER NEAR PED
    local hospitalMarker;
    addEventHandler("onMarkerHit", rescueMarker, 
    function(hitElement) 
        if(hitElement ~= player) then return end
        
        -- VALIDATION TO USE AMBULANCE TO RESCUE PED
        local playerVehicle = getPedOccupiedVehicle(hitElement)
        if (playerVehicle == false or getElementModel(playerVehicle) ~= getVehicleModelFromName("Ambulance")) then
            outputChatBox("Você precisa estar em uma ambulância para prestar socorro!", player, 240, 0, 0, true)
            return
        end

        -- TRIGGER CLIENT EVENT TO MAKE PED ENTER IN AMBULANCE
        setTimer(function() 
            setPedAnimation(ped, false) 
            triggerClientEvent(player, "setPedEnterAmbulance", player, ped, playerVehicle)
        end, 500, 1)
        
        outputChatBox("Espere seu paciente entrar na ambulância e leve-o urgentemente para o hospital indicado no mapa.", player, 255, 120, 0, true)

        -- CREATE DESTINY HOSPITAL MARKER
        local availableHospitals = HOSPITALS_BY_ZONE[getZoneName(x, y, z, true)]
        local hx, hy, hz = availableHospitals[math.random(1, #availableHospitals)]:match("([^,]+),([^,]+),([^,]+)")
        
        if(hospitalMarker ~= nil) then
            destroyElement(hospitalMarker)
        end
        hospitalMaker = createMarker(hx, hy, hz, "cylinder", 2, 0, 200, 0, 255, player)
        setElementParent(hospitalMaker, container)

        local hospitalBlip = createBlipAttachedTo(hospitalMaker, 0, 3, 240, 0, 0, 255, 0, 99999, player)
        setElementParent(hospitalBlip, hospitalMaker)

        -- LISTEN TO GET ON HOSPITAL WITH PED IN AMBULANCE
        addEventHandler("onMarkerHit", hospitalMaker,
        function(hitElement) 
            if(hitElement ~= player) then return end
            
            -- VALIDADE TO CHECK IF IS AMBULANCE AND WITH PED INSIDE
            if(getPedOccupiedVehicle(ped) == false or 
               getPedOccupiedVehicle(player) == false or 
               getPedOccupiedVehicle(ped) ~= getPedOccupiedVehicle(player)) then 
                outputChatBox("Você precisa trazer seu paciente até este local utilizando a ambulância.", player, 255, 120, 0, true)
                return 
            end

            destroyElement(container)
            local totalReward = get("rescue_patient_quest_reward") + (get("rescue_patient_quest_reward") * job.currentLevel * get("doctor_level_bonus_multiplier"))
            outputChatBox("Seu paciente agora está seguro no hospital. Serviço concluido! +$"..totalReward, player, 0, 240, 0, true)
            triggerEvent("doneQuest", player, totalReward, job.jobTriggerName)
            triggerClientEvent(player, "toggleMissionTimer", player)
        end)
    end)

    -- LISTEN FOR TIMER
    triggerClientEvent(player, "toggleMissionTimer", player, "Tempo restante ", 300, 60, "rescuePatientQuestTimesEnd")
    local function onTimesEnd()
        destroyElement(container)
        removeEventHandler("rescuePatientQuestTimesEnd", player, onTimesEnd)
        outputChatBox("Você demorou demais, seu paciente não suportou.", player, 240, 0, 0, true)
        outputChatBox("Serviço fracassado!", player, 240, 0, 0, true)
    end
    addEventHandler("rescuePatientQuestTimesEnd", player, onTimesEnd)
end

-- HANDLERS
local function handleDoctorJob(job)
    local questContainerId = get("job_container_prefix")..getAccountID(getPlayerAccount(source));
    local questContainer = getElementByID(questContainerId)

    if(questContainer ~= false) then
        outputChatBox("Você já tem um serviço em andamento. Digite /cancelarServico para cancelar o serviço.", source, 240, 0, 0, true)
        return
    end

    if(questContainer ~= nil and questContainer ~= false) then
        destroyElement(questContainer)
    end
    questContainer = createElement("doctorJob", questContainerId)
    local quests = {}
    quests[1] = healPatientQuest
    quests[2] = rescuePatientQuest

    local level = job.currentLevel
    if(level > #quests) then level = #quests end
    local quest = quests[math.random(1, level)]

    quest(questContainer, source, job)
end
addEvent('doctorJob', true)
addEventHandler('doctorJob', getRootElement(), handleDoctorJob)

local function cancelDoctorJob(player)
    local questContainerId = get("job_container_prefix")..getAccountID(getPlayerAccount(player));
    local questContainer = getElementByID(questContainerId)

    if(questContainer == false) then return end

    triggerClientEvent(player, "toggleMissionTimer", player)
    destroyElement(questContainer)
    outputChatBox("O serviço que estava em andamento foi cancelado com sucesso.", player, 255, 255, 255, true)
end
addCommandHandler("cancelarServico", cancelDoctorJob, false, false)