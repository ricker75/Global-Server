function onUse(cid, item, fromPosition, itemEx, toPosition)
	if (getPlayerStorageValue(cid, 321) < 1) then
		setPlayerStorageValue(cid, 321, 1)
		local bp = doPlayerAddItem(cid, 1987)
		doAddContainerItem(bp, 2536, 1)
		doAddContainerItem(bp, 2436, 1)
		doAddContainerItem(bp, 2656, 1)
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Check Your Backpack.")
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
	end
	return true
end