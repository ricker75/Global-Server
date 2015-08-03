function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 49040) then
		if(getPlayerStorageValue(cid, 33830) == 2) then
			doPlayerAddItem(cid, 1981, 1)
			doPlayerSendTextMessage(cid, 19, "You have found a book.")
			setPlayerStorageValue(cid, 33830, 3)
		end
	end
	return true
end