function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if item.actionid == 55531 then
			if item.itemid == 10791 then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			elseif item.itemid == 10792 then
				Item(item.uid):transform(item.itemid - 1)
				player:teleportTo({x = 33201, y = 31064, z = 9}, true)
			end
	end
	return true
end
