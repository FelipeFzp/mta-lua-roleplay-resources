TABLES = {
    VEHICLES = "f_carshop_vehicles",
    PLAYER_VEHICLES = "f_carshop_player_vehicles",
}

executeSQLCreateTable(TABLES.VEHICLES, "id INTEGER PRIMARY KEY, modelId INTEGER, price INTEGER");
executeSQLCreateTable(TABLES.PLAYER_VEHICLES, "id INTEGER PRIMARY KEY, accountId INTEGER, modelId INTEGER, colors TEXT, upgrades TEXT");

-- VEHICLES
outputServerLog("["..TABLES.VEHICLES.."] Creating/Checking vehicles on database...")
local paidCarsIdsString = get("paid_cars_ids")
local paidCarsIds = {}
for modelId in string.gmatch(paidCarsIdsString, "([^,]+)") do table.insert(paidCarsIds, modelId) end
table.sort(paidCarsIds, function(a, b) return a < b end)

executeSQLQuery("DELETE FROM "..TABLES.VEHICLES.." WHERE modelId NOT IN ("..paidCarsIdsString..")")
local counter = 1
for k, vehicleId in ipairs(paidCarsIds) do
    local dummyVehicle = createVehicle(vehicleId, 0, 0, 0)
    local price = getVehicleHandling(dummyVehicle).monetary or 0
    destroyElement(dummyVehicle)

    executeSQLQuery("INSERT OR IGNORE INTO "..TABLES.VEHICLES.." (id, modelId, price) VALUES ("..vehicleId..", "..vehicleId..", "..price..")")
    counter = counter + 1
end