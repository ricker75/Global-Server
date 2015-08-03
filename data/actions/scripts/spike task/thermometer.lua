function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(Storage.spikeTask.Temperature) == 1 then
		if isInRange(getCreaturePosition(cid),{x=32202, y=32667, z=13}, {x=32211, y=32676, z=13}) then
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'Whew! That was that hot, it melted the thermometer! At least you\'ve found the hot spot!')
		player:setStorageValue(Storage.spikeTask.Temperature, 2)
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'This is not the hot spot!')
		end
	end
end