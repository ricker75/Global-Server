local pos = {
	[3189] = {x = 33041, y = 31086, z = 15},
	[3190] = {x = 33092, y = 31081, z = 15},
	[3191] = {x = 33090, y = 31116, z = 15},
	[3192] = {x = 33037, y = 31115, z = 15},
}

function onStepIn(cid, item, position, lastPosition)
	if(getPlayerStorageValue(cid, 1090) == item.uid - 3188) then
		if(getGlobalStorageValue(item.uid) < 1) then
			doTeleportThing(cid, pos[item.uid])
			doSendMagicEffect(pos[item.uid], CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, lastPosition)
		end
	else
		doTeleportThing(cid, lastPosition)
	end
	return true
end
