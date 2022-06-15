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
    "-122.6650390625,2519.6884765625,62.905521392822,-123.6649930835,2519.698065926,62.905521392822;-485.669921875,2534.2099609375,99.802879333496,-486.66898260113,2534.2532929754,99.802879333496;-923.5439453125,2429.294921875,133.31948852539,-924.36605648348,2428.7255948841,133.31948852539;-1060.2939453125,1910.7802734375,150.01713562012,-1060.2218931281,1909.7828725739,150.01713562012;-854.5810546875,1470.509765625,83.069931030273,-854.11361670898,1469.6257397565,83.069931030273;-315.5009765625,1070.4501953125,65.560127258301,-314.50961952269,1070.3190037746,65.560127258301;422.5478515625,1195.2451171875,59.674289703369,423.31856026036,1195.8823048389,59.674289703369;1022.177734375,1535.98046875,85.964263916016,1023.117032702,1536.3235702699,85.964263916016;1269.43359375,2053.4560546875,85.083686828613,1269.2860688071,2054.4451130231,85.083686828613;902.806640625,2500.220703125,71.804206848145,901.90417920219,2500.6514738068,71.804206848145",
    "-201.9052734375,2639.9873046875,90.976875305176,-202.74902556992,2640.5240377115,90.976875305176;-565.4765625,2739.626953125,101.77135467529,-566.47584153333,2739.5889871724,101.77135467529;-830.8076171875,2747.07421875,99.060111999512,-831.80760475492,2747.0792052322,99.060111999512;-1498.875,2683.9697265625,111.34548950195,-1499.748221156,2683.4824024274,111.34548950195;-2319.8740234375,2446.564453125,126.27213287354,-2320.7962429458,2446.1777863713,126.27213287354;-2626.7607421875,2035.6796875,130.57527160645,-2626.8190153404,2034.681386824,130.57527160645;-2426.490234375,1613.7802734375,130.14637756348,-2425.8128785783,1613.0446178627,130.14637756348;-1857.2236328125,1491.18359375,112.645652771,-1856.2389586285,1491.3579977391,112.645652771;-945.728515625,1771.6357421875,120.10750579834,-944.86325849725,1772.1370705259,120.10750579834;-557.2626953125,2016.3515625,115.85666656494,-556.41812083497,2016.8870005934,115.85666656494;-158.880859375,2280.7666015625,119.57302856445,-158.17307498876,2281.4730300887,119.57302856445"
}
AIRDROP_ROUTES["Tierra Robada"] = AIRDROP_ROUTES["Bone County"]
AIRDROP_ROUTES["Las Venturas"] = { 
    "1486.6279296875,1088.3310546875,64.224365234375,1486.7762134485,1087.3421098325,64.224365234375;1961.263671875,748.083984375,87.187431335449,1962.2587407459,747.98479797381,87.187431335449;2653.880859375,984.0029296875,78.025566101074,2654.5100307386,984.78019630534,78.025566101074;2632.17578125,1646.931640625,73.047492980957,2631.8079418674,1647.8615299671,73.047492980957;2338.4130859375,2233.6376953125,94.176155090332,2337.9490422924,2234.523507649,94.176155090332;2073.845703125,2669.14453125,94.135543823242,2072.997045644,2669.6734740446,94.135543823242;1447.5419921875,2459.8291015625,83.920562744141,1446.6953699792,2459.2969072029,83.920562744141",
    "1464.8095703125,1895.9169921875,70.806129455566,1464.7658551428,1896.9160362225,70.806129455566;1567.9423828125,2684.767578125,85.449394226074,1568.0868721459,2685.757084483,85.449394226074;2534.5546875,2768.4375,91.485618591309,2535.4993914144,2768.1095754444,91.485618591309;2594.783203125,1860.572265625,71.602569580078,2594.201018139,1859.7592092665,71.602569580078;2334.3759765625,1313.6298828125,112.39998626709,2334.1598177611,1312.6535245931,112.39998626709;1762.1611328125,758.0205078125,80.653228759766,1761.2909187841,757.52783393985,80.653228759766;1293.9150390625,939.3330078125,88.940925598145,1293.2337421923,940.06501503564,88.940925598145"
}
AIRDROP_ROUTES["Red County"] = AIRDROP_ROUTES["Las Venturas"]
AIRDROP_ROUTES["San Fierro"] = { 
    "-1059.4931640625,446.3125,56.311553955078,-1058.798505692,447.03183980034,56.311553955078;-1030.0986328125,1108.84765625,87.193618774414,-1030.5352792593,1109.7472894422,87.193618774414;-1334.408203125,1447.7451171875,51.102138519287,-1335.3119821145,1448.173116648,51.102138519287;-2287.677734375,1526.912109375,56.619598388672,-2288.6767951011,1526.9554414129,56.619598388672;-2816.1015625,1192.013671875,89.277015686035,-2816.728942902,1191.2349589425,89.277015686035;-2858.419921875,355.9609375,63.381275177002,-2858.4812574969,354.96282030173,63.381275177002;-2729.1533203125,-116.4228515625,81.017044067383,-2728.5489045353,-117.21952060814,81.017044067383;-2415.2939453125,-547.244140625,162.55366516113,-2414.7823638743,-548.10337541948,162.55366516113;-1896.9462890625,-673.7294921875,107.907081604,-1895.9578620131,-673.57779522633,107.907081604",
    "-1137.30859375,445.36328125,47.31135559082,-1137.4712763848,446.3499596983,47.31135559082;-1476.0673828125,1193.44921875,63.333889007568,-1476.7486796827,1194.1812259731,63.333889007568;-1941.1923828125,1229.3203125,116.19518280029,-1942.0603198484,1228.823638259,116.19518280029;-2397.8447265625,705.173828125,130.5350189209,-2398.4016914879,704.34329211021,130.5350189209;-2563.193359375,234.09375,106.57265472412,-2563.196428397,233.09375470946,106.57265472412;-2428.7314453125,-137.509765625,109.96826934814,-2428.079303339,-138.26786248319,109.96826934814;-2061.4775390625,-507.611328125,113.95816802979,-2060.5624695077,-508.01462418224,113.95816802979"
}
AIRDROP_ROUTES["Whetstone"] = AIRDROP_ROUTES["San Fierro"]
AIRDROP_ROUTES["Los Santos"] = { 
    "1307.7470703125,-2478.3173828125,69.470222473145,1306.7476530119,-2478.2832498492,69.470222473145;842.404296875,-1875.990234375,61.688091278076,842.10587835711,-1875.0357992603,61.688091278076;523.490234375,-1236.130859375,96.078620910645,522.63995783399,-1235.604523167,96.078620910645;53.3076171875,-1473.1279296875,119.275390625,52.501541231968,-1473.7197417809,119.275390625;351.037109375,-2061.5458984375,88.400062561035,352.03534237953,-2061.6053195504,88.400062561035;1182.9912109375,-2035.560546875,112.47093963623,1183.9911720193,-2035.5693692806,112.47093963623;2030.8681640625,-1644.142578125,105.63436126709,2031.6240050468,-1643.4878228986,105.63436126709;2571.2021484375,-1662.154296875,102.31507873535,2571.9820630912,-1662.7801827535,102.31507873535;2374.3037109375,-2285.26953125,79.279998779297,2373.497634982,-2285.8613433434,79.279998779297",
    "1256.2421875,-2468.1767578125,76.206558227539,1255.2422493654,-2468.1656345506,76.206558227539;381.6103515625,-1864.6474609375,52.007255554199,380.65444025527,-1864.3538054034,52.007255554199;225.4052734375,-1397.123046875,138.20536804199,226.07069004642,-1396.3765746809,138.20536804199;624.26953125,-1153.2802734375,169.76245117188,625.14756924144,-1152.8016824999,169.76245117188;1415.7412109375,-1123.2763671875,168.33572387695,1416.7411720193,-1123.2851895931,168.33572387695;2185.4794921875,-1228.99609375,102.90698242188,2186.4684938753,-1229.1439979812,102.90698242188;2651.212890625,-1844.0625,97.790824890137,2651.4305471461,-1845.0385254294,97.790824890137;2561.6357421875,-2409.4970703125,85.654609680176,2561.3336651524,-2410.4503538301,85.654609680176"
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
    local playerZoneName = getElementZoneName(player, true) 
    for i in string.gmatch(AIRDROP_ROUTES[playerZoneName][math.random(1, #AIRDROP_ROUTES[playerZoneName])], "([^;]+)") do markerPositions[#markerPositions + 1] = i end 

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
    -- quests[1] = deliveryPackageQuest
    quests[1] = airdropPackagesQuest
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

