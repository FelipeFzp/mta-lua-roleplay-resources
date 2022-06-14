local previewX, previewY, previewZ = 8, -18, 9994.5
local previewRot = 0
local previewVehicle;
local previewVehicleTimer;
local function handleOpenCarShopWindow(vehiclesToSell)
    -- WINDOW
    local scrWidth, scrHeight = guiGetScreenSize()
    local windowWidth, windowHeight = 500, 400
    local window = guiCreateWindow(scrWidth - windowWidth - 20, (scrHeight - windowHeight) / 2, windowWidth, windowHeight, "Loja de Carros e Motos", false)
    local function closeWindow()
        if(isElement(previewVehicle)) then destroyElement(previewVehicle) end
        if(isTimer(previewVehicleTimer)) then killTimer(previewVehicleTimer) end
        setCameraTarget(localPlayer)
        destroyElement(window)
        showCursor(false)
        setPlayerHudComponentVisible("all", true)
        setElementFrozen(getPedOccupiedVehicle(localPlayer) or localPlayer, false)
    end
    
    -- LIST
    local carsList = guiCreateGridList(0.02, 0.08, 0.5, 0.9, true, window)
    guiGridListAddColumn(carsList, "Modelo", 0.5)
    guiGridListAddColumn(carsList, "Preço", 0.4)
    
    local previousIndex = 1
    for i, vehicle in ipairs(vehiclesToSell) do
        if(vehicle.category ~= vehiclesToSell[previousIndex].category or i == 1) then 
            local categoryHeader = guiGridListAddRow(carsList)
            guiGridListSetItemText(carsList, categoryHeader, 1, vehicle.category, true, false)
        end

        local row = guiGridListAddRow(carsList)
        guiGridListSetItemText(carsList, row, 1, vehicle.modelName, false, false)
        guiGridListSetItemText(carsList, row, 2, "R$ "..vehicle.price..",00", false, false)
        guiGridListSetItemData(carsList, row, 1, vehicle)

        if(i > 1) then previousIndex = previousIndex + 1 end
    end

    -- COLOR PICKER
    local r1, g1, b1, r2, g2, b2, r3, g3, b3 = 0, 0, 0, 255, 255, 255, 0, 0, 0
    guiCreateLabel(0.55, 0.08, 0.4, 0.04, "Vermelho", true, window)
    setElementID(guiCreateScrollBar(0.55, 0.14, 0.4, 0.05, true, true, window), "r")

    guiCreateLabel(0.55, 0.22, 0.4, 0.04, "Verde", true, window)
    setElementID(guiCreateScrollBar(0.55, 0.28, 0.4, 0.05, true, true, window), "g")

    guiCreateLabel(0.55, 0.37, 0.4, 0.04, "Azul", true, window)
    setElementID(guiCreateScrollBar(0.55, 0.43, 0.4, 0.05, true, true, window), "b")

    local color1Radio = guiCreateRadioButton(0.55, 0.50, 0.1, 0.05, "Cor 1", true, window)
    local color2Radio = guiCreateRadioButton(0.70, 0.50, 0.1, 0.05, "Cor 2", true, window)
    local color3Radio = guiCreateRadioButton(0.85, 0.50, 0.1, 0.05, "Cor 3", true, window)
    guiRadioButtonSetSelected(color1Radio, true)
    addEventHandler("onClientGUIClick", color1Radio, function() 
        guiScrollBarSetScrollPosition(getElementByID("r"), (r1 * 100) / 255)
        guiScrollBarSetScrollPosition(getElementByID("g"), (g1 * 100) / 255)
        guiScrollBarSetScrollPosition(getElementByID("b"), (b1 * 100) / 255)
    end, false)
    addEventHandler("onClientGUIClick", color2Radio, function() 
        guiScrollBarSetScrollPosition(getElementByID("r"), (r2 * 100) / 255)
        guiScrollBarSetScrollPosition(getElementByID("g"), (g2 * 100) / 255)
        guiScrollBarSetScrollPosition(getElementByID("b"), (b2 * 100) / 255)
    end, false)
    addEventHandler("onClientGUIClick", color3Radio, function() 
        guiScrollBarSetScrollPosition(getElementByID("r"), (r3 * 100) / 255)
        guiScrollBarSetScrollPosition(getElementByID("g"), (g3 * 100) / 255)
        guiScrollBarSetScrollPosition(getElementByID("b"), (b3 * 100) / 255)
    end, false)

    addEventHandler("onClientGUIScroll", window, function() 
        if(not isElement(previewVehicle)) then return end
        
        local elementId = getElementID(source)
        if(elementId == "r") then 
            if(guiRadioButtonGetSelected(color1Radio)) then r1 = (guiScrollBarGetScrollPosition(source) / 100) * 255 end
            if(guiRadioButtonGetSelected(color2Radio)) then r2 = (guiScrollBarGetScrollPosition(source) / 100) * 255 end
            if(guiRadioButtonGetSelected(color3Radio)) then r3 = (guiScrollBarGetScrollPosition(source) / 100) * 255 end
        end
        if(elementId == "g") then 
            if(guiRadioButtonGetSelected(color1Radio)) then g1 = (guiScrollBarGetScrollPosition(source) / 100) * 255 end
            if(guiRadioButtonGetSelected(color2Radio)) then g2 = (guiScrollBarGetScrollPosition(source) / 100) * 255 end
            if(guiRadioButtonGetSelected(color3Radio)) then g3 = (guiScrollBarGetScrollPosition(source) / 100) * 255 end
        end
        if(elementId == "b") then 
            if(guiRadioButtonGetSelected(color1Radio)) then b1 = (guiScrollBarGetScrollPosition(source) / 100) * 255 end
            if(guiRadioButtonGetSelected(color2Radio)) then b2 = (guiScrollBarGetScrollPosition(source) / 100) * 255 end
            if(guiRadioButtonGetSelected(color3Radio)) then b3 = (guiScrollBarGetScrollPosition(source) / 100) * 255 end
        end
        
        setVehicleColor(previewVehicle, r1, g1, b1, r2, g2, b2, r3, g3, b3, r3, g3, b3)
    end)

    -- BUTTONS
    addEventHandler("onClientGUIClick", 
    guiCreateButton(0.76, 0.9, 0.20, 0.08, "Voltar", true, window), function() 
        closeWindow()
    end, false)

    addEventHandler("onClientGUIClick", 
    guiCreateButton(0.55, 0.9, 0.20, 0.08, "Comprar", true, window), function() 
        local row, col = guiGridListGetSelectedItem(carsList)
        local vehicle = guiGridListGetItemData(carsList, row, 1)

        if(getPlayerMoney(localPlayer) < vehicle.price) then 
            outputChatBox("Você não tem dinheiro suficiente para comprar um "..getVehicleNameFromModel(vehicle.modelId)..".", 240, 0, 0, true)
            return 
        end

        closeWindow()

        local color1 = r1..","..g1..","..b1
        local color2 = r2..","..g2..","..b2
        local color3 = r3..","..g3..","..b3
        triggerServerEvent("handlePlayerBuyCar", localPlayer, vehicle.modelId, color1, color2, color3)
    end, false)
    
    -- PRICE LABEL
    local priceLabel = guiCreateLabel(0.55, 0.82, 0.45, 0.1, "", true, window)
    guiSetFont(priceLabel, "clear-normal")
    guiLabelSetColor(priceLabel, 0, 200, 0)

    -- LISTEN LIST ITEM CLICK
    addEventHandler("onClientGUIClick", carsList, function() 
        local row, col = guiGridListGetSelectedItem(carsList)
        local vehicle = guiGridListGetItemData(carsList, row, 1)
        guiSetText(priceLabel, "Preço: $"..vehicle.price..",00")
        if(vehicle == false or vehicle == nil) then return end

        if(isElement(previewVehicle)) then destroyElement(previewVehicle) end
        
        local vehicleXOffset = 3
        previewVehicle = createVehicle(vehicle.modelId, previewX + vehicleXOffset, previewY, previewZ + 1, previewRot, 0, 0, "CAR SHOP")
        setVehicleColor(previewVehicle, r1, g1, b1, r2, g2, b2, r3, g3, b3, r3, g3, b3)
        setElementFrozen(previewVehicle, true)
        setElementFrozen(getPedOccupiedVehicle(localPlayer) or localPlayer, true)
        
        setCameraMatrix(previewX + 10, previewY + 8, previewZ + 2, previewX, previewY, previewZ)
        
        if(isTimer(previewVehicleTimer)) then killTimer(previewVehicleTimer) end
        previewVehicleTimer = setTimer(function() 
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