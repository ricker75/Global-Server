function onUse(cid, item, frompos, item2, topos)
	if (item.uid == 9513 and getPlayerStorageValue(cid, 9513) < 1) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"You have found a Blood Herb.")
		doPlayerAddItem(cid,2798,1)
		setPlayerStorageValue(cid,9513,1)
	else
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR,"It is empty.")
	end	
	return TRUE
end


