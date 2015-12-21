function onStepIn(cid, item, pos, fromPosition)

	if item.uid == 33809 then
			if(getPlayerStorageValue(cid, 14201) > 0) then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x = 32600, y = 31396, z = 14}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, {x = 32598, y = 31403, z = 15}, TRUE)
		end
	end
	return TRUE
end