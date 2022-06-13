local function handleOpenCarShopWindow(vehiclesToSell)
    outputChatBox("Opening Car Shop Window..."..#vehiclesToSell)
end
addEvent("openCarShopWindow", true)
addEventHandler("openCarShopWindow", getRootElement(), handleOpenCarShopWindow)