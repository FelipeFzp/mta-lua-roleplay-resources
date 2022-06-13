-- EMOTES
local ANIMATIONS = {
    { "Comemorar", "benchpress", "gym_bp_celebrate", false },
    { "Ouvir", "BAR", "Barserve_order", false },
    { "Acenar para trás", "BD_Fire", "BD_GF_Wave", false },
    { "Deitar H","BEACH","ParkSit_M_loop",true},
    { "Deitar M","BEACH","ParkSit_W_loop",true },
    { "Plantar C4","BOMBER","BOM_Plant",false },
    { "Caminhar Estranho","BOX","bxhipwlk",true },
    { "Caranguejo","BSKTBALL","BBALL_def_loop",true },
    { "Caranguejo Esquerda","BSKTBALL","BBALL_def_stepL",true },
    { "Caranguejo Direita","BSKTBALL","BBALL_def_stepR",true },
    { "Atirar Agachado","BUDDY","buddy_crouchfire",false },
    { "Recarregar Agachado","BUDDY","buddy_crouchreload",false },
    { "Tiro Forte","BUDDY","buddy_fire_poor",false },
    { "Tiro de Pé","BUDDY","buddy_fire",false },
    { "Recarregar de Pé","BUDDY","buddy_reload",false },
    { "Abrir Porta","BUS","BUS_open_RHS",false },
    { "Vem Cá","CAMERA","camstnd_cmon",false },
    { "Olhar ao Redor","CAMERA","camstnd_lkabt",false },
    { "Legal","CLOTHES","CLO_Buy",false },
    { "Apertar Botão","CRIB","CRIB_Use_Switch",false },
    { "Largar corrida","CAR","flag_drop",false },
    { "Benção","CARRY","crry_prtial",true },
    { "Parada policial em carro", "CAR_CHAT" , "car_talkm_loop" , true },
    { "Concordar","COP_AMBIENT","Coplook_nod",false },
    { "Discordar","COP_AMBIENT","Coplook_shake",false },
    { "Pensar","COP_AMBIENT","Coplook_think",false },
    { "Drogado 1","CRACK","crckidle1",true },
    { "Drogado 2","CRACK","crckidle2",true },
    { "Drogado 3","CRACK","crckidle3",true },
    { "Drogado 4","CRACK","crckidle4",true },
    { "FUJA!","DAM_JUMP","Jump_Roll",false },
    { "Dança 1","DANCING","DNCE_m_a",true },
    { "Dança 2","DANCING","DNCE_m_b",true },
    { "Dança 3","DANCING","dance_loop",true },
    { "Preparado! (Boxe)","FIGHT_B","FightB_IDLE",true },
    { "Soco Rápido","FIGHT_B","FightB_1",false },
    { "Soco Forte","FIGHT_B","FightB_3",false },
    { "Preparado! (Karate)","FIGHT_C","FightC_IDLE",true },
    { "Chute de Garça","FIGHT_C","FightC_M",false },
    { "Roundhouse","FIGHT_C","FightC_3",false },
    { "Chute de Garça","FIGHT_C","FightC_M",false },
    { "Chutar Canela","FIGHT_C","FightC_1",false },
    { "Chutar Peito","FIGHT_C","FightC_2",false },
    { "Cotovelada","FIGHT_D","FightD_3",false },
    { "Chute no Saco","FIGHT_D","FightD_1",false }
}
local function loadCurrentEmote(loggedAccount)
    local player = getAccountPlayer(loggedAccount);
    local accountDataEmoteKey = "emote"
    local selectedAnimationIndex = getAccountData(loggedAccount, accountDataEmoteKey) or 1

    -- BIND ANIMATION KEYS
    bindKey(player, "W", "up", function() if(isPedOnGround(player)) then setPedAnimation(player) end end)
    bindKey(player, "A", "up", function() if(isPedOnGround(player)) then setPedAnimation(player) end end)
    bindKey(player, "S", "up", function() if(isPedOnGround(player)) then setPedAnimation(player) end end)
    bindKey(player, "D", "up", function() if(isPedOnGround(player)) then setPedAnimation(player) end end)
    bindKey(player, "B", "up", function() 
        local selectedIndex = getAccountData(loggedAccount, accountDataEmoteKey) or 1
        if(selectedIndex > #ANIMATIONS) then selectedIndex = #ANIMATIONS end

        if(isPedOnGround(player)) then 
            setPedAnimation(player, ANIMATIONS[selectedIndex][2], ANIMATIONS[selectedIndex][3], -1, ANIMATIONS[selectedIndex][4], true, true, false)
        end
    end)
    triggerClientEvent(player, "loadAnimations", player, ANIMATIONS, selectedAnimationIndex)
    addEvent("saveSelectedEmote", true)
    addEventHandler("saveSelectedEmote", player, function(newEmoteIndex)
        if(newEmoteIndex > #ANIMATIONS) then newEmoteIndex = #ANIMATIONS end

        setAccountData(loggedAccount, accountDataEmoteKey, newEmoteIndex)
    end)
end

-- COMMON
local function handleSpawnVehicle(vehicleId)
    if(isPedInVehicle(source)) then return end
    
    local x, y, z = getElementPosition(source)
    local rx, ry, rz = getElementRotation(source)
    local veh = createVehicle(vehicleId, 0, 0, 0)
    spawnVehicle(veh, x, y, z, rx, ry, rz)
    warpPedIntoVehicle(source, veh, 0)
end
addEvent("spawnVehicle", true)
addEventHandler("spawnVehicle", getRootElement(), handleSpawnVehicle)

local function handlePlayerLogin(guestAccount, loggedAccount)
    loadCurrentEmote(loggedAccount)
    
    triggerClientEvent(source, "createPlayerActionsPanel", source)
end
addEventHandler("onPlayerLogin", getRootElement(), handlePlayerLogin)