function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 1945) then
		doTeleportThing(cid, {x = 32767, y = 32365, z = 15})
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	return true
end