function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 56167) then
		if(getPlayerStorageValue(cid, 12060) > 0) then
			if(item.itemid == 5123) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5124)
			end
		end
	end
	return true
end