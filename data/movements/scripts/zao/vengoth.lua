function onStepIn(cid, item, pos, fromPosition)
	if item.uid == 60127 then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		doTeleportThing(cid, {x = 32953, y = 31483, z = 6}, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), 11)
	elseif item.uid == 60128 then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		doTeleportThing(cid, {x = 32953, y = 31487, z = 6}, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), 11)
	end
	return TRUE
end