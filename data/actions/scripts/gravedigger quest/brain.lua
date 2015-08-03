function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(9998) == 1 and player:getStorageValue(9999) < 1 then
		if(getTileItemById({x = 33019, y = 32332, z = 10}, 10576).uid >= 1) and getTileItemById({x = 33026, y = 32332, z = 10}, 10576).uid >= 1 then
			player:setStorageValue(9999, 1)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, '<brzzl> <frzzp> <fsssh>')
			doCreateItem(21395,1,{x = 33022, y = 32332, z = 10})
			doRemoveItem(getTileItemById({x = 33019, y = 32332, z = 10}, 10576).uid, 1)
			doRemoveItem(getTileItemById({x = 33026, y = 32332, z = 10}, 10576).uid, 1)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'No brains')
		end
	else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You\'ve already got your brain')
	end
	return true
end