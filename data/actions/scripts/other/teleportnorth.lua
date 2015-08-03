function onUse(cid, item, fromPosition, itemEx, toPosition)
		fromPosition.z = fromPosition.z - 1
		fromPosition.y = fromPosition.y - 1
		doTeleportThing(cid, fromPosition, FALSE)
	return TRUE
end