-- ACTIONS PANEL
local function handleGetPlayerCarShopVehicles()
    local freeCars = {}
    for vehicleId in string.gmatch(get("free_cars_ids"), "([^,]+)") do 
        local modelName = getVehicleNameFromModel(vehicleId)
        table.insert(freeCars, {
            id = vehicleId,
            model = modelName,
            name = "Grátis"
        })
    end

    triggerClientEvent(source, "handleGetPlayerCarShopVehicles", source, freeCars)
end
addEvent("getPlayerCarShopVehicles", true)
addEventHandler("getPlayerCarShopVehicles", getRootElement(), handleGetPlayerCarShopVehicles)


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