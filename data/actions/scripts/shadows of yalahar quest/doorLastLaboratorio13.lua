function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 95592) > 43) then
		if(item.itemid == 9277) then
			doTeleportThing(cid, toPosition, true)
			doTransformItem(item.uid, 9278)
		end
	end
	return true
end