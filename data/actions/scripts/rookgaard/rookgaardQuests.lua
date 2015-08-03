function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 39031) then
		if(getPlayerStorageValue(cid, 440) < 1) then
			setPlayerStorageValue(cid, 440, 1)
			doPlayerAddItem(cid, 2485, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a doublet.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 39032) then
		if(getPlayerStorageValue(cid, 441) < 1) then
			setPlayerStorageValue(cid, 441, 1)
			doPlayerAddItem(cid, 2404, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a combat knife.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 39033) then
		if(getPlayerStorageValue(cid, 442) < 1) then
			setPlayerStorageValue(cid, 442, 1)
			doPlayerAddItem(cid, 2384, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a rapier.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 39034) then
		if(getPlayerStorageValue(cid, 443) < 1) then
			setPlayerStorageValue(cid, 443, 1)
			key = doPlayerAddItem(cid, 2089, 1)
			doItemSetAttribute(key.uid, "aid", 4601)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a key.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 39035) then
		if(getPlayerStorageValue(cid, 444) < 1) then
			setPlayerStorageValue(cid, 444, 1)
			doPlayerAddItem(cid, 2460, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a brass helmet.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 39036) then
		if(getPlayerStorageValue(cid, 445) < 1) then
			setPlayerStorageValue(cid, 445, 1)
			doPlayerAddItem(cid, 2464, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a chain armor.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 39037) then
		if(getPlayerStorageValue(cid, 446) < 1) then
			setPlayerStorageValue(cid, 446, 1)
			doPlayerAddItem(cid, 2544, 12)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found 12 arrows.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 39038) then
		if(getPlayerStorageValue(cid, 447) < 1) then
			setPlayerStorageValue(cid, 447, 1)
			doPlayerAddItem(cid, 2148, 40)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found 40 gold coins.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 39039) then
		if(getPlayerStorageValue(cid, 448) < 1) then
			setPlayerStorageValue(cid, 448, 1)
			doPlayerAddItem(cid, 2395, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a carlin sword.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 39040) then
		if(getPlayerStorageValue(cid, 449) < 1) then
			setPlayerStorageValue(cid, 449, 1)
			doPlayerAddItem(cid, 2545, 4)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found 4 poison arrows .")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 39041) then
		if(getPlayerStorageValue(cid, 450) < 1) then
			setPlayerStorageValue(cid, 450, 1)
			doPlayerAddItem(cid, 2544, 10)
			doPlayerAddItem(cid, 2580, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found fishing rod and 10 arrows.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 39042) then
		if(getPlayerStorageValue(cid, 451) < 1) then
			setPlayerStorageValue(cid, 451, 1)
			bag = doPlayerAddItem(cid, 1987, 1)
			doAddContainerItem(bag, 2530, 1)
			doAddContainerItem(bag, 2480, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a bag.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 39043) then
		if(getPlayerStorageValue(cid, 452) < 1) then
			setPlayerStorageValue(cid, 452, 1)
			key = doPlayerAddItem(cid, 2092, 1)
			doItemSetAttribute(key.uid, "aid", 4603)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a key.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 39044) then
		if(getPlayerStorageValue(cid, 453) < 1) then
			setPlayerStorageValue(cid, 453, 1)
			doPlayerAddItem(cid, 2473, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a viking helmet.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	elseif(item.uid == 39045) then
		if(getPlayerStorageValue(cid, 453) < 1) then
			setPlayerStorageValue(cid, 453, 1)
			doPlayerAddItem(cid, 2412, 1)
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You've found a katana.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "The chest is empty.")
		end
	end
	return true
end