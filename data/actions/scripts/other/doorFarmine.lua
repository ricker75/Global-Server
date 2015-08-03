function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if item.actionid == 55532 then
			if item.itemid == 6261 then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			elseif item.itemid == 6262 then
				Item(item.uid):transform(item.itemid - 1)
				player:teleportTo({x = 32990, y = 31546, z = 4}, true)
			end
	end
	return true
end
