function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if item.uid == 7813 then
		if item.itemid == 7040 then
			player:teleportTo(toPosition, true)
			Item(item.uid):transform(item.itemid + 1)
		elseif item.itemid == 7041 then
			Item(item.uid):transform(item.itemid - 1)
			player:teleportTo({x = 32134, y = 31096, z = 6}, true)
		end
	end
	return true
end

