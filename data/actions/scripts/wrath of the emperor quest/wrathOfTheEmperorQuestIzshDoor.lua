function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 1050) >= 29)  then
		if(item.itemid == 12195) then
			doTeleportThing(cid, toPosition, true)
			doTransformItem(item.uid, 12196)
		end
	end
	return true
end