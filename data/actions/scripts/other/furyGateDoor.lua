function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if item.actionid == 55534 then
			if item.itemid == 5114 then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			elseif item.itemid == 5115 then
				Item(item.uid):transform(item.itemid - 1)
				player:teleportTo({x = 33285, y = 31791, z = 13}, true)
			end
	end
	return true
end
