function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 35592) then
		if(getPlayerStorageValue(cid, 95592) > 13) then
			if(item.itemid == 9277) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 9278)
			end
		end
	end
	return true
end