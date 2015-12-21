local config = {
	[3167] = {1050, Position({x = 33261, y = 31078, z = 8})},
	[3168] = {1050, Position({x = 33356, y = 31125, z = 7})}
}

function onStepIn(cid, item, position, lastPosition)
	local player = Player(cid)
	local targetTile = config[item.uid]
	if not player then 
		return true
	end

	if not targetTile then
		return true
	end
	
	if player:getStorageValue(targetTile[1]) >= 19 then
		player:teleportTo(targetTile[2])
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	else
		doTeleportThing(cid, lastPosition)
		doPlayerSendCancel(cid, "You do not have acess.")

	end
	return true
end