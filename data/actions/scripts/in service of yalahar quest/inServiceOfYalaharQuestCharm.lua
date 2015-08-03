function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 9737 and itemEx.actionid == 100 and itemEx.itemid == 471) then
		if(getPlayerStorageValue(cid, 30) == 36) then
			doPlayerRemoveItem(cid,9737, 1)
          		doCreateItem(9738,1,toPosition) 
          		doSendMagicEffect(toPosition,47)
			doSummonCreature("Tormented Ghost",{x = 32773, y = 31063, z = 7})
			doSendMagicEffect({x = 32773, y = 31063, z = 7}, CONST_ME_TELEPORT)

			doSummonCreature("Tormented Ghost",{x = 32779, y = 31063, z = 7})
			doSendMagicEffect({x = 32779, y = 31063, z = 7}, CONST_ME_TELEPORT)
		end
	end
	return true
end