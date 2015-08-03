function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 35595) then
		if(getPlayerStorageValue(cid, 95592) > 16) then
			if(item.itemid == 9279) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 9280)
			end
		end
	end
	return true
end