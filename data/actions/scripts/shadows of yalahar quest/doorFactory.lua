function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 35593) then
		if(getPlayerStorageValue(cid, 95592) > 5) then
			if(item.itemid == 9279) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 9280)
			end
		end
	end
	return true
end