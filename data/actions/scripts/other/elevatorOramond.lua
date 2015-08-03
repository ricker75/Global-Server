function onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
	if item.actionid == 22840 then
		player:teleportTo({x = 33638, y = 31903, z = 5}, true)
	elseif item.actionid == 22841 then
		player:teleportTo({x = 33638, y = 31903, z = 6}, true)
	end
	return true
end