function onStepIn(cid, item, position, lastPosition)
	if(item.actionid == 40192) then
		if(getPlayerStorageValue(cid, 40193) == 1) then
			setPlayerStorageValue(cid, 15335, 2)
			setPlayerStorageValue(cid, 1050, 20)
			setPlayerStorageValue(cid, 40193, 2)
		end
	end
	return true
end
