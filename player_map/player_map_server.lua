local function handlePlayerLogin(guestAccount, loggedAccount)
    setTimer(function() outputChatBox("Pressione TAB para abrir o mapa", source, 255, 255, 255, true) end, 2000, 1)
end
addEventHandler("onPlayerLogin", getRootElement(), handlePlayerLogin)