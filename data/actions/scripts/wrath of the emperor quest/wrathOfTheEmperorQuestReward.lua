function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 10014) < 1) then
		doPlayerAddExp(cid, 500000, true, true)
		setPlayerStorageValue(cid, 10014, 1)
	end
	if(item.uid == 3200) then
		if(canPlayerWearOutfit(cid, getPlayerSex(cid) == 0 and 366 or 367, 3) == false) then
			doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 366 or 367, 3)
			doCreatureSay(cid, "You have found some old and long forgotten garments that could be used as an outfit.", TALKTYPE_ORANGE_1)
			setPlayerStorageValue(cid, 15180, 3) -- quest log mission 12
		else
			doCreatureSay(cid, "The wardrobe is empty.", TALKTYPE_ORANGE_1)
		end
	elseif(item.uid == 3201) then
		if(getPlayerStorageValue(cid, 1091) < 1) then
			setPlayerStorageValue(cid, 1091, 1)
			doPlayerAddItem(cid, 12643, 1)
			doPlayerSendTextMessage(cid, 19, "You have found a royal scale robe.")
		else
			doPlayerSendTextMessage(cid, 19, "The box is empty.")
		end
	elseif(item.uid == 3202) then
		if(getPlayerStorageValue(cid, 1091) < 1) then
			setPlayerStorageValue(cid, 1091, 1)
			doPlayerAddItem(cid, 12642, 1)
			doPlayerSendTextMessage(cid, 19, "You have found a royal draken mail.")
		else
			doPlayerSendTextMessage(cid, 19, "The box is empty.")
		end
	elseif(item.uid == 3203) then
		if(getPlayerStorageValue(cid, 1091) < 1) then
			setPlayerStorageValue(cid, 1091, 1)
			doPlayerAddItem(cid, 12645, 1)
			doPlayerSendTextMessage(cid, 19, "You have found an elite draken helmet.")
		else
			doPlayerSendTextMessage(cid, 19, "The box is empty.")
		end
	elseif(item.uid == 3204) then
		if(getPlayerStorageValue(cid, 1094) < 1) then
			setPlayerStorageValue(cid, 1094, 1)
			bag2 = doPlayerAddItem(cid, 11243, 1)
			doAddContainerItem(bag2, 2152, 100)
			doPlayerSendTextMessage(cid, 19, "You have found a dragon backpack.")
		else
			doPlayerSendTextMessage(cid, 19, "The box is empty.")
		end	
	elseif(item.uid == 3205) then
		if(getPlayerStorageValue(cid, 1095) < 1) then
			setPlayerStorageValue(cid, 1095, 1)
			bag = doPlayerAddItem(cid, 5801, 1)
			doAddContainerItem(bag, 5882, 10)
			doAddContainerItem(bag, 9971, 5)
			doAddContainerItem(bag, 2144, 10)
			doAddContainerItem(bag, 2160, 10)
			doPlayerSendTextMessage(cid, 19, "You have found a jewelled backpack.")
		else
			doPlayerSendTextMessage(cid, 19, "The chest is empty.")
		end	
	end
	return true
end