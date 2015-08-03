function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local targetItem = Item(itemEx.uid)
	-- In Service Of Yalahar Quest
	if(itemEx.uid == 3071) then
		if(getPlayerStorageValue(cid, 26) < 1) then
			doSetMonsterOutfit(cid, "skeleton", 3 * 1000)
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_ENERGYHIT)
			for x = -1, 1 do
				for y = -1, 1 do
					doSendMagicEffect({x = getPlayerPosition(cid).x + x, y = getPlayerPosition(cid).y + y, z = getPlayerPosition(cid).z}, CONST_ME_YELLOWENERGY)
				end
			end
			setPlayerStorageValue(cid, 26, 1)
		end
	elseif(itemEx.uid == 3072) then
		if(getPlayerStorageValue(cid, 27) < 1) then
			for x = -1, 1 do
				for y = -1, 1 do
					if(math.random(1, 2) == 2) then
						doSummonCreature("rat", {x = getPlayerPosition(cid).x + x, y = getPlayerPosition(cid).y + y, z = getPlayerPosition(cid).z})
						doSendMagicEffect({x = getPlayerPosition(cid).x + x, y = getPlayerPosition(cid).y + y, z = getPlayerPosition(cid).z}, CONST_ME_TELEPORT)
					end
				end
			end
			setPlayerStorageValue(cid, 27, 1)
		end
	elseif(itemEx.uid == 3073) then
		if(getPlayerStorageValue(cid, 28) < 1) then
			doCreatureSay(cid, "You have used the crowbar on a grate.", TALKTYPE_ORANGE_1)
			setPlayerStorageValue(cid, 28, 1)
		end
	elseif(itemEx.uid == 3074) then
		if(getPlayerStorageValue(cid, 29) < 1) then
			doSetMonsterOutfit(cid, "bog raider", 5 * 1000)
			doCreatureSay(cid, "You have used the crowbar on a knot.", TALKTYPE_ORANGE_1)
			setPlayerStorageValue(cid, 29, 1)
		end
	end
	-- Secret Service Quest
	if itemEx.actionid == 12566 and player:getStorageValue(Storage.secretService.TBIMission06) == 1 then
		local playerOutfit = player:getOutfit()
		local yelling = Position(32204, 31157, 8)
		if playerOutfit.lookType == 137 then -- amazon lookType
			player:setStorageValue(Storage.secretService.TBIMission06, 2)
			Game.createMonster('barbarian skullhunter', yelling) -- say
			player:say("Nooooo! What have you done??", TALKTYPE_MONSTER_SAY, false, 0, yelling)
			Game.createMonster('barbarian skullhunter', Position(32204, 31156, 8))
		end
	end
	return true
end