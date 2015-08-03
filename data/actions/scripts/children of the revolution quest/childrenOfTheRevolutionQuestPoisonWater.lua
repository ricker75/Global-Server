function onUse(cid, item, fromPosition, itemEx, toPosition)

if(item.itemid == 10760) then
	if(itemEx.actionid == 8012) then
		if(getPlayerStorageValue(cid, 1050) == 10) then
			setPlayerStorageValue(cid, 1050, 11)
			setPlayerStorageValue(cid, 15333, 2) -- storage quest log
			doRemoveItem(item.uid, 1)
			doCreatureSay(cid, "The rice has been poisoned. This will weaken the Emperor's army significantly. Return and tell Zalamon about your success.", TALKTYPE_ORANGE_1)
			end
		end
	end
	return true
end