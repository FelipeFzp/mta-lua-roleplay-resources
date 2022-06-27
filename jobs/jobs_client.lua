local function createAcceptJobWindow(job)  
    -- WINDOW
    local srcWidth, srcHeight = guiGetScreenSize();
    local winWidth, winHeight = 300, 200;
    local centerX, centerY = (srcWidth / 2) - (winWidth / 2), (srcHeight / 2) - (winHeight / 2) 

    local win = guiCreateWindow(centerX, centerY, winWidth, winHeight, "Começar um serviço", false);

    -- LABELS
    guiCreateLabel(0.05, 0.15, 1, 0.4, "Você está prestes a começar um serviço do seu", true, win)
    guiCreateLabel(0.05, 0.23, 1, 0.4, "emprego atual", true, win)
    guiCreateLabel(0.05, 0.45, 1, 0.4, "Deseja iniciar?", true, win)

    -- BUTTONS
    addEventHandler("onClientGUIClick", 
        guiCreateButton(0.55, 0.75, 0.45, 0.25, "Começar", true, win), 
        function() 
            guiSetVisible(win, false)
            showCursor(false)
            triggerServerEvent(job.jobTriggerName, localPlayer, job)
        end)

    addEventHandler("onClientGUIClick", 
        guiCreateButton(0.02, 0.75, 0.45, 0.25, "Fechar", true, win), 
        function() 
            guiSetVisible(win, false)
            showCursor(false)
            destroyElement(win)
        end)

    guiWindowSetSizable(win, false)
    guiSetVisible(win, true)
    showCursor(true)
end

local function createJobsWindow(jobs, currentJob)  
    -- WINDOW
    local srcWidth, srcHeight = guiGetScreenSize();
    local winWidth, winHeight = 500, 400;
    local centerX, centerY = (srcWidth / 2) - (winWidth / 2), (srcHeight / 2) - (winHeight / 2) 

    local win = guiCreateWindow(centerX, centerY, winWidth, winHeight, "Ministério do trabalho", false);

    -- LABELS
    local currentJobLabel = "Desempregado";
    if (currentJob ~= nil) then currentJobLabel = currentJob.jobTitle end
    guiCreateLabel(0.05, 0.1, 0.25, 0.4, "Emprego atual: ", true, win)
    guiLabelSetColor(
        guiCreateLabel(0.25, 0.1, 1 - 0.4, 0.4, currentJobLabel, true, win),
        200, 200, 200)

    local jobLevelLabel = "0";
    if (currentJob ~= nil) then jobLevelLabel = currentJob.levelTitle end
    guiCreateLabel(0.05, 0.16, 0.36, 0.4, "Nivel do emprego atual: ", true, win)
    guiLabelSetColor(
        guiCreateLabel(0.36, 0.16, 1 - 0.36, 0.4, jobLevelLabel, true, win),
        200, 200, 200)
        
    local progressLabel = "Você não possui progresso como desempregado";
    if (currentJob ~= nil) then 
        progressLabel = currentJob.levelProgress.."/"..currentJob.levelTotal 
    end
    guiCreateLabel(0.05, 0.22, 0.365, 0.4, "Progresso de atividades: ", true, win)
    guiLabelSetColor(
        guiCreateLabel(0.365, 0.22, 1 - 0.365, 0.4, progressLabel, true, win),
        200, 200, 200)

    guiCreateLabel(0.05, 0.4, 0.365, 0.4, "Deseja trocar de emprego?", true, win)
    local jobsCombo = guiCreateComboBox(0.05, 0.45, 0.9, 0.4, "Selecione outro emprego", true, win)
    for i, job in pairs(jobs) do
        guiComboBoxAddItem(jobsCombo, job.id.." - "..job.title);
    end

    local selectedJob;
    addEventHandler("onClientGUIComboBoxAccepted", 
        jobsCombo, 
        function() 
            local selectedJobIndex = guiComboBoxGetSelected(jobsCombo) + 1;
            selectedJob = jobs[selectedJobIndex];
        end)

    -- BUTTONS
    addEventHandler("onClientGUIClick", 
        guiCreateButton(0.8, 0.9, 0.2, 0.1, "Concluir", true, win), 
        function() 
            guiSetVisible(win, false); 
            showCursor(false); 
            triggerServerEvent('savePlayerJob', getResourceRootElement(), localPlayer, selectedJob)
            destroyElement(win);
        end)

    guiWindowSetSizable(win, false)
    guiSetVisible(win, true)
    showCursor(true)
end
addEvent('createJobsWindow', true)
addEventHandler('createJobsWindow', getResourceRootElement(), createJobsWindow)

