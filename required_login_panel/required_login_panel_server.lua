function registerPlayerAccount(player, username, password)
    local account = getAccount(username, password);
    
    if(account ~= false) then
        triggerClientEvent(player, "accountCreationError", getResourceRootElement(), 
        "Este nome de usuário já está em uso!")
        return
    end

    local createdAccount = addAccount(username, password)
    if(createdAccount == false) then
        triggerClientEvent(player, "accountCreationError", getResourceRootElement(), 
        "Falha ao criar sua conta, contate o administrador.")
        return
    end

    loginPlayerAccount(player, username, password)
end
addEvent("registerPlayerAccount", true)
addEventHandler("registerPlayerAccount", getRootElement(), registerPlayerAccount)


function loginPlayerAccount(player, username, password)
    local account = getAccount(username, password);
    if(account == false) then
        triggerClientEvent(player, "accountLoginError", getResourceRootElement(), 
        "Usuário ou Senha inválidos!")
        return
    end
    
    if(isGuestAccount(account) == false) then
        triggerClientEvent(player, "playerLogin", getResourceRootElement())
    end

    local logged = logIn(player, account, password)
    if (logged == false) then
        triggerClientEvent(player, "accountLoginError", getResourceRootElement(), 
        "Falha ao efetuar login, contate o administrador.")
        return
    end

    triggerClientEvent(player, "playerLogin", getResourceRootElement())
end
addEvent("loginPlayerAccount", true)
addEventHandler("loginPlayerAccount", getRootElement(), loginPlayerAccount)


addEventHandler("onPlayerLogout", getRootElement(), 
function(playerAccount) 
    triggerClientEvent(source, "playerLogout", getResourceRootElement()) 
end)

addEventHandler("onPlayerLogin", getRootElement(), 
function(guestAccount, loggedAccount) 
    triggerClientEvent(source, "playerLogin", getResourceRootElement())
end)