function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 33830) == 3) then
		doTeleportThing(cid, {x = 32703, y = 31449, z = 15})
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	elseif(getPlayerStorageValue(cid, 33830) == 4) then
		doTeleportThing(cid, {x = 32722, y = 31488, z = 15})
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
	return true
end