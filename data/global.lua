math.randomseed(os.time())
dofile('data/lib/lib.lua')

NOT_MOVEABLE_ACTION = 100
PARTY_PROTECTION = 1 -- Set to 0 to disable.
ADVANCED_SECURE_MODE = 1 -- Set to 0 to disable.

NORTH = DIRECTION_NORTH
EAST = DIRECTION_EAST
SOUTH = DIRECTION_SOUTH
WEST = DIRECTION_WEST
SOUTHWEST = DIRECTION_SOUTHWEST
SOUTHEAST = DIRECTION_SOUTHEAST
NORTHWEST = DIRECTION_NORTHWEST
NORTHEAST = DIRECTION_NORTHEAST

STORAGEVALUE_PROMOTION = 30018

SERVER_NAME = configManager.getString(configKeys.SERVER_NAME)

-- Bestiary charm
GLOBAL_CHARM_GUT = 0
GLOBAL_CHARM_SCAVENGE = 0

--WEATHER
weatherConfig = {
    groundEffect = CONST_ME_LOSEENERGY,
	fallEffect = CONST_ANI_SMALLICE,
    thunderEffect = configManager.getBoolean(configKeys.WEATHER_THUNDER),
    minDMG = 1,
    maxDMG = 5
}

-- Event Schedule
SCHEDULE_LOOT_RATE = 100
SCHEDULE_EXP_RATE = 100
SCHEDULE_SKILL_RATE = 100

-- MARRY
PROPOSED_STATUS = 1
MARRIED_STATUS = 2
PROPACCEPT_STATUS = 3
LOOK_MARRIAGE_DESCR = TRUE
ITEM_WEDDING_RING = 2121
ITEM_ENGRAVED_WEDDING_RING = 10502

-- Scarlett Etzel
SCARLETT_MAY_TRANSFORM = 0
SCARLETT_MAY_DIE = 0

ropeSpots = {386, 421, 7762, 12202, 12936, 14238, 17238, 21501, 21965, 21966, 21967, 21968, 23363, 24358}
specialRopeSpots = {12935}

-- Impact Analyser
-- Every 2 seconds
updateInterval = 2
-- Healing
-- Global table to insert data
healingImpact = {}
-- Damage
-- Global table to insert data
damageImpact = {}

-- New prey => preyTimeLeft
nextPreyTime = {}

do -- Event Schedule rates
	local lootRate = Game.getEventSLoot()
	if lootRate ~= 100 then
		SCHEDULE_LOOT_RATE = lootRate
	end

	local expRate = Game.getEventSExp()
	if expRate ~= 100 then
		SCHEDULE_EXP_RATE = expRate
	end

	local skillRate = Game.getEventSSkill()
	if skillRate ~= 100 then
		SCHEDULE_SKILL_RATE = skillRate
	end
end

table.contains = function(array, value)
	for _, targetColumn in pairs(array) do
		if targetColumn == value then
			return true
		end
	end
	return false
end

string.split = function(str, sep)
	local res = {}
	for v in str:gmatch("([^" .. sep .. "]+)") do
		res[#res + 1] = v
	end
	return res
end

string.splitTrimmed = function(str, sep)
	local res = {}
	for v in str:gmatch("([^" .. sep .. "]+)") do
		res[#res + 1] = v:trim()
	end
	return res
end

string.trim = function(str)
	return str:match'^()%s*$' and '' or str:match'^%s*(.*%S)'
end

-- Stamina
if nextUseStaminaTime == nil then
	nextUseStaminaTime = {}
end

if nextUseStaminaPrey == nil then
	nextUseStaminaPrey = {}
end

if nextUseXpStamina == nil then
	nextUseXpStamina = {}
end

if lastItemImbuing == nil then
	lastItemImbuing = {}
end

if nextDelayPreyReroll == nil then
	nextDelayPreyReroll = {}
end

-- Delay potion
if not playerDelayPotion then
	playerDelayPotion = {}
end

-- this is a fix for lua52 or higher which has the function renamed to table.unpack, while luajit still uses unpack
if unpack == nil then
	unpack = table.unpack
end
