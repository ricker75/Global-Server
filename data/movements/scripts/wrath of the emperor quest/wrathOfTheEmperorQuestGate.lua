function onStepIn(cid, item, position, lastPosition)
	if(isPlayer(cid)) then
		if(item.actionid == 8028) then
			if(getPlayerStorageValue(cid, 10844) == 2) then
				doTeleportThing(cid, {x = 33027, y = 31084, z = 13})
				doSendMagicEffect({x = 33027, y = 31084, z = 13}, CONST_ME_TELEPORT)
			else
				doTeleportThing(cid, lastPosition)
			end
		end
	end
	return true
end
