local previewX, previewY, previewZ = 0, 0, 2000
local previewRot = 0
local previewVehicle;
local previewVehicleTimer;
local function handleOpenCarShopWindow(vehiclesToSell)
    outputChatBox("Opening Car Shop Window..."..#vehiclesToSell)
    -- WINDOW
    local scrWidth, scrHeight = guiGetScreenSize()
    local windowWidth, windowHeight = 500, 400
    local window = guiCreateWindow(scrWidth - windowWidth - 20, (scrHeight - windowHeight) / 2, windowWidth, windowHeight, "Loja de Carros e Motos", false)

    -- BUTTON
    addEventHandler("onClientGUIClick", 
    guiCreateButton(0.8, 0.9, 0.2, 0.08, "Voltar", true, window), function() 
        if(isElement(previewVehicle)) then destroyElement(previewVehicle) end
        if(isTimer(previewVehicleTimer)) then killTimer(previewVehicleTimer) end
        setCameraTarget(localPlayer)
        destroyElement(window)
        showCursor(false)
        setPlayerHudComponentVisible("all", true)
    end)

    -- LIST
    local carsList = guiCreateGridList(0.02, 0.08, 0.5, 0.9, true, window)
    guiGridListAddColumn(carsList, "Modelo", 0.5)
    guiGridListAddColumn(carsList, "Preço", 0.4)
    for i, vehicle in ipairs(vehiclesToSell) do
        local row = guiGridListAddRow(carsList)
        guiGridListSetItemText(carsList, row, 1, getVehicleNameFromModel(vehicle.modelId), false, false)
        guiGridListSetItemText(carsList, row, 2, "R$ "..vehicle.price..",00", false, false)
    end

    -- LISTEN LIST ITEM CLICK
    addEventHandler("onClientGUIClick", carsList, function() 
        local row, col = guiGridListGetSelectedItem(carsList)
        local vehicle = vehiclesToSell[row + 1]
        if(vehicle == false or vehicle == nil) then return end

        outputChatBox("Você solicitou o veículo "..vehicle.modelId)
        if(isElement(previewVehicle)) then destroyElement(previewVehicle) end
        
        local vehicleXOffset = 3
        previewVehicle = createVehicle(vehicle.modelId, previewX + vehicleXOffset, previewY, previewZ, previewRot, 0, 0, "CARSHOP")
        setElementFrozen(previewVehicle, true)
        
        local cameraZoom = 10
        local cameraAngle = 180
        local rx, ry, rz = previewX+math.sin(math.rad(cameraAngle)) + cameraZoom, previewY+math.cos(math.rad(cameraAngle)) + cameraZoom, previewZ
        setCameraMatrix(rx, ry, rz, previewX, previewY, previewZ)
        
        if(isTimer(previewVehicleTimer)) then killTimer(previewVehicleTimer) end
        previewVehicleTimer = setTimer(function() 
            outputChatBox(toJSON(previewRot), 255, 255, 255, true)
            previewRot = previewRot + 1
            setElementRotation(previewVehicle, 0, 0, previewRot)
            if(previewRot > 360) then previewRot = 0 end
        end, 1, 0)
    end)

    guiWindowSetSizable(window, false)
    guiWindowSetMovable(window, false)
    setPlayerHudComponentVisible("all", false)
    guiSetVisible(window, true)
    showCursor(true)
end
addEvent("openCarShopWindow", true)
addEventHandler("openCarShopWindow", getRootElement(), handleOpenCarShopWindow)