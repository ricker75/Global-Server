function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if(item.actionid == 1004) then
		if(getPlayerStorageValue(cid, 200) > 17) and getPlayerStorageValue(cid, 200) < 20 then
			if item.itemid == 5114 then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			elseif item.itemid == 5115 then
				Item(item.uid):transform(item.itemid - 1)
				player:teleportTo({x = 33147, y = 31639, z = 11}, true)
			end
		end
	end
	return true
end