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