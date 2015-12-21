function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 52161) then
			doTeleportThing(cid, {x=32780, y=31168, z=14})
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	return true
end
