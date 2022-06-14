local function handleSpawnVehicle(vehicleId)
    local player = source
    if(isPedInVehicle(player)) then return end

    local x, y, z = getElementPosition(player)
    local rx, ry, rz = getElementRotation(player)

    -- SPAWN IF IS A FREE VEHICLE
    for freeVehicleId in string.gmatch(get("free_cars_ids"), "([^,]+)") do 
        if(freeVehicleId == vehicleId) then 
            local veh = createVehicle(freeVehicleId, 0, 0, 0)
            spawnVehicle(veh, x, y, z, rx, ry, rz)
            warpPedIntoVehicle(player, veh, 0)
            return
        end
    end
    
    -- SPAWN IF IS A PAID VEHICLE
    local accountId = getAccountID(getPlayerAccount(player))
    local vehicle = executeSQLQuery("SELECT * FROM f_carshop_player_vehicles WHERE id = ? AND accountId", vehicleId, accountId)
    vehicle = vehicle[0] or vehicle[1] or false
    if(vehicle == nil) then return end

    local veh = createVehicle(vehicle.modelId, 0, 0, 0)

    local vehicleColors = fromJSON(vehicle.colors);
    local r1, g1, b1 = vehicleColors.color1:match("([^,]+),([^,]+),([^,]+)")
    local r2, g2, b2 = vehicleColors.color2:match("([^,]+),([^,]+),([^,]+)")
    local r3, g3, b3 = vehicleColors.color3:match("([^,]+),([^,]+),([^,]+)")
    setVehicleColor(veh, tonumber(r1), tonumber(g1), tonumber(b1), tonumber(r2), tonumber(g2), tonumber(b2), tonumber(r3), tonumber(g3), tonumber(b3))

    --TODO: adicionar upgrades

    spawnVehicle(veh, x, y, z, rx, ry, rz)
    warpPedIntoVehicle(player, veh, 0)
end
addEvent("spawnCarShopVehicle", true)
addEventHandler("spawnCarShopVehicle", getRootElement(), handleSpawnVehicle)

local function handlePlayerBuyCar(modelId, color1, color2, color3)
    local player = source

    local queryResult = executeSQLQuery("SELECT price FROM f_carshop_vehicles WHERE modelId = "..modelId or -1)
    local vehiclePrice = queryResult[1].price or nil
    if(vehiclePrice == nil) then return end

    local successfullMoneyWithdraw = takePlayerMoney(player, vehiclePrice)
    if(not successfullMoneyWithdraw) then return end

    local accountId = getAccountID(getPlayerAccount(player))
    local colorsJson = toJSON({ color1 = color1, color2 = color2, color3 = color3 }, true)
    local upgradesJson = toJSON({}, true)

    executeSQLQuery("INSERT INTO f_carshop_player_vehicles (accountId, modelId, colors, upgrades) VALUES (?, ?, ?, ?)", accountId, modelId, colorsJson, upgradesJson)

    outputChatBox("Parabéns, Você adquiriu um(a) "..getVehicleNameFromModel(modelId).."!", player, 0, 240, 0)
    outputChatBox("Seu veículos já está disponivel no seu menu de veículos.", player, 0, 240, 0)
end
addEvent("handlePlayerBuyCar", true)
addEventHandler("handlePlayerBuyCar", getRootElement(), handlePlayerBuyCar)

local function createPlayerCarShops(player)
    local loggedAccount = getPlayerAccount(player)
    if(isGuestAccount(loggedAccount)) then return end

    local carShopContainerId = get("car_shop_container_prefix")..getAccountID(loggedAccount)
    local carShopContainer = getElementByID(carShopContainerId)
    if(carShopContainer  ~= false) then destroyElement(carShopContainer) end
    carShopContainer = createElement("car_shop", carShopContainerId)

    for position in string.gmatch(get("car_shop_locations"), "([^;]+)") do
        local x, y, z = position:match("([^,]+),([^,]+),([^,]+)")
        local blip = createBlip(x, y, z, 55, 0, 0, 0, 0, 0, 0, 2000, player)
        setElementParent(blip, carShopContainer)
        
        local marker = createMarker(x, y, z, "cylinder", 1.5, 0, 0, 255, 255, player)
        addEventHandler("onMarkerHit", marker, 
            function(hitPlayer) 
                if(hitPlayer ~= player) then return end

                local vehicles = executeSQLQuery("SELECT modelId, price FROM f_carshop_vehicles")
                for _, vehicle in ipairs(vehicles) do
                    vehicle.modelName = getVehicleNameFromModel(vehicle.modelId)
                    local dummyVehicle = createVehicle(vehicle.modelId, 0, 0, 0)
                    vehicle.category = getVehicleType(dummyVehicle)
                    destroyElement(dummyVehicle)
                end
                table.sort(vehicles, function(a, b) return a.category < b.category or (a.category == b.category and a.modelName < b.modelName) end);

                triggerClientEvent(player, "openCarShopWindow", player, vehicles)
            end)
        setElementParent(marker, carShopContainer)
    end
end
addEventHandler("onPlayerLogin", getRootElement(), function() createPlayerCarShops(source) end) 

function handleResourceStart()
    for k, player in ipairs(getElementsByType("player")) do createPlayerCarShops(player) end
    local map = xmlLoadFile("car_shop_base_map.xml", true)
	if (map) then
		loadMapData(map, root)
		xmlUnloadFile(map)
	end
end
addEventHandler("onResourceStart", getResourceRootElement(), handleResourceStart)

-- ACTIONS PANEL
local function handleGetPlayerCarShopVehicles()
    local availableVehicles = {}

    for vehicleId in string.gmatch(get("free_cars_ids"), "([^,]+)") do 
        local modelName = getVehicleNameFromModel(vehicleId)
        table.insert(availableVehicles, {
            id = vehicleId,
            modelId = vehicleId,
            modelName = modelName,
            colors = "",
            upgrades = "",
            name = "Grátis"
        })
    end

    local accountId = getAccountID(getPlayerAccount(source))
    local playerVehicles = executeSQLQuery("SELECT id, modelId, colors, upgrades FROM f_carshop_player_vehicles WHERE accountId = ? ORDER BY id ASC", accountId)

    for i, vehicle in ipairs(playerVehicles) do 
        local modelName = getVehicleNameFromModel(vehicle.modelId)
        table.insert(availableVehicles, {
            id = vehicle.id,
            modelId = vehicle.modelId,
            modelName = modelName,
            colors = vehicle.colors,
            upgrades = vehicle.upgrades,
            name = modelName.." ("..vehicle.id..")"
        })
    end
    triggerClientEvent(source, "handleGetPlayerCarShopVehicles", source, availableVehicles)
end
addEvent("getPlayerCarShopVehicles", true)
addEventHandler("getPlayerCarShopVehicles", getRootElement(), handleGetPlayerCarShopVehicles)