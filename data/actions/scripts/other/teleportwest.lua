function onUse(cid, item, fromPosition, itemEx, toPosition)
		fromPosition.z = fromPosition.z - 1
		fromPosition.x = fromPosition.x - 1
		doTeleportThing(cid, fromPosition, FALSE)
	return TRUE
end