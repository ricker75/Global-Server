function onUse(cid, item, fromPosition, itemEx, toPosition)
	local p = Player(cid)
	local c = Creature(cid)
	local i = Item(item.uid)
	if(item.uid == 2216) then
		if(getPlayerStorageValue(cid,2216) < 1) then
			if(item.itemid == 5114) then
				doTeleportThing(cid, toPosition, true)
				doTransformItem(item.uid, 5115)
			end
		else
			p:sendTextMessage(MESSAGE_INFO_DESCR, "This door seems to be sealed against unwanted intruders.")
		end
	end
return true
end
