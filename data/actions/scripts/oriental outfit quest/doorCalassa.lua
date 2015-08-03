function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 58320) then
		if(getPlayerStorageValue(cid, 68328) == 1) then
			if(item.itemid == 5745) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5746)
			end
		end
	end
	return true
end