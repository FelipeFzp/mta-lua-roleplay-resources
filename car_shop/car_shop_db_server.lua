TABLES = {
    VEHICLES = "f_carshop_vehicles",
    PLAYER_VEHICLES = "f_carshop_player_vehicles",
}

executeSQLCreateTable(TABLES.VEHICLES, "id INTEGER PRIMARY KEY, modelId INTEGER, price INTEGER");
executeSQLCreateTable(TABLES.PLAYER_VEHICLES, "id INTEGER PRIMARY KEY, accountId INTEGER, modelId INTEGER, colors TEXT, upgrades TEXT");

-- VEHICLES
outputServerLog("["..TABLES.VEHICLES.."] Creating/Checking vehicles on database...")
local counter = 1
for vehicleId in string.gmatch(get("paid_cars_ids"), "([^,]+)") do
    local dummyVehicle = createVehicle(vehicleId, 0, 0, 0)
    local price = getVehicleHandling(dummyVehicle).monetary or -9999
    destroyElement(dummyVehicle)

    executeSQLQuery("INSERT OR IGNORE INTO "..TABLES.VEHICLES.." (id, modelId, price) VALUES ("..counter..", "..vehicleId..", "..price..")")
    counter = counter + 1
end