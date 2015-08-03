function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(12907) == 1 and player:getStorageValue(12908) < 1 then
		local tile = Tile(Position({x = 33015, y = 32418, z = 11}))
		if tile:getItemById(21476) then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'The scroll burns to dust. The magic stutters. Omrabas\' soul flees to his old hideaway.')
			player:removeItem(21251, 1)
			player:setStorageValue(12908, 1)
			tile:getItemById(21476):remove()
			doSummonCreature("Chicken", {x = 33015, y = 32418, z = 11})
			doSendMagicEffect({x = 33015, y = 32418, z = 11}, 36)
			doSendMagicEffect({x = 33015, y = 32418, z = 11}, 10)
		end
	end
	return true
end