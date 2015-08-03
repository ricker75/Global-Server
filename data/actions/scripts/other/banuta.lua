function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if item.actionid == 55530 then
			if item.itemid == 5123 then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			elseif item.itemid == 5124 then
				Item(item.uid):transform(item.itemid - 1)
				player:teleportTo({x = 32808, y = 32632, z = 11}, true)
			end
	end
	return true
end
