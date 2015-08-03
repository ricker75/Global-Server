function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
		if(item.itemid == 8717) then
			if(itemEx.actionid == 12503) then
				if player:getStorageValue(Storage.thievesGuild.Mission02) == 1 then
					if math.random(100) <= 30 then
					player:addItem(8760, 1)
					player:setStorageValue(Storage.thievesGuild.Mission02, 2)
				else
					Item(item.uid):remove(1)
					player:sendTextMessage(MESSAGE_INFO_DESCR, "Your lock pick broke.")
					end
				end
			end
		end
	return true
end