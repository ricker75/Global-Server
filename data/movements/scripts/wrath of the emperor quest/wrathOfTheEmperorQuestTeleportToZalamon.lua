function onStepIn(cid, item, position, lastPosition)
	if(item.uid == 3197) then
		if(getPlayerStorageValue(cid, 1050) > 26) then
			doTeleportThing(cid, {x = 33359, y = 31397, z = 9})
			doSendMagicEffect({x = 33359, y = 31397, z = 9}, CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, lastPosition)
		end
	end
	return true
end

