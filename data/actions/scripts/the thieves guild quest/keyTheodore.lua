function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if itemEx.actionid == 12505 then
		if player:getStorageValue(Storage.thievesGuild.Mission06) == 2 then
			player:say("In your haste you break the key while slipping in.", TALKTYPE_MONSTER_YELL, false, cid, {x =  32359, y = 32788, z = 6})
			Item(item.uid):remove(1)
			Player(cid):teleportTo(Position(32359, 32788, 6))
		end
	if item.itemid == 8769 then
		if player:getStorageValue(Storage.thievesGuild.Mission06) == 3 and player:getStorageValue(72380) < 1 then
			player:say("You slip through the door.", TALKTYPE_MONSTER_YELL, false, cid, {x =  32359, y = 32786, z = 6})
			Player(cid):teleportTo(Position(32359, 32786, 6))
			player:setStorageValue(72380, 1) -- exaust door leave
			end
		end
	end
	return true
end