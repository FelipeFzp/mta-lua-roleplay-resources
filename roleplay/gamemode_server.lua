local HOSPITALS_BY_ZONE = {}
HOSPITALS_BY_ZONE["Tierra Robada"] = { "-1515,2529.2,55.7" }
HOSPITALS_BY_ZONE["Bone County"] = { "-336.70001,1055.4,19.8", "-295.39999,1049.2,19.8" }
HOSPITALS_BY_ZONE["Las Venturas"] = { "1606.9,1828.1,10.8", "2506.3,1209.1,10.8" }
HOSPITALS_BY_ZONE["San Fierro"] = { "-2679.5,624.29999,14.4", "-2592.3,586,14.4", "-1555.2,1111.4,7.1" }
HOSPITALS_BY_ZONE["Red County"] = { "1223.7,302.89999,19.5" }
HOSPITALS_BY_ZONE["Whetstone"] = { "-2194.3999,-2293.8999,30.6" }
HOSPITALS_BY_ZONE["Flint County"] = HOSPITALS_BY_ZONE["Whetstone"]
HOSPITALS_BY_ZONE["Los Santos"] = { "2000.8,-1447.1,13.5","1179,-1308.8,13.7" }
HOSPITALS_BY_ZONE["Unknown"] = HOSPITALS_BY_ZONE["Los Santos"] 

function handlePlayerWasted()
    local player = source;
    local x, y, z = getElementPosition(player)

    local cameraRot, cameraRotSpeed = 0, 1
    local cameraZ, cameraZSpeed = z + 0.1, 0.1
    local respawnTime = tonumber(get("player_respawn_time"))
    local animationTimer = setTimer(function() 
        setCameraMatrix(player, x, y, cameraZ, x, y, -180, cameraRot)

        cameraRot = cameraRot + cameraRotSpeed
        cameraZ = cameraZ + cameraZSpeed
    end, 1, 0)
    fadeCamera(player, false, (respawnTime / 1000) - 1, 255, 255, 255)
    setTimer(function()
        if(isTimer(animationTimer)) then killTimer(animationTimer) end

        local availableHospitals = HOSPITALS_BY_ZONE[getElementZoneName(player, true)]
        local x, y, z = availableHospitals[math.random(1, #availableHospitals)]:match("([^,]+),([^,]+),([^,]+)")
        spawnPlayer(player, x, y, z)
        setElementHealth(player, 100)
        setCameraTarget(player)
        fadeCamera(player, true, 2)
    end, respawnTime , 1)
end
addEventHandler("onPlayerWasted", root, handlePlayerWasted)


-- VEHICLES MANAGMENT
local PLAYER_VEHICLES = {}
function handlePlayerEnterVehicle(vehicle, seat, jacked)
    local player = source;
    for _,v in pairs(PLAYER_VEHICLES[player] or {}) do
        if v == vehicle then return end
    end
    if(seat ~= 0) then return end


    if(PLAYER_VEHICLES[player] == nil) then PLAYER_VEHICLES[player] = {} end
    if(#PLAYER_VEHICLES[player] >= tonumber(get("max_veh_per_player"))) then 
        if(PLAYER_VEHICLES[player][1] ~= nil and isElement(PLAYER_VEHICLES[player][1])) then destroyElement(PLAYER_VEHICLES[player][1]) end
        table.remove(PLAYER_VEHICLES[player], 1)
    end

    table.insert(PLAYER_VEHICLES[player], vehicle)
end
addEventHandler("onPlayerVehicleEnter", getRootElement(), handlePlayerEnterVehicle)

function handlePlayerLogout()
    local player = source
    for _,vehicle in pairs(PLAYER_VEHICLES[player] or {}) do
        if(vehicle ~= nil and isElement(vehicle)) then 
            destroyElement(vehicle)
        end
    end

    PLAYER_VEHICLES[player] = nil
end
addEventHandler("onPlayerLogout", getRootElement(), handlePlayerLogout)


-- DEV UTILS
function handleGetMarkerPosition(player, command, prefix)
    local x,y,z = getElementPosition(player) 

    local ang = getPlayerRotation(player)
    local rx, ry, rz = x+math.sin(math.rad(-ang)), y+math.cos(math.rad(-ang)), z
    
    local marker = createMarker(rx, ry, rz - 1, "cylinder", 1.4, 0, 0, 240, 255, player)
    setMarkerTarget(marker, x, y, z)
    
    local text = "["..prefix.."]: "..x..","..y..","..z..","..rx..","..ry..","..rz
    outputChatBox(text, player, 255, 255, 255, true)
    outputServerLog(text)
end
addCommandHandler("getMarkerPosition", handleGetMarkerPosition)

function handleGetZoneName(player)
    local x,y,z = getElementPosition(player)
    local name = getZoneName(x, y, z, true)
    outputChatBox("Você está em: "..name, source, 255, 255, 255, true)
end
addCommandHandler("getZoneName", handleGetZoneName)