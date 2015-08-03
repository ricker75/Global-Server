function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 15634) then
			if(getPlayerStorageValue(cid, 33312) == 1) and getPlayerStorageValue(cid, 33313) < 1 then
			doPlayerSendTextMessage(cid, 19, "At least the instructions of the portable teleporter of this machine were readable in the strange notes you found!")
			doTeleportThing(cid, {x = 33270, y = 31832, z = 1}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			setPlayerStorageValue(cid, 33313, 1)
		else
			 doPlayerSendTextMessage(cid, 19, "You have no idea how to use this thing. There have to be some instructions for this somewhere.")
	      end
	end
	return true
end