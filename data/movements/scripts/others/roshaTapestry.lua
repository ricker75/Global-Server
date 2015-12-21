function onStepIn(cid, item, position, fromPosition)
	local player = Player(cid)
	player:teleportTo({x = 32369, y = 32241, z = 7})
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end