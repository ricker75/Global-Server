function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 22709) then
		if(itemEx.itemid == 22708) then
				doRemoveItem(item.uid, 1)
				doRemoveItem(itemEx.uid, 1)
				doPlayerAddItem(cid, 22707, 1)
			end
		end
	return true
end