TABLES = {
    JOBS = "f_jobs",
    JOB_LEVELS = "f_job_levels",
    PLAYER_JOBS = "f_player_jobs",
}

executeSQLCreateTable(TABLES.JOBS, "id INTEGER PRIMARY KEY, title TEXT, blipId INTEGER, vehicleId INTEGER, startPositions TEXT, triggerName TEXT");
executeSQLCreateTable(TABLES.PLAYER_JOBS, "id INTEGER PRIMARY KEY, accountId TEXT, jobId INTEGER, activitiesCount INTEGER, current BOOLEAN, UNIQUE(accountId, jobId), FOREIGN KEY(jobId) REFERENCES "..TABLES.JOBS.."(id)")
executeSQLCreateTable(TABLES.JOB_LEVELS, "id INTEGER PRIMARY KEY, jobId INTEGER, level INTEGER, title TEXT, activitiesCount INTEGER, UNIQUE(jobId, level), FOREIGN KEY(jobId) REFERENCES "..TABLES.JOBS.."(id)")

-- JOBS
outputServerLog("["..TABLES.JOBS.."] Creating/Checking jobs on database...")
for i, job in pairs({
    { id = 1, title = "Paramédico", blipId = 22, vehicleId = 416, startPositions = "1178.7,-1323.6,13.1;1242.5,328.39999,18.7;2034,-1404.9,16.2;1579.2,1767.7,9.7;-1514.8,2522.3,54.8;-2201.3999,-2307.6001,29.6;-316.10001,1052.7,19.3;-2649.7,632.09998,13.3;-2659,632.09998,13.4;-1556,1168.8,6.1;2507.5,1244.1,9.8", triggerName = "doctorJob" },
    { id = 2, title = "Bombeiro", blipId = 20, vehicleId = 407, startPositions = "1974,-2314.7,12.6;1974,-2382.3,12.6;1823,-2614.3999,12.5;-1346.2,-231.3,13.1;-1334.4,-606.40002,13.1;-1252.5,-103.2,13.1;1585.5,1262.4,9.8;1341.5,1594.2,9.8;1562.5,1447.5,9.8;413.89999,2502.3999,15.4", triggerName = "firefighterJob" },
    { id = 3, title = "Coleta de lixo", blipId = 51, vehicleId = 408, startPositions = "20,0,2;100,0,0", triggerName = "garbageJob" },
    { id = 4, title = "Piloto de avião", blipId = 5, vehicleId = -1, startPositions = "1974,-2314.7,12.6;1974,-2382.3,12.6;1823,-2614.3999,12.5;-1346.2,-231.3,13.1;-1334.4,-606.40002,13.1;-1252.5,-103.2,13.1;1585.5,1262.4,9.8;1341.5,1594.2,9.8;1562.5,1447.5,9.8;413.89999,2502.3999,15.4", triggerName = "planeJob" },
    { id = 5, title = "Motorista particular", blipId = 55, vehicleId = 421, startPositions = "20,0,2;100,0,0", triggerName = "driverJob" }
}) do
    executeSQLQuery("INSERT OR IGNORE INTO "..TABLES.JOBS.." (id, title, blipId, vehicleId, startPositions, triggerName) VALUES ("..job.id..", \""..job.title.."\", "..job.blipId..", "..job.vehicleId..", \""..job.startPositions.."\", \""..job.triggerName.."\")")
end   

-- JOBS LEVELS
outputServerLog("["..TABLES.JOB_LEVELS.."] Creating/Checking jobs levels on database...")
for i, level in pairs({
    { id = 1, jobId = 1, level = 1, title = "Aprendiz", activitiesCount = 5 },
    { id = 2, jobId = 1, level = 2, title = "Iniciante", activitiesCount = 10 },
    { id = 3, jobId = 1, level = 3, title = "Básico", activitiesCount = 15 },
    { id = 4, jobId = 1, level = 4, title = "MAX", activitiesCount = 999999 },

    { id = 5, jobId = 2, level = 1, title = "Aprendiz", activitiesCount = 5 },
    { id = 6, jobId = 2, level = 2, title = "Iniciante", activitiesCount = 10 },
    { id = 7, jobId = 2, level = 3, title = "Básico", activitiesCount = 15 },
    { id = 8, jobId = 2, level = 4, title = "MAX", activitiesCount = 999999 },
    
    { id = 9, jobId = 3, level = 1, title = "Aprendiz", activitiesCount = 5 },
    { id = 10, jobId = 3, level = 2, title = "Iniciante", activitiesCount = 10 },
    { id = 11, jobId = 3, level = 3, title = "Básico", activitiesCount = 15 },
    { id = 12, jobId = 3, level = 4, title = "MAX", activitiesCount = 999999 },
    
    { id = 13, jobId = 4, level = 1, title = "Aprendiz", activitiesCount = 5 },
    { id = 14, jobId = 4, level = 2, title = "Iniciante", activitiesCount = 10 },
    { id = 15, jobId = 4, level = 3, title = "Básico", activitiesCount = 15 },
    { id = 16, jobId = 4, level = 4, title = "MAX", activitiesCount = 999999 },
    
    { id = 17, jobId = 5, level = 1, title = "Aprendiz", activitiesCount = 5 },
    { id = 18, jobId = 5, level = 2, title = "Iniciante", activitiesCount = 10 },
    { id = 19, jobId = 5, level = 3, title = "Básico", activitiesCount = 15 },
    { id = 20, jobId = 5, level = 4, title = "MAX", activitiesCount = 999999 }
}) do
    executeSQLQuery("INSERT OR IGNORE INTO "..TABLES.JOB_LEVELS.."(id, jobId, level, title, activitiesCount) VALUES ("..level.id..", "..level.jobId..", "..level.level..", \""..level.title.."\", "..level.activitiesCount..")")
end