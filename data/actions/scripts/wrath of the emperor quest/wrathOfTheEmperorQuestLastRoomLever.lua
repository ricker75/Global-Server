function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3198) then
		if(getPlayerStorageValue(cid, 1050) == 27) then
		for x = 33357, 33362 do
			for y = 31404, 31409 do
				pos = {x = x, y = y, z = getCreaturePosition(cid).z}
				if(isPlayer(getTopCreature(pos).uid)) then
					doTeleportThing(getTopCreature(pos).uid, {x = 33359, y = 31408, z = 10})
					doSendMagicEffect({x = 33359, y = 31408, z = 10}, CONST_ME_TELEPORT)
					end
				end
			end
		end
	end
	return true
end
