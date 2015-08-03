function onUse(cid, item, fromPosition, itemEx, toPosition)
		fromPosition.z = fromPosition.z - 2
		doTeleportThing(cid, fromPosition, FALSE)
	return TRUE
end