local mapTexture = dxCreateTexture("img/map.png", "argb", true, "clamp")
local playerBlipTexture = dxCreateTexture("img/player_blip.png", "argb", true, "clamp")

local screenWidth, screenHeight = guiGetScreenSize() 
local mapSize = screenHeight / 1.2
local worldSize = 6000
local blipIconSize = 24
function renderMap()
    --DRAW BACKGROUND
    dxDrawRectangle(0, 0, screenWidth, screenHeight, tocolor(0, 0, 0, 180))

    --DRAW MAP
    local mapStartX, mapEndX = (screenWidth / 2) - (mapSize / 2), (screenWidth / 2) + (mapSize / 2)
    local mapStartY, mapEndY = (screenHeight / 2) - (mapSize / 2), (screenHeight / 2) + (mapSize / 2)
    local mapWidth, mapHeight = mapStartX + mapEndX, mapStartY + mapEndY
    dxDrawImage(mapStartX, mapStartY, mapSize, mapSize, mapTexture)

    --DRAW PLAYER BLIP
    local playerX, playerY, playerZ = getElementPosition(localPlayer)
    local playerRot = -getPlayerRotation(localPlayer)
    local movementFactor = mapSize
    local playerBlipX, playerBlipY = (playerX / worldSize * movementFactor) + (mapWidth / 2) - (blipIconSize / 2), (playerY * -1 / worldSize * movementFactor) + (mapHeight / 2) - (blipIconSize / 2)
	dxDrawImage(playerBlipX, playerBlipY, blipIconSize, blipIconSize, playerBlipTexture, playerRot)

    --DRAW OTHER BLIPS
    for k, blip in ipairs(getElementsByType("blip")) do
        local blipIconId = getBlipIcon(blip);
        if (blipIconId >= 5 and blipIconId <= 63) then --Is a supported blip icon
            local blipX, blipY, blipZ = getElementPosition(blip)
            local movementFactor = mapSize
            local blipBlipX, blipBlipY = (blipX / worldSize * movementFactor) + (mapWidth / 2) - (blipIconSize / 2), (blipY * -1 / worldSize * movementFactor) + (mapHeight / 2) - (blipIconSize / 2)
            dxDrawImage(blipBlipX, blipBlipY, blipIconSize, blipIconSize, "img/Blipid"..blipIconId..".png")
        end
    end
end

local showMap = false;
bindKey("tab", "up", function() 
    showMap = not showMap; 

    if(showMap) then 
        addEventHandler("onClientRender", getRootElement(), renderMap) 
    else 
        removeEventHandler("onClientRender", getRootElement(), renderMap) 
    end
end)