local function createJobBlipsAndMarkers(job, questContainerId)
    local playerSerial = getPlayerSerial(localPlayer)
    
    local playerBlipsAndMarkersElementId = "p_"..playerSerial.."_blipsAndMarkers";
    local playerBlipsAndMarkers = getElementByID(playerBlipsAndMarkersElementId)

    if(playerBlipsAndMarkers ~= nil) then 
        destroyElement(playerBlipsAndMarkers)
    end
    
    if(job == nil) then return end
    
    playerBlipsAndMarkers = createElement("blipsAndMarkersGroup", playerBlipsAndMarkersElementId)
    for position in string.gmatch(job.jobStartPositions, "([^;]+)") do
        local x, y, z = position:match("([^,]+),([^,]+),([^,]+)")
        local blip = createBlip(x, y, z, job.jobBlipId, 0, 0, 0, 0, 0, 0, 2000, localPlayer)
        setElementParent(blip, playerBlipsAndMarkers)
        
        local marker = createMarker(x, y, z, "cylinder", 1.5, 0, 0, 255, 255, localPlayer)
        addEventHandler("onClientMarkerHit", marker, 
            function(hitPlayer) 
                if(hitPlayer ~= localPlayer) then return end

                if(isElement(getElementByID(questContainerId))) then
                    outputChatBox("Você já tem um serviço em andamento. Digite /cancelarServico para cancelar o serviço.", 240, 0, 0, true)
                    return
                end

                createAcceptJobWindow(job)
            end)
        setElementParent(marker, playerBlipsAndMarkers)
    end
end
addEvent('createJobBlipsAndMarkers', true)
addEventHandler('createJobBlipsAndMarkers', localPlayer, createJobBlipsAndMarkers)

local missionTimer;
local refresherTimer;
local remainingTimeString;
local timerR, timerG, timerB = 255, 255, 255;
local function drawTimer()
    local screenWidth, screenHeight = guiGetScreenSize()
    -- Draw zone name text's shadow.
    dxDrawText(remainingTimeString or "", 0, screenHeight - 41, screenWidth - 20, screenHeight, tocolor(0, 0, 0, 100), 1.42, "default-bold", "right")
    -- Draw zone name text.
    dxDrawText(remainingTimeString or "", 0, screenHeight - 43, screenWidth - 20, screenHeight, tocolor(timerR, timerG, timerB, 255), 1.4, "default-bold", "right")
end
local function toggleMissionTimer(label, timeInSeconds, hurryTime, finishTriggerName)
    if(label == nil and timeInSeconds == nil and hurryTime == nil and finishTriggerName == nil) then
        removeEventHandler("onClientRender", getRootElement(), drawTimer)
        killTimer(missionTimer)
        killTimer(refresherTimer)
        missionTimer = nil
        refresherTimer = nil
        remainingTimeString = nil
        timerR, timerG, timerB = 255, 255, 255;
        return
    end

    refresherTimer = setTimer(function() 
        if missionTimer ~= nil and isTimer(missionTimer) then
            local ms = getTimerDetails(missionTimer)
            local seconds = math.floor(ms / 1000)

            local remainingMs = ms % 1000
            local remainingSeconds = seconds % 60
            local remainingMinutes = math.floor(seconds / 60) % 60
            remainingTimeString = string.format((label or "").."%02d:%02d", remainingMinutes, remainingSeconds)

            if(hurryTime ~= nil and (hurryTime * 1000) > ms) then
                timerR = 240;
                timerG = 0;
                timerB = 0;
            end
        end
    end, 1000, 0)
   
    missionTimer = setTimer(function()
        removeEventHandler("onClientRender", getRootElement(), drawTimer)
        killTimer(missionTimer)
        killTimer(refresherTimer)
        missionTimer = nil
        refresherTimer = nil
        remainingTimeString = nil
        timerR, timerG, timerB = 255, 255, 255;

        if(finishTriggerName ~= nil) then
            triggerServerEvent(finishTriggerName, localPlayer)
        end
    end, timeInSeconds * 1000, 1)

    addEventHandler("onClientRender", getRootElement(), drawTimer)
end
addEvent('toggleMissionTimer', true)
addEventHandler('toggleMissionTimer', localPlayer, toggleMissionTimer)

local function handleFadeScreen(timeInSeconds)
    if(timeInSeconds <= 0.3) then timeInSeconds = 0.4 end

    fadeCamera(false, 0.3)
    setTimer(function()
        fadeCamera(true, 0.3)
    end, timeInSeconds * 1000, 1)
end
addEvent("fadeScreen", true)
addEventHandler("fadeScreen", localPlayer, handleFadeScreen)