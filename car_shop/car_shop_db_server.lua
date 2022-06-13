TABLES = {
    VEHICLES = "f_carshop_vehicles",
}

executeSQLCreateTable(TABLES.VEHICLES, "id INTEGER PRIMARY KEY, modelId INTEGER, price INTEGER");

-- VEHICLES
outputServerLog("["..TABLES.VEHICLES.."] Creating/Checking vehicles on database...")


local counter = 1
for carAndPrice in string.gmatch(get("paid_cars_ids"), "([^,]+)") do
    local modelId, price = carAndPrice:match("(%w+)=(%w+)")
    executeSQLQuery("INSERT OR IGNORE INTO "..TABLES.VEHICLES.." (id, modelId, price) VALUES ("..counter..", "..modelId..", "..price..")")
    counter = counter + 1
end