function onStepIn(cid, item, pos, lastPosition)
	if item.actionid == 55022 then
		if getPlayerItemCount(cid, 16015) >= 1 then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		doTeleportThing(cid, {x = 32829, y = 31451, z = 8}, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		doPlayerSendTextMessage(cid, 19, "You're entering the realm of dreams.")
	else
		doPlayerSendTextMessage(cid, 19, "You do not have the Chayenne's magical key.")
		doTeleportThing(cid, lastPosition)
	end
	elseif item.actionid == 55024 then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		doTeleportThing(cid, {x = 33117, y = 32604, z = 6}, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		doPlayerSendTextMessage(cid, 19, "Goodbye, dream traveller...")
	end
	return TRUE
end