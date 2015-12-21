function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
		if(getPlayerStorageValue(cid, 55701) == 4) then
			player:getPosition():sendMagicEffect(3)
		else
			doTeleportThing(cid, {x = 32094, y = 32576, z = 8})
			doSendMagicEffect({x = 32094, y = 32576, z = 8}, CONST_ME_TELEPORT)	
			doCreatureSay(cid, "You must complete Chondur's missions before you can enter deeper Goroma.", TALKTYPE_ORANGE_1)
		end
		return true
	end