function handleGetMarkerPosition(player, command, prefix)
    local x, y, z = getElementPosition(player)
    z = z - 2

    local ang = getElementRotation(player)
    local rx, ry, rz = x + math.sin(math.rad(-ang)), y + math.cos(math.rad(-ang)), z

    local marker = createMarker(rx, ry, rz, "cylinder", 1.4, 0, 0, 240, 255, player)
    setMarkerTarget(marker, x, y, z)

    local text = "[" .. prefix .. "]: " .. x .. "," .. y .. "," .. z .. "," .. rx .. "," .. ry .. "," .. rz
    outputChatBox(text, player, 255, 255, 255, true)
    outputServerLog(text)
end
addCommandHandler("getMarkerPosition", handleGetMarkerPosition)

function handleGetZoneName(player)
    local x, y, z = getElementPosition(player)
    local name = getZoneName(x, y, z, true)
    outputChatBox("Você está em: " .. name, source, 255, 255, 255, true)
end

addCommandHandler("getZoneName", handleGetZoneName)