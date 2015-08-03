function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 35608) then
		if(getPlayerStorageValue(cid, 95592) > 40) then
			if(item.itemid == 1225) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 1226)
			end
		end
	end
	return true
end