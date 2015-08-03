function onUse(cid, item, fromPosition, itemEx, toPosition)
			if(item.itemid == 5105) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5106)
		end
	return true
end