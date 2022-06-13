local function handleGetPlayerCarShopVehicles()
    triggerClientEvent(source, "handleGetPlayerCarShopVehicles", source)
end
addEvent("getPlayerCarShopVehicles", true)
addEventHandler("getPlayerCarShopVehicles", getRootElement(), handleGetPlayerCarShopVehicles)