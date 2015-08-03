function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 2549) then
		if(itemEx.itemid == 6094) then
			if(getPlayerStorageValue(cid, 28901) == 1) and getPlayerStorageValue(cid, 32900) < 1 then
			doCreatureSay(cid, "You have found a ring.", TALKTYPE_ORANGE_1)
			doPlayerAddItem(cid, 6093, 1)
			setPlayerStorageValue(cid, 32900, 1)
			setPlayerStorageValue(cid, 29105, 2) -- Quest Log
		else
			 doPlayerSendCancel(cid, "You do not have acess to use.")
		   end
	      end
	end
	return true
end