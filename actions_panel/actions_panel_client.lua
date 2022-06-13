local ACTIONS_PANEL;
local ACTIONS_PANEL_2;
local ACTIONS_PANEL_W, ACTIONS_PANEL_H = 300, 400;
local ACTIONS_PANEL_X = 30;
local ACTIONS_PANEL_ANIM_SPEED = 80;
local VISIBLE = false
local ACTIONS_BUTTONS = {}

-- BUTTONS

addEvent("handleGetPlayerCurrentJobResponse", true)
ACTIONS_BUTTONS[1] = {
    "Seu Emprego",
    function()
        triggerServerEvent("getPlayerCurrentJob", localPlayer)
        local function handleGetPlayerCurrentJobResponse(currentJob)
            removeEventHandler("handleGetPlayerCurrentJobResponse", localPlayer, handleGetPlayerCurrentJobResponse)
            
            local x, y = guiGetPosition(ACTIONS_PANEL, false)
            ACTIONS_PANEL_2 = guiCreateWindow(x, y, ACTIONS_PANEL_W, ACTIONS_PANEL_H, "Seu Emprego", false);
            guiSetAlpha(ACTIONS_PANEL_2, 80)
            guiSetVisible(ACTIONS_PANEL_2, true)
            guiWindowSetSizable(ACTIONS_PANEL_2, false)
            guiWindowSetMovable(ACTIONS_PANEL_2, false)

            -- BUTTONS
            addEventHandler("onClientGUIClick", 
            guiCreateButton(0.8, 0.9, 0.2, 0.08, "Voltar", true, ACTIONS_PANEL_2), function() destroyElement(ACTIONS_PANEL_2) end)

            if(currentJob ~= nil and currentJob.jobVehicleId > 0) then
                addEventHandler("onClientGUIClick", 
                    guiCreateButton(0.6, 0.1, 0.45, 0.1, "Solicitar veículo", true, ACTIONS_PANEL_2), function() 
                        triggerServerEvent("spawnVehicle", localPlayer, currentJob.jobVehicleId)
                        toggleActionsPanel()
                    end)
            end
            
            -- LABELS
            local currentJobLabel = "Desempregado";
            if (currentJob ~= nil) then currentJobLabel = currentJob.jobTitle end
            guiCreateLabel(0.05, 0.1, 0.55, 0.4, "Emprego atual: ", true, ACTIONS_PANEL_2)
            guiLabelSetColor(
                guiCreateLabel(0.05, 0.145, 0.55, 0.4, currentJobLabel, true, ACTIONS_PANEL_2),
                200, 200, 200)

            local jobLevelLabel = "0";
            if (currentJob ~= nil) then jobLevelLabel = currentJob.levelTitle end
            guiCreateLabel(0.05, 0.22, 0.95, 0.4, "Nivel do emprego atual: ", true, ACTIONS_PANEL_2)
            guiLabelSetColor(
                guiCreateLabel(0.05, 0.265, 0.95, 0.4, jobLevelLabel, true, ACTIONS_PANEL_2),
                200, 200, 200)
                
            local progressLabel = "Você não possui progresso como desempregado";
            if (currentJob ~= nil) then 
                progressLabel = currentJob.levelProgress.."/"..currentJob.levelTotal 
            end
            guiCreateLabel(0.05, 0.34, 0.95, 0.4, "Progresso de atividades: ", true, ACTIONS_PANEL_2)
            guiLabelSetColor(
                guiCreateLabel(0.05, 0.385, 0.95, 0.4, progressLabel, true, ACTIONS_PANEL_2),
                200, 200, 200)

            if(currentJob == nil) then 
                guiLabelSetColor(guiCreateLabel(0.05, 0.540, 0.95, 0.1, "Para obter um emprego e começar a trabalhar vá", true, ACTIONS_PANEL_2), 200, 200, 200)
                guiLabelSetColor(guiCreateLabel(0.05, 0.585, 0.95, 0.1, "ao \"Ministério do Trabalho\" demarcado com a", true, ACTIONS_PANEL_2), 200, 200, 200)
                guiLabelSetColor(guiCreateLabel(0.05, 0.625, 0.95, 0.1, "letra \"T\" no mapa", true, ACTIONS_PANEL_2), 200, 200, 200)
            end
        end
        addEventHandler("handleGetPlayerCurrentJobResponse", localPlayer, handleGetPlayerCurrentJobResponse)
    end,
    "jobs"
}

local ANIMATIONS = {};
local SELECTED_ANIMATION_INDEX;
addEvent("loadAnimations", true)
addEventHandler("loadAnimations", localPlayer, function(animations, selectedIndex) ANIMATIONS = animations; SELECTED_ANIMATION_INDEX = selectedIndex end)
ACTIONS_BUTTONS[2] = {
    "Emotes",
    function()
        local x, y = guiGetPosition(ACTIONS_PANEL, false)
        ACTIONS_PANEL_2 = guiCreateWindow(x, y, ACTIONS_PANEL_W, ACTIONS_PANEL_H, "Emotes", false);
        guiSetAlpha(ACTIONS_PANEL_2, 80)
        guiSetVisible(ACTIONS_PANEL_2, true)
        guiWindowSetSizable(ACTIONS_PANEL_2, false)
        guiWindowSetMovable(ACTIONS_PANEL_2, false)

        -- BUTTONS
        addEventHandler("onClientGUIClick", 
        guiCreateButton(0.8, 0.9, 0.2, 0.08, "Voltar", true, ACTIONS_PANEL_2), function() destroyElement(ACTIONS_PANEL_2) end)

        -- LABELS
        guiCreateLabel(0.05, 0.1, 0.55, 0.4, "Escolha uma animação", true, ACTIONS_PANEL_2)

        guiLabelSetColor(guiCreateLabel(0.05, 0.24, 0.95, 0.1, "- Pressione a tecla B para iniciar a animação", true, ACTIONS_PANEL_2), 200, 200, 200)

        guiLabelSetColor(guiCreateLabel(0.05, 0.30, 0.95, 0.1, "- Para cancelar uma animação, pressione as teclas", true, ACTIONS_PANEL_2), 200, 200, 200)
        guiLabelSetColor(guiCreateLabel(0.05, 0.345, 0.95, 0.1, "de movimentação", true, ACTIONS_PANEL_2), 200, 200, 200)

        --COMBOBOX
        
        local combo = guiCreateComboBox(0.05, 0.15, 1, 0.8, "", true, ACTIONS_PANEL_2)
        addEventHandler("onClientGUIComboBoxAccepted", combo, function() 
            SELECTED_ANIMATION_INDEX = guiComboBoxGetSelected(combo) + 1
            triggerServerEvent("saveSelectedEmote", localPlayer, SELECTED_ANIMATION_INDEX)
        end)
        for i, animation in pairs(ANIMATIONS) do
            guiComboBoxAddItem(combo, i.." - "..animation[1])
        end

        if(SELECTED_ANIMATION_INDEX ~= nil) then
            guiComboBoxSetSelected(combo, SELECTED_ANIMATION_INDEX - 1)
        end
    end
}

addEvent("handleGetPlayerCarShopVehicles", true)
ACTIONS_BUTTONS[3] = {
    "Veículos",
    function()
        triggerServerEvent("getPlayerCarShopVehicles", localPlayer)
        local function handleGetPlayerCarShopVehicles(vehicles)
            removeEventHandler("handleGetPlayerCarShopVehicles", localPlayer, handleGetPlayerCarShopVehicles)
            
            local x, y = guiGetPosition(ACTIONS_PANEL, false)
            ACTIONS_PANEL_2 = guiCreateWindow(x, y, ACTIONS_PANEL_W, ACTIONS_PANEL_H, "Veículos", false);
            guiSetAlpha(ACTIONS_PANEL_2, 80)
            guiSetVisible(ACTIONS_PANEL_2, true)
            guiWindowSetSizable(ACTIONS_PANEL_2, false)
            guiWindowSetMovable(ACTIONS_PANEL_2, false)

            -- BUTTONS
            addEventHandler("onClientGUIClick", 
            guiCreateButton(0.8, 0.9, 0.2, 0.08, "Voltar", true, ACTIONS_PANEL_2), function() destroyElement(ACTIONS_PANEL_2) end)

            addEventHandler("onClientGUIClick", 
                guiCreateButton(0.6, 0.1, 0.45, 0.1, "Solicitar veículo", true, ACTIONS_PANEL_2), function() 
                    triggerServerEvent("spawnVehicle", localPlayer, getVehicleModelFromName("Faggio"))
                    toggleActionsPanel()
                end)
            
            -- LABELS
            guiLabelSetColor(
                guiCreateLabel(0.05, 0.145, 0.55, 0.4, "Em desenvolvimento", true, ACTIONS_PANEL_2),
                240, 0, 0)
        end
        addEventHandler("handleGetPlayerCarShopVehicles", localPlayer, handleGetPlayerCarShopVehicles)
    end,
    "car_shop"
}

local function createActionPanelButtons(container)
    local initialY = 0.1;
    local lineGap = 0.12;
    local numberOfLines = 6;

    local buttonsToRender = {}
    for _,button in pairs(ACTIONS_BUTTONS) do
        if(button[3] == nil or getResourceState(getResourceFromName(button[3])) == "running") then 
            table.insert(buttonsToRender, button)
        end
    end
    
    for i = 1, math.floor(#buttonsToRender + 0.5), 2 do
        local b1 = guiCreateButton(0, initialY, 0.45, 0.1, buttonsToRender[i][1] or "", true, container)
        addEventHandler("onClientGUIClick", b1, buttonsToRender[i][2], false)
        
        if(buttonsToRender[i + 1] ~= false) then
            local b2 = guiCreateButton(0.50, initialY, 0.55, 0.1, buttonsToRender[i + 1][1] or "", true, container)
            addEventHandler("onClientGUIClick", b2, buttonsToRender[i + 1][2], false)
        end

        initialY = initialY + lineGap
    end
end

local function createActionsPanel()
    -- WINDOW
    local srcWidth, srcHeight = guiGetScreenSize();
    ACTIONS_PANEL = guiCreateWindow(ACTIONS_PANEL_X, srcHeight, ACTIONS_PANEL_W, ACTIONS_PANEL_H, "Painel de Ações do "..getPlayerName(localPlayer), false);
    guiSetAlpha(ACTIONS_PANEL, 255)
    guiSetVisible(ACTIONS_PANEL, true)
    guiWindowSetMovable(ACTIONS_PANEL, false)
    guiWindowSetSizable(ACTIONS_PANEL, false)
    showCursor(false)

    createActionPanelButtons(ACTIONS_PANEL)
    outputChatBox("Pressione X para abrir ou fechar o painel do personagem", 255, 255, 255, true)    
end
addEvent("createPlayerActionsPanel", true)
addEventHandler("createPlayerActionsPanel", localPlayer, createActionsPanel);

function toggleActionsPanel()
    if(ACTIONS_PANEL == nil) then return end
    VISIBLE = not VISIBLE

    if(VISIBLE == false and ACTIONS_PANEL_2 ~= nil and ACTIONS_PANEL_2 ~= false) then destroyElement(ACTIONS_PANEL_2) ACTIONS_PANEL_2 = nil end

    local _, y = guiGetPosition(ACTIONS_PANEL, false)
    setTimer(function() 
        if(VISIBLE) then 
            y = y - ACTIONS_PANEL_ANIM_SPEED
        else
            y = y + ACTIONS_PANEL_ANIM_SPEED
        end
        
        guiSetPosition(ACTIONS_PANEL, ACTIONS_PANEL_X, y, false)
        showCursor(VISIBLE)
    end, 1, ACTIONS_PANEL_H / ACTIONS_PANEL_ANIM_SPEED)
end
bindKey("x", "up", toggleActionsPanel)

