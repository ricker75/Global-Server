function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 15433) then
		if(itemEx.itemid == 15570) then
			if(getPlayerStorageValue(cid, 72328) == 1) then
			doPlayerSendTextMessage(cid, 19, "Suddenly a small anchor seems to materialize inside the net. It looks like a keepsake from a long dead sailor.")
			doPlayerAddItem(cid, 15432, 1)
			setPlayerStorageValue(cid, 72328, 2)
			end
	     	 end
	end
	return true
end