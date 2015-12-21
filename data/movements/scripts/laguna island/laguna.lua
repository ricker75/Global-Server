function onStepIn(cid, item, pos, fromPosition)

	if item.uid == 3206 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x = 32359, y = 32901, z = 7}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	elseif item.uid == 3207 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x = 32340, y = 32538, z = 7}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)

	elseif item.uid == 3208 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x = 32472, y = 32869, z = 7}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)

	elseif item.uid == 3209 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x = 32415, y = 32916, z = 7}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)

	elseif item.uid == 3210 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x = 32490, y = 32979, z = 7}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)

	elseif item.uid == 3211 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x = 32440, y = 32971, z = 7}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)

	elseif item.uid == 3212 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x = 32527, y = 32951, z = 7}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)

	elseif item.uid == 3213 then
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			doTeleportThing(cid, {x = 32523, y = 32923, z = 7}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	return TRUE
end