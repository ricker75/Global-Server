function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 31999) then
		if(getPlayerStorageValue(cid, 15340) == 2) then
			if(item.itemid == 12195) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 12196)
			end
		else
			 doPlayerSendCancel(cid, "You need of mission to enter here.")
		end
	end
	return true
end