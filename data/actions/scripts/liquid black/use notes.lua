function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 15576) then
			if(getPlayerStorageValue(cid, 33311) == 1) and getPlayerStorageValue(cid, 33312) < 1 then
			doPlayerSendTextMessage(cid, 19, "The scribblings seem to describe an underground machine. There are also some cryptic coordinates written on it.")
			setPlayerStorageValue(cid, 33312, 1)
		else
			 doPlayerSendTextMessage(cid, 19, "No matter how often you try, you cannot decipher anything. You should try to find the person who wrote this.")
	      end
	end
	return true
end