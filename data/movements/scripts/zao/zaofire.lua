function onStepIn(cid, item, pos, fromPosition)
	if item.uid == 60085 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x = 33094, y = 31122, z = 12}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	-- WRATH OF EMPEROR
	elseif item.uid == 60086 then
			if(getPlayerStorageValue(cid, 15340) == 2) then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x = 33083, y = 31213, z = 8}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, {x = 33093, y = 31122, z = 12}, TRUE)
		end
	-- WRATH OF EMPEROR
	elseif item.uid == 60087 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x = 33078, y = 31218, z = 8}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	elseif item.uid == 60088 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x=33138,y=31247,z=6}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	elseif item.uid == 60089 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x = 33213, y = 31067, z = 9}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	-- WRATH OF EMPEROR
	elseif item.uid == 60090 then
			if(getPlayerStorageValue(cid, 1090) == 5) then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x = 33361, y = 31397, z = 9}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, {x = 33137, y = 31249, z = 6}, TRUE)
		end
	-- WRATH OF EMPEROR
	end
	return TRUE
end