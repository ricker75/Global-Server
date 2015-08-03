function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 10035) then
			if(getPlayerStorageValue(cid, 33830) > 2) then
			doTeleportThing(cid, {x = 32680, y = 31508, z = 10})
	      end
	end
	return true
end