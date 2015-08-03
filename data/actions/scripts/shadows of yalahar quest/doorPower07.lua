function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 35597) then
		if(getPlayerStorageValue(cid, 95592) > 18) then
			if(item.itemid == 9279) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 9280)
			end
		end
	end
	return true
end