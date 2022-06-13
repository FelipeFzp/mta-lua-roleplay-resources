local FADE_TIME = 800

function createLoginTab(tabPanel)
    local tab = guiCreateTab("Já possuo conta", tabPanel)

    guiCreateLabel(0.05, 0.05, 0.9, 0.1, "Digite seu usuário", true, tab)
    local loginEdit = guiCreateEdit(0.05, 0.1, 0.9, 0.1, "", true, tab)

    guiCreateLabel(0.05, 0.25, 0.9, 0.1, "Digite sua senha", true, tab)
    local passwordEdit = guiCreateEdit(0.05, 0.3, 0.9, 0.1, "", true, tab)
    guiEditSetMasked(passwordEdit, true)

    local errorLabel = guiCreateLabel(0.05, 0.42, 1, 0.1, "", true, tab)
    guiLabelSetColor(errorLabel,250, 0, 0)
    guiSetVisible(errorLabel, false)

    addEvent("accountLoginError", true)
    addEventHandler("accountLoginError", getResourceRootElement(), 
    function(errorMessage)
        guiSetText(loginEdit, "")
        guiSetText(passwordEdit, "")
        guiSetText(errorLabel, errorMessage)
        guiSetVisible(errorLabel, true)
    end)

    addEventHandler("onClientGUIClick", 
    guiCreateButton(0.05, 0.85, 0.9, 0.1, "Fazer Login", true, tab), 
    function() 
        local userName = guiGetText(loginEdit);
        local password = guiGetText(passwordEdit);

        triggerServerEvent("loginPlayerAccount", getResourceRootElement(), localPlayer, userName, password)
    end, false, "normal")
end

function createRegisterTab(tabPanel)
    local tab = guiCreateTab("Criar minha conta", tabPanel)

    guiCreateLabel(0.05, 0.05, 0.9, 0.1, "Digite seu usuário", true, tab)
    local loginEdit = guiCreateEdit(0.05, 0.1, 0.9, 0.1, "", true, tab)

    guiCreateLabel(0.05, 0.25, 0.9, 0.1, "Digite sua senha", true, tab)
    local passwordEdit = guiCreateEdit(0.05, 0.3, 0.9, 0.1, "", true, tab)
    guiEditSetMasked(passwordEdit, true)

    guiCreateLabel(0.05, 0.455, 0.9, 0.1, "Confirme sua senha", true, tab)
    local passwordConfirmationEdit = guiCreateEdit(0.05, 0.55, 0.9, 0.1, "", true, tab)
    guiEditSetMasked(passwordConfirmationEdit, true)

    local errorLabel = guiCreateLabel(0.05, 0.67, 1, 0.1, "Falha ao criar conta", true, tab)
    guiLabelSetColor(errorLabel,250, 0, 0)
    guiSetVisible(errorLabel, false)

    addEvent("accountCreationError", true)
    addEventHandler("accountCreationError", getResourceRootElement(), 
    function(errorMessage)
        guiSetText(errorLabel, errorMessage)
        guiSetVisible(errorLabel, true)
    end)

    addEventHandler("onClientGUIClick", 
    guiCreateButton(0.05, 0.85, 0.9, 0.1, "Registrar-se", true, tab), 
    function() 
        guiSetVisible(errorLabel, false)
        local userName = guiGetText(loginEdit);
        local password = guiGetText(passwordEdit);
        local passwordConfirmation = guiGetText(passwordConfirmationEdit);

        if(#password >= 4 == false) then
            guiSetText(errorLabel, "A senha precisa ter no minimo 4 digitos.")
            guiSetVisible(errorLabel, true)
            return
        end

        if(password ~= passwordConfirmation) then
            guiSetText(errorLabel, "As senhas informadas não conferem.")
            guiSetVisible(errorLabel, true)
            return
        end

        triggerServerEvent("registerPlayerAccount", getResourceRootElement(), localPlayer, userName, password)
    end, false, "normal")
end

local ACCESS_PANEL
function createAccessPanel()
    if(ACCESS_PANEL ~= nil) then destroyElement(ACCESS_PANEL) end

    fadeCamera(false, 0)
    setTimer(function() fadeCamera(true, FADE_TIME / 1000) end, FADE_TIME, 1)
    
    setPlayerHudComponentVisible("all", false)
    setTimer(function()
        local x, y = math.random(-2000, 2000), math.random(-2000, 2000)
        setCameraMatrix(x, y, 200, 0, 0, -500, 0, 90)
    end, 500, 1)

    -- WINDOW
    local srcWidth, srcHeight = guiGetScreenSize();
    local winWidth, winHeight = 300, 400;
    local centerX, centerY = (srcWidth / 2) - (winWidth / 2), (srcHeight / 2) - (winHeight / 2) 
    ACCESS_PANEL = guiCreateWindow(centerX, centerY, winWidth, winHeight, "Login", false);
    local tabPanel = guiCreateTabPanel(0.05,0.05, 0.95, 0.95, true, ACCESS_PANEL)
    createLoginTab(tabPanel)
    createRegisterTab(tabPanel)
    
    guiWindowSetMovable(ACCESS_PANEL, false)
    guiSetVisible(ACCESS_PANEL, true)
    showCursor(true)
end
addEventHandler("onClientResourceStart", getResourceRootElement(), createAccessPanel)

addEvent("playerLogout", true)
addEventHandler("playerLogout", getResourceRootElement(), function()
    outputChatBox("Você fez logout. Faça login para continuar jogando.", 240, 0, 0, true)
    createAccessPanel()
end)

addEvent("playerLogin", true)
addEventHandler("playerLogin", getResourceRootElement(), function()
    fadeCamera(false, 0)
    setTimer(function() fadeCamera(true, FADE_TIME / 1000) end, FADE_TIME, 1)
    showCursor(false)
    destroyElement(ACCESS_PANEL)
    outputChatBox("Bem vindo #0072FF"..getPlayerName(localPlayer).."#FFFFFF. Você fez login com sucesso!", 255, 255, 255, true)
    setCameraTarget(localPlayer)
    setPlayerHudComponentVisible("all", true)
end)

function handleLoginChatMessages(text)
    if (tostring(text):lower() == "login: you successfully logged in" ) then 
        cancelEvent() 
        return
    end  
    if (tostring(text):lower() == "logout: you logged out" ) then 
        cancelEvent() 
        return
    end
end
addEventHandler("onClientChatMessage", root, handleLoginChatMessages)