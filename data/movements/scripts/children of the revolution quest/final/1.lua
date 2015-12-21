function onStepIn(cid, item, position, lastPosition)
if(item.actionid == 40193) then
	if(getPlayerStorageValue(cid, 40193) < 1) and getPlayerStorageValue(cid, 1050) == 19 then 
		setPlayerStorageValue(cid, 40193, 1)
		end
	end
	return true
end
