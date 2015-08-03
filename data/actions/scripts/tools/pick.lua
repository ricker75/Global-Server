function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	local iEx = Item(itemEx.uid)
	if (itemEx.uid <= 65535 or itemEx.actionid > 0) then
		if (itemEx.itemid == 354 or itemEx.itemid == 355) then
			iEx:transform(392)
			iEx:decay()
			toPosition:sendMagicEffect(CONST_ME_POFF)
		end
	elseif itemEx.itemid == 7200 then
			iEx:transform(7236)
        	iEx:decay()
       		toPosition:sendMagicEffect(CONST_ME_HITAREA)
	end
	-- Shadows of Yalahar
	if itemEx.itemid == 8933 then
		if(getPlayerStorageValue(cid, 95592) == 10) and getPlayerStorageValue(cid, 92900) < 15 then
		doCreatureSay(cid, "You have unearthed a crystal!", TALKTYPE_ORANGE_1)
		doPlayerAddItem(cid, 10169, 1)
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		setPlayerStorageValue(cid, 92900, getPlayerStorageValue(cid, 92900) + 1)
		end
	end
	-- Pythius the Rotten
	if itemEx.itemid == 9341 then
		if(getPlayerStorageValue(cid, 14201) == 1) then
		local tiles = {{x=32550,y=31373,z=15}, {x=32550,y=31374,z=15}, {x=32550,y=31375,z=15}, {x=32550,y=31376,z=15}, {x=32550,y=31377,z=15}, {x=32550,y=31378,z=15}, {x=32550,y=31379,z=15}, {x=32551,y=31373,z=15}, {x=32551,y=31374,z=15}, {x=32551,y=31375,z=15}, {x=32551,y=31376,z=15}, {x=32551,y=31377,z=15}, {x=32551,y=31378,z=15}, {x=32551,y=31379,z=15}}
		for i = 1, #tiles do
			if i > 8 and i < 15 then
				doRelocate(tiles[i], {x=tiles[i].x+1, y=i == 14 and tiles[i].y-1 or tiles[i].y, z=tiles[i].z})
			end
				doCreateItem(i == 14 and 5815 or 5815, 1, tiles[i])
			end
		py = doCreateItem(1387, {x=32551, y=31376, z=15})
		doSetItemActionId(py, 33810)
		doRemoveItem(getTileItemById({x=32552,y=31378,z=15}, 9341).uid, 1)
		doRemoveItem(getTileItemById({x=32551,y=31379,z=15}, 9341).uid, 1)
		doRemoveItem(getTileItemById({x=32551,y=31379,z=15}, 1304).uid, 1)
		end
	end
	--The Ice Islands Quest, Nibelor 1: Breaking the Ice
	if itemEx.itemid == 3621 and itemEx.actionid == 12026 then
		local tile1 = toPosition:getTile()
		local thing1 = tile1:getItemById(7185) 
		local chakoyas = {"chakoya toolshaper","chakoya tribewarden","chakoya windcaller"}
		if player:getStorageValue(12026) > 0 and player:getStorageValue(12002) < 1 and player:getStorageValue(12001) == 3  then
			player:setStorageValue(12002, player:getStorageValue(12002) + 1)
			player:setStorageValue(12026, player:getStorageValue(12026) + 1) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
			doSummonCreature(chakoyas[math.random(1, 3)], toPosition)
			toPosition:sendMagicEffect(CONST_ME_TELEPORT)
			thing1:transform(7186) 
			addEvent(function () local tile = toPosition:getTile() if tile then local thing = tile:getItemById(7186) if thing and thing:isItem() then thing:transform(7185) end end end, 60 * 1000)			
		else
			if player:getStorageValue(12002) == 1 then
				player:setStorageValue(12001, 4)
				player:setStorageValue(12002, player:getStorageValue(12002) + 1)
				player:setStorageValue(12026, 4) -- Questlog The Ice Islands Quest, Nibelor 1: Breaking the Ice
				doSummonCreature(chakoyas[math.random(1, 3)], toPosition)
				toPosition:sendMagicEffect(CONST_ME_TELEPORT)
				thing1:transform(7186) 
				addEvent(function () local tile = toPosition:getTile() if tile then local thing = tile:getItemById(7186) if thing and thing:isItem() then thing:transform(7185) end end end, 60 * 1000)	
			end
		end
	end
	return true
end
