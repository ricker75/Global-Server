function onStepIn(cid, item, position, lastPosition)
	if(isPlayer(cid)) then
		if(getPlayerStorageValue(cid, 10844) > 0) then
			doTeleportThing(cid, {x = 33240, y = 31247, z = 10})
			doSendMagicEffect({x = 33240, y = 31247, z = 10}, CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, lastPosition)
		end
	else
		doTeleportThing(cid, lastPosition)
	end
	return true
end
