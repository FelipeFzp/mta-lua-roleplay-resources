-- HANDLERS
local function handleDoneQuest(reward, jobTrigger)
    local accountId = getAccountID(getPlayerAccount(source))

    local previousJob = getPlayerCurrentJob(accountId)
    executeSQLQuery(
        " UPDATE f_player_jobs"..
        " SET activitiesCount = activitiesCount + 1"..
        " WHERE jobId = ("..
        "   SELECT id FROM f_jobs"..
        "   WHERE triggerName = \""..jobTrigger.."\""..
        "   LIMIT 1"..
        " )"..
        " AND accountId = "..accountId)
    givePlayerMoney(source, reward)
    local currentJob = getPlayerCurrentJob(accountId)

    if(previousJob ~= nil and currentJob ~= nil) then
        if(currentJob.currentLevel > previousJob.currentLevel) then
            outputChatBox("Parabéns, você subiu para o nivel "..currentJob.currentLevel.."!", source, 0, 226, 247, true)
            outputChatBox("Agora você terá acesso a novas missões com maiores recompensas $$$", source, 0, 226, 247, true)
            local questContainerId = get("job_container_prefix")..accountId
            createPlayerJobBlips(source, currentJob, questContainerId) --Recreate blips with updated job level
        end
    end
end
addEvent('doneQuest', true)
addEventHandler('doneQuest', getRootElement(), handleDoneQuest)

local function handleJobsSave(player, selectedJob)
    if (selectedJob == nil) then
        return
    end

    local account = getPlayerAccount(player);
    local accountId = getAccountID(account)

    local isCurrent = executeSQLQuery("SELECT * FROM f_player_jobs WHERE accountId = \""..accountId.."\" AND jobId = "..selectedJob.id.." AND current = true")
    if(isCurrent[0] or isCurrent[1]) then --If the player already has this job as current
        return
    end

    local hasThisSelectedJob = executeSQLQuery("SELECT * FROM f_player_jobs WHERE accountId = \""..accountId.."\" AND jobId = "..selectedJob.id.."")
    if (#hasThisSelectedJob >= 1) then
        executeSQLQuery("UPDATE f_player_jobs SET current = 0 WHERE accountId == \""..accountId.."\" AND jobId != \""..selectedJob.id.."\"")
        executeSQLQuery("UPDATE f_player_jobs SET current = 1 WHERE accountId == \""..accountId.."\" AND jobId == \""..selectedJob.id.."\"")
    else
        executeSQLQuery("INSERT INTO f_player_jobs (accountId, jobId, activitiesCount, current) VALUES (\""..accountId.."\", "..selectedJob.id..", 0, 1)")
        executeSQLQuery("UPDATE f_player_jobs SET current = 0 WHERE accountId == \""..accountId.."\" AND jobId != \""..selectedJob.id.."\"")
    end

    local currentJob = getPlayerCurrentJob(accountId)
    outputChatBox("Parabéns! Agora você tem um novo emprego de "..currentJob.jobTitle..".", player, 0, 226, 247, true)
    outputChatBox("Você pode começar um trabalho nos pontos indicados no mapa.", player, 0, 226, 247, true)
    local questContainerId = get("job_container_prefix")..accountId
    createPlayerJobBlips(player, currentJob, questContainerId)
end
addEvent('savePlayerJob', true)
addEventHandler('savePlayerJob', getResourceRootElement(), handleJobsSave)

local function handlePlayerLogin(previousAccount, loggedAccount)
    local isGuestAccount = isGuestAccount(loggedAccount);
    if(isGuestAccount == true) then return end

    local accountId = getAccountID(loggedAccount)
    local currentJob = getPlayerCurrentJob(accountId)
    if(currentJob == nil) then return end

    local questContainerId = get("job_container_prefix")..accountId
    createPlayerJobBlips(getAccountPlayer(loggedAccount), currentJob, questContainerId)
end
addEventHandler("onPlayerLogin", getRootElement(), handlePlayerLogin)

local function handlePlayerLogout(loggedOffAccount)
    local questContainerId = get("job_container_prefix")..getAccountID(loggedOffAccount)
	createPlayerJobBlips(source, nil, questContainerId)
end
addEventHandler("onPlayerLogout",getRootElement(), handlePlayerLogout)

function handleResourceStart()
    createMinistryJobsMarker()

    for k, player in ipairs(getElementsByType("player")) do
        local playerAccount = getPlayerAccount(player)
        if(playerAccount == false or isGuestAccount(playerAccount)) then return end

        local job = getPlayerCurrentJob(getAccountID(playerAccount))
        setTimer(function() createPlayerJobBlips(player, job) end, 2000, 1)
    end

    local map = xmlLoadFile("jobs_base_map.xml", true)
	if (map) then
		loadMapData(map, root)
		xmlUnloadFile(map)
	end
end
addEventHandler("onResourceStart", getResourceRootElement(), handleResourceStart)


--UTILS
function createPlayerJobBlips(player, job, questContainerId)
    triggerClientEvent(player, "createJobBlipsAndMarkers", player, job, questContainerId)
end

function createMinistryJobsMarker()
    local onJobMinistryHit = function(hitElement)
        if(getElementType(hitElement) ~= "player") then return end

        local questContainer = getElementByID(get("job_container_prefix")..getAccountID(getPlayerAccount(hitElement)))
        if(questContainer ~= false) then 
            outputChatBox("Você não pode trocar de emprego enquanto uma missão está em andamento", hitElement, 240, 0, 0, true)
            outputChatBox("Digite /cancelarServico para cancelar o serviço que está em andamento!", hitElement, 240, 0, 0, true)
            return
        end

        local jobs = executeSQLQuery("SELECT * FROM f_jobs ORDER BY id ASC")
        local accountId = getAccountID(getPlayerAccount(hitElement))
        
        local currentJob = getPlayerCurrentJob(accountId)
        triggerClientEvent(hitElement, 'createJobsWindow', source, jobs, currentJob)
    end

    addEventHandler("onMarkerHit", createMarker(2415.5,1124,9.7, "cylinder", 1.5), onJobMinistryHit)
    createBlip(2415.5, 1124, 9.7, 42, 3, 0, 0, 0, 0, 0, 2400)

    addEventHandler("onMarkerHit", createMarker(-2720.3999,-318.20001,6.7, "cylinder", 1.5), onJobMinistryHit)
    createBlip(-2720.3999, -318.20001, 6.7, 42, 3, 0, 0, 0, 0, 0, 2400)

    addEventHandler("onMarkerHit", createMarker(1481.2,-1750.3,14.4, "cylinder", 1.5), onJobMinistryHit)
    createBlip(1481.2, -1750.3, 14.4, 42, 3, 0, 0, 0, 0, 0, 2400)

end

function getPlayerCurrentJob(accountId)
    local stats = executeSQLQuery(
        " SELECT"..
        " f_jobs.id as jobId,"..
        " f_jobs.blipId as jobBlipId,"..
        " f_jobs.startPositions as jobStartPositions,"..
        " f_jobs.title as jobTitle,"..
        " f_jobs.triggerName as jobTriggerName,"..
        " f_job_levels.title as levelTitle,"..
        " f_job_levels.level as currentLevel,"..
        " f_player_jobs.activitiesCount as levelProgress,"..
        " f_job_levels.activitiesCount as levelTotal"..
        " FROM f_jobs"..
        " INNER JOIN f_player_jobs on f_player_jobs.jobId = f_jobs.id"..
        " INNER JOIN f_job_levels on f_job_levels.jobId = f_jobs.id"..
        " WHERE f_player_jobs.accountId == \""..accountId.."\""..
        " AND f_player_jobs.current == 1"..
        " AND f_job_levels.activitiesCount > f_player_jobs.activitiesCount"..
        " ORDER BY f_job_levels.level ASC"..
        " LIMIT 1")
    return stats[0] or stats[1];
end

-- ACTION PANEL
local function handleGetCurrentJob()
    local accountId = getAccountID(getPlayerAccount(source))

    local jobs = executeSQLQuery(
        " SELECT"..
        " f_jobs.id as jobId,"..
        " f_jobs.vehicleId as jobVehicleId,"..
        " f_jobs.title as jobTitle,"..
        " f_job_levels.title as levelTitle,"..
        " f_player_jobs.activitiesCount as levelProgress,"..
        " f_job_levels.activitiesCount as levelTotal"..
        " FROM f_jobs"..
        " INNER JOIN f_player_jobs on f_player_jobs.jobId = f_jobs.id"..
        " INNER JOIN f_job_levels on f_job_levels.jobId = f_jobs.id"..
        " WHERE f_player_jobs.accountId == \""..accountId.."\""..
        " AND f_player_jobs.current == 1"..
        " AND f_job_levels.activitiesCount > f_player_jobs.activitiesCount"..
        " ORDER BY f_job_levels.level ASC"..
        " LIMIT 1")
    local job = jobs[0] or jobs[1];
    triggerClientEvent(source, "handleGetPlayerCurrentJobResponse", source, job)
end
addEvent("getPlayerCurrentJob", true)
addEventHandler("getPlayerCurrentJob", getRootElement(), handleGetCurrentJob)