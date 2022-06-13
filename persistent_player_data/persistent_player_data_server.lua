local HEALTH_KEY, ARMOR_KEY, MONEY_KEY, WEAPONS_KEY, WEAPON_SLOT_KEY, POSITION_KEY, SKIN_KEY = "health", "armor", "money", "weapons", "currentWeaponSlot", "position", "skin"
local INITIAL_MONEY = 1000
local INITIAL_POSITION = "1629,-1381,1000"
local INITIAL_SKINS = {
    147, 170, 188, --MEN
    193, 169, 91 --WOMAN
}

function handlePlayerLogout(playerAccount)
    local health = getElementHealth(source)
    if(health <= 0) then health = 100 end
    setAccountData(playerAccount, HEALTH_KEY, health);

    local armor = getPedArmor(source)
    setAccountData(playerAccount, ARMOR_KEY, armor);

    local money = getPlayerMoney(source)
    setAccountData(playerAccount, MONEY_KEY, money);

    local weapons = getPlayerWeapons(source)
    setAccountData(playerAccount, WEAPONS_KEY, weapons);

    local weaponSlot = getPedWeaponSlot(source)
    setAccountData(playerAccount, WEAPON_SLOT_KEY, weaponSlot);

    local position = getPlayerPosition(source)
    setAccountData(playerAccount, POSITION_KEY, position);

    local skin = getElementModel(source)
    setAccountData(playerAccount, SKIN_KEY, skin);
end
addEventHandler("onPlayerLogout", getRootElement(), handlePlayerLogout)
addEventHandler("onPlayerQuit", getRootElement(), function() 
    local playerAccount = getPlayerAccount(source)
    handlePlayerLogout(playerAccount)
end)

function handlePlayerLogin()
    local player = source
    local playerAccount = getPlayerAccount(source)
    
    local position = getAccountData(playerAccount, POSITION_KEY) or INITIAL_POSITION
    local x, y, z = position:match("([^,]+),([^,]+),([^,]+)")
    spawnPlayer(player, x, y, z + 2, 0, skin)
    if(position == INITIAL_POSITION) then giveWeapon(player, getWeaponIDFromName("parachute"), 1, true) end


end
addEventHandler("onPlayerLogin", getRootElement(), handlePlayerLogin)

function handlePlayerSpawn()
    local player = source
    local playerAccount = getPlayerAccount(source)
    local weapons = getAccountData(playerAccount, WEAPONS_KEY) or nil
    if(weapons ~= nil) then 
        for k, weapon in ipairs(fromJSON(weapons)) do
            giveWeapon(player, weapon.id, weapon.ammo)
            setWeaponAmmo(player, weapon.id, weapon.ammo, weapon.clipAmmo)
        end
    end

    local weaponSlot = getAccountData(playerAccount, WEAPON_SLOT_KEY) or 0
    setPedWeaponSlot(player, weaponSlot)

    local skin = getAccountData(playerAccount, SKIN_KEY) or math.random(1, #INITIAL_SKINS)
    setElementModel(player, skin)

    local health = getAccountData(playerAccount, HEALTH_KEY) or 100
    if(health <= 0) then health = 100 end
    setElementHealth(player, health)

    local armor = getAccountData(playerAccount, ARMOR_KEY) or 0
    setPedArmor(player, armor)
    
    local money = getAccountData(playerAccount, MONEY_KEY) or INITIAL_MONEY
    setPlayerMoney(player, money, true)
end
addEventHandler("onPlayerSpawn", getRootElement(), handlePlayerSpawn)

-- UTILS
function getPlayerWeapons(player)
    local weapons = {}
    for i = 0, 12 do
        local weapon = {}
        weapon.id = getPedWeapon(player, i)
        weapon.ammo = getPedTotalAmmo(player, i)
        weapon.clipAmmo = getPedAmmoInClip(player, i)
        
        table.insert(weapons, weapon)
    end

    return toJSON(weapons)
end 

function getPlayerPosition(player)
    local x, y, z = getElementPosition(player)

    return x..","..y..","..z
end 