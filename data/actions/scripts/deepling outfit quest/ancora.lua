function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 15432) then
		if(itemEx.itemid == 15358) then
			if(getPlayerStorageValue(cid, 72328) == 2) then
			doPlayerSendTextMessage(cid, 19, "As the small anchor resonates with the large anchor, you are transported right into a tiny room. You are not alone.")
			doTeleportThing(cid, {x = 33640, y = 31379, z = 9})
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
			setPlayerStorageValue(cid, 72328, 3)
			end
	     	 end
	end
	return true
end