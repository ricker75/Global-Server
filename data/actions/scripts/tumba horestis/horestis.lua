local config = {
	randomText = {"Waaaaaah", "You are too afraid to destroy this object"},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)

local exaustedSeconds = 10
local player = Player(cid)
local chances = math.random(20)

if item.actionid == 56530 then 	
	if(item.itemid == 13736) then	
		if getPlayerStorageValue(cid, 324329) <= os.time() then
			if chances == 1 then						
			doTransformItem(item.uid, 13495)					
			setGlobalStorageValue(56530, 1)
		else	
			player:say(config["randomText"][math.random(#config["randomText"])], TALKTYPE_ORANGE_1)
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
			setPlayerStorageValue(cid, 324329, os.time()+exaustedSeconds*60)
		end
	else
			doPlayerSendCancel(cid, "You need wait 10 minutes to use again.")
		end
	end

elseif item.actionid == 56531 then
	if(item.itemid == 13500) then 
		if(getGlobalStorageValue(56530) == 1) then	
			if getPlayerStorageValue(cid, 324330) <= os.time() then
				if chances == 1 then								
				doTransformItem(item.uid, 13495) 					
				setGlobalStorageValue(56530, 2)
			else
				player:say(config["randomText"][math.random(#config["randomText"])], TALKTYPE_ORANGE_1)
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				setPlayerStorageValue(cid, 324330, os.time()+exaustedSeconds*60)
				end
			else
				doPlayerSendCancel(cid, "You need wait 10 minutes to use again.")
				end
			else
				doPlayerSendCancel(cid, "You need to break the first jar.")
		end
	end

elseif item.actionid == 56532 then 	
	if(item.itemid == 13500) then 						
		if(getGlobalStorageValue(56530) == 2) then
			if getPlayerStorageValue(cid, 324331) <= os.time() then
				if chances == 1 then
				doTransformItem(item.uid, 13495) 					
				setGlobalStorageValue(56530, 3)
			else	
				player:say(config["randomText"][math.random(#config["randomText"])], TALKTYPE_ORANGE_1)
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				setPlayerStorageValue(cid, 324331, os.time()+exaustedSeconds*60)
				end
			else
				doPlayerSendCancel(cid, "You need wait 10 minutes to use again.")
				end
			else
				doPlayerSendCancel(cid, "You need to break the second jar.")
			end
		end


elseif item.actionid == 56533 then
	if(item.itemid == 13500) then  							
		if(getGlobalStorageValue(56530) == 3) then
			if getPlayerStorageValue(cid, 324332) <= os.time() then	
				if chances == 1 then
				doTransformItem(item.uid, 13495) 					
				setGlobalStorageValue(56530, 4)
			else	
				player:say(config["randomText"][math.random(#config["randomText"])], TALKTYPE_ORANGE_1)
				player:getPosition():sendMagicEffect(CONST_ME_POFF)
				setPlayerStorageValue(cid, 324332, os.time()+exaustedSeconds*60)
				end
			else
				doPlayerSendCancel(cid, "You need wait 10 minutes to use again.")
				end
			else
				doPlayerSendCancel(cid, "You need to break the third jar.")
		end
	end

elseif item.actionid == 56534 then 
	if(item.itemid == 13736) then							
		if(getGlobalStorageValue(56530) == 4) then
			doTransformItem(item.uid, 13495) 
			-- Remover Barreira e Sumonar Boss
			doRemoveItem(getTileItemById({x = 32941, y = 32754, z = 12}, 3514).uid, 1)
			doRemoveItem(getTileItemById({x = 32942, y = 32754, z = 12}, 3514).uid, 1)
			doRemoveItem(getTileItemById({x = 32943, y = 32754, z = 12}, 3514).uid, 1)
			doRemoveItem(getTileItemById({x = 32944, y = 32754, z = 12}, 3514).uid, 1)
			doCreatureSay(cid, "The horestis tomb was broken, the boss of the tomb will be reborn in 45 seconds. The barrier will be built from here 10 minutes.", TALKTYPE_ORANGE_1)
			addEvent(doSummonCreature, 45*1000, "Horestis", {x = 32942, y = 32765, z = 12}) 
			-- Criar Barreira depois de 10 minutos	
			addEvent(doCreateItem, 10 * 60 * 1000, 3514, {x = 32941, y = 32754, z = 12})
			addEvent(doCreateItem, 10 * 60 * 1000, 3514, {x = 32942, y = 32754, z = 12})
			addEvent(doCreateItem, 10 * 60 * 1000, 3514, {x = 32943, y = 32754, z = 12})
			addEvent(doCreateItem, 10 * 60 * 1000, 3514, {x = 32944, y = 32754, z = 12}) 
		else
			doPlayerSendCancel(cid, "You need to break the fourth jar.")
			end	
		end
	end
	return true
end
