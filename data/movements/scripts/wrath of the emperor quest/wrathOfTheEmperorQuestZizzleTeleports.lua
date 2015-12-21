local teleports = {
	[3186] = {{x = 33084, y = 31214, z = 8}, scale = true},
	[3187] = {{x = 33093, y = 31122, z = 12}, scale = true},
}

function onStepIn(cid, item, position, lastPosition)
	if(isPlayer(cid)) then
		if(getPlayerStorageValue(cid, 1050) >= 21) then
			if(getTileItemById({x = 33086, y = 31214, z = 8}, 12629).uid >= 1) then
				doRemoveItem(getTileItemById({x = 33086, y = 31214, z = 8}, 12629).uid, 1)
			else
				doTeleportThing(cid, lastPosition)
				return true
			end	
			doTeleportThing(cid, teleports[item.uid][1])
			doSendMagicEffect(teleports[item.uid][1], CONST_ME_TELEPORT)
		end
	else
		doTeleportThing(cid, lastPosition)
	end
	return true
end
