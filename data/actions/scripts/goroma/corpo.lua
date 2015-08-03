function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 50155) < 1) then
			setPlayerStorageValue(cid, 50155, 1)
			doPlayerAddItem(cid, 6120, 1)
			doPlayerSendTextMessage(cid, 19, "You have found Dragha's spellbook.")
		else
			doPlayerSendTextMessage(cid, 19, "The dead human is empty.")	
		end
	return true
end