stopMoveStorage = 100000

function Player.allowMovement(self, param)
	return self:setStorageValue(stopMoveStorage, param and 0 or 1)
end

function Player.hasAllowMovement(self)
	if self:getStorageValue(stopMoveStorage) == 1 then
		return false
	end
	return true
end

function getBaseVocation(vocationId)
	if vocationId == 0 then
		return 0
	end

	return (vocationId - 1) % 4 + 1
end

function Player.withdrawMoney(self, amount)
	local balance = self:getBankBalance()
	if amount > balance or not self:addMoney(amount) then
		return false
	end

	self:setBankBalance(balance - amount)
	return true
end

function Player.depositMoney(self, amount)
	if not self:removeMoney(amount) then
		return false
	end

	self:setBankBalance(self:getBankBalance() + amount)
	return true
end

function playerExists(name)
	local a = db.storeQuery('SELECT `name` FROM `players` WHERE `name` = ' .. db.escapeString(name))
	if a then
		result.free(a)
		return true
	end
end

function Player.transferMoneyTo(self, target, amount)
	local balance = self:getBankBalance()
	if amount > balance then
		return false
	end

	local targetPlayer = Player(target)
	if targetPlayer then
		targetPlayer:setBankBalance(targetPlayer:getBankBalance() + amount)
	else
		if not playerExists(target) then
			return false
		end
		db.query("UPDATE `players` SET `balance` = `balance` + '" .. amount .. "' WHERE `name` = " .. db.escapeString(target))
	end

	self:setBankBalance(self:getBankBalance() - amount)
	return true
end

function isValidMoney(money)
	return (isNumber(money) and money > 0 and money < 4294967296)
end

function getMoneyCount(string)
	local b, e = string:find("%d+")
	local money = b and e and tonumber(string:sub(b, e)) or -1
	if isValidMoney(money) then
		return money
	end
	return -1
end

function getMoneyWeight(money)
	local gold = money
	local crystal = math.floor(gold / 10000)
	gold = gold - crystal * 10000
	local platinum = math.floor(gold / 100)
	gold = gold - platinum * 100
	return (ItemType(2160):getWeight() * crystal) + (ItemType(2152):getWeight() * platinum) + (ItemType(2148):getWeight() * gold)
end

function getRealTime()
	local hours = tonumber(os.date("%H", os.time()))
	local minutes = tonumber(os.date("%M", os.time()))

	if hours < 10 then
		hours = '0' .. hours
	end
	if minutes < 10 then
		minutes = '0' .. minutes
	end
	return hours .. ':' .. minutes
end

function getRealDate()
	local month = tonumber(os.date("%m", os.time()))
	local day = tonumber(os.date("%d", os.time()))

	if month < 10 then
		month = '0' .. month
	end
	if day < 10 then
		day = '0' .. day
	end
	return day .. '/' .. month
end

function isPlayerInArea(fromPos, toPos)
	for _x = fromPos.x, toPos.x do
		for _y = fromPos.y, toPos.y do
			for _z = fromPos.z, toPos.z do
				creature = getTopCreature({x = _x, y = _y, z = _z})
					if (creature.type == THING_TYPE_PLAYER) then
					return true
				end
			end
		end
	end
	return false
end

function isMonsterInArea(fromPos, toPos, showMonsters, disableSummons)
	for _x = fromPos.x, toPos.x do
		for _y = fromPos.y, toPos.y do
			for _z = fromPos.z, toPos.z do
				creature = getTopCreature({x = _x, y = _y, z = _z})
					if (creature.type == 2 and showMonsters and (not disableSummons or (disableSummons and getCreatureMaster(creature.uid) == (creature.uid)))) then
					return true
				end
			end
		end
	end
	return false
end

function doPlayerGnomishRank(cid)
	local player = Player(cid)
	if player:getStorageValue(Storage.BigfootBurden.Rank) >= 30 then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 14 then
			player:setStorageValue(Storage.BigfootBurden.QuestLine, 15)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	elseif player:getStorageValue(Storage.BigfootBurden.Rank) >= 120 then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 15 then
			player:setStorageValue(Storage.BigfootBurden.QuestLine, 16)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	elseif player:getStorageValue(Storage.BigfootBurden.Rank) >= 480 then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 16 then
			player:setStorageValue(Storage.BigfootBurden.QuestLine, 17)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	elseif player:getStorageValue(Storage.BigfootBurden.Rank) >= 1440 then
		if player:getStorageValue(Storage.BigfootBurden.QuestLine) == 17 then
			player:setStorageValue(Storage.BigfootBurden.QuestLine, 18)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
		end
	end
	return true
end

function teleportAllPlayersFromArea(fromArea, toPos)
	for x = fromArea[1].x, fromArea[2].x do
		for y = fromArea[1].y, fromArea[2].y do
			for z = fromArea[1].z, fromArea[2].z do
				if(getThingfromPos({x = x, y = y, z = z, stackpos = 255}).uid > 0) then
					if(isPlayer(getThingfromPos({x = x, y = y, z = z, stackpos = 255}).uid)) then
					doTeleportThing(getThingfromPos({x = x, y = y, z = z, stackpos = 255}).uid, toPos)
					doSendMagicEffect(toPos, CONST_ME_TELEPORT)
					doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You were teleported out by the gnomish emergency device.")
					end
				end
			end
		end
	end
	return true
end

function removeBoss(fromArea, bossName)
	for x = fromArea[1].x, fromArea[2].x do
		for y = fromArea[1].y, fromArea[2].y do
			for z = fromArea[1].z, fromArea[2].z do
				if(getThingfromPos({x = x, y = y, z = z, stackpos = 255}).uid > 0) then
					if(isMonster(getThingfromPos({x = x, y = y, z = z, stackpos = 255}).uid)) then
						if(string.lower(getCreatureName(getThingfromPos({x = x, y = y, z = z, stackpos = 255}).uid)) == bossName) then
						doRemoveCreature(getThingfromPos({x = x, y = y, z = z, stackpos = 255}).uid)
						end
					end
				end
			end
		end
	end
	return true
end

function clearArena(fromPos, toPos)
	if(getGlobalStorageValue(3157) == 1) then
		for x = fromPos.x, toPos.x do
			for y = fromPos.y, toPos.y do
				for z = fromPos.z, toPos.z do
					if(getTopCreature({x = x, y = y, z = z}).uid > 0) then
						if(isPlayer(getTopCreature({x = x, y = y, z = z}).uid)) then
							doTeleportThing(getTopCreature({x = x, y = y, z = z}).uid, {x = 33049, y = 31017, z = 2})
							doSendMagicEffect({x = 33049, y = 31017, z = 2}, CONST_ME_TELEPORT)
						else
							doRemoveCreature(getTopCreature({x = x, y = y, z = z}).uid)
							end
						end
					end
				end
			end
		setGlobalStorageValue(3157, 0)
	end
	return true
end

function isNpcInArea(NpcName, fromPos, toPos)
	for _x = fromPos.x, toPos.x do
		for _y = fromPos.y, toPos.y do
			for _z = fromPos.z, toPos.z do
				creature = getTopCreature({x = _x, y = _y, z = _z})
				if creature.type == THING_TYPE_NPC and getCreatureName(creature.uid):lower() == NpcName:lower() then
				return true
				end
			end
		end
	end
	return false
end

function doCopyItem(item, attributes)
	local attributes = attributes or false
	local ret = doCreateItemEx(item.itemid, item.type)
	
	if(attributes) then
		if(item.actionid > 0) then
			doSetItemActionId(ret, item.actionid)
		end
	end

	if(isContainer(item.uid) == TRUE) then
		for i = (getContainerSize(item.uid) - 1), 0, -1 do
			local tmp = getContainerItem(item.uid, i)
				if(tmp.itemid > 0) then
				doAddContainerItemEx(ret, doCopyItem(tmp, true).uid)
			end
		end
	end
	return getThing(ret)
end

function isMonsterInRange(monsterName, fromPos, toPos)
	for _x = fromPos.x, toPos.x do
		for _y = fromPos.y, toPos.y do
			for _z = fromPos.z, toPos.z do
				creature = getTopCreature({x = _x, y = _y, z = _z})
				if creature.type == THING_TYPE_MONSTER and getCreatureName(creature.uid):lower() == monsterName:lower() then
				return true
				end
			end
		end
	end
	return false
end

function getCreaturesInRange(position, radiusx, radiusy, showMonsters, showPlayers, showSummons)
	local creaturesList = {}
        for x = -radiusx, radiusx do
			for y = -radiusy, radiusy do
				if not (x == 0 and y == 0) then
					local creature = getTopCreature({x = position.x + x, y = position.y + y, z = position.z})
						if (creature.type == 1 and showPlayers) or (creature.type == 2 and showMonsters and (not showSummons or (showSummons and getCreatureMaster(creature.uid) == (creature.uid)))) then
						table.insert(creaturesList, creature.uid)
					end
				end
			end
        end

	local creature = getTopCreature(position)
        if (creature.type == 1 and showPlayers) or (creature.type == 2 and showMonsters and not (showSummons or (showSummons and getCreatureMaster(creature.uid) == (creature.uid)))) then
			if not(table.find(creaturesList, creature.uid)) then
			table.insert(creaturesList, creature.uid)
		end
	end
	return creaturesList
end

function getCreaturesInArea(ext1, ext2, player)
	local creatures = {}
	for xA = 0, ext2.x - ext1.x do
		for yA = 0, ext2.y - ext1.y do
			local tile = Tile({x = ext1.x + xA, y = ext1.y + yA, z = ext1.z})
			if tile then
				for _, cid in pairs(tile:getCreatures() or {}) do
					if not player then
						table.insert(creatures, cid)
					elseif cid:isPlayer() then
						table.insert(creatures, cid)
					end
				end
			end
		end
	end
	return creatures
end

function Vocation.getBase(self)
	local demotion = self:getDemotion()
	while demotion do
		local tmp = demotion:getDemotion()
		if not tmp then
			return demotion
		end
		demotion = tmp
	end
	return self
end

function Vocation.getPromotionId(self)
	local promotion = self:getPromotion()
	return promotion and promotion:getId() or 0
end

-- Game --
function Game.getPlayersByIPAddress(ip, mask)
	if not mask then mask = 0xFFFFFFFF end
	local masked = bit.band(ip, mask)
	local result = {}
	for _, player in ipairs(Game.getPlayers()) do
		if bit.band(player:getIp(), mask) == masked then
			result[#result + 1] = player
		end
	end
	return result
end

function Game.getPlayersByAccountNumber(accountNumber)
	local result = {}
	for _, player in ipairs(Game.getPlayers()) do
		if player:getAccountId() == accountNumber then
			result[#result + 1] = player
		end
	end
	return result
end

function Game.getHouseByPlayerGUID(playerGUID)
	for _, house in ipairs(Game.getHouses()) do
		if house:getOwnerGuid() == playerGUID then
			return house
		end
	end
	return nil
end

-- Item --
function Item.setText(self, text)
	if text ~= '' then
		self:setAttribute(ITEM_ATTRIBUTE_TEXT, text)
	else
		self:removeAttribute(ITEM_ATTRIBUTE_TEXT)
	end
end

function Item.setDescription(self, description)
	if description ~= '' then
		self:setAttribute(ITEM_ATTRIBUTE_DESCRIPTION, description)
	else
		self:removeAttribute(ITEM_ATTRIBUTE_DESCRIPTION)
	end
end