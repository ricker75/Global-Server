function onStepIn(cid, item, pos, fromPosition)

	if item.uid == 33308 then
			if(getPlayerStorageValue(cid, 33314) == 2) then
			doTeleportThing(cid, {x = 33446, y = 31288, z = 14}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, {x = 33478, y = 31314, z = 7}, TRUE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		end

	elseif item.uid == 33307 then
			if(getPlayerStorageValue(cid, 33314) > 0) then
			doTeleportThing(cid, {x = 33478, y = 31314, z = 7}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			setPlayerStorageValue(cid, 33314, 2)
		else
			doTeleportThing(cid, {x = 33446, y = 31288, z = 14}, TRUE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		end

	elseif item.uid == 33306 then
			if(getPlayerStorageValue(cid, 33314) > 0) then
			doTeleportThing(cid, {x = 33478, y = 31314, z = 7}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			setPlayerStorageValue(cid, 33314, 2)
		else
			doTeleportThing(cid, {x = 33446, y = 31288, z = 14}, TRUE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		end
	
	end
	return TRUE
end