function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if item.actionid == 19900 then
		if(getPlayerStorageValue(cid, 19906) == 1) then
			if item.itemid == 5114 then
				player:teleportTo(toPosition, true)
				Item(item.uid):transform(item.itemid + 1)
			elseif item.itemid == 5115 then
				Item(item.uid):transform(item.itemid - 1)
				player:teleportTo({x = 33164, y = 31600, z = 15}, true)
			end
		else
			player:sendTextMessage(19, "The door seems to be sealed against unwanted intruders.")
		end
	end
	return true
end
