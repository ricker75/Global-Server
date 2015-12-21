function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 16772) then
		doTeleportThing(cid, {x = 32753, y = 32357, z = 15})
		doSendMagicEffect({x = 32753, y = 32357, z = 15}, CONST_ME_TELEPORT)
	end
	return true
end