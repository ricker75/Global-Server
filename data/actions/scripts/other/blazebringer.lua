function onUse(cid, item, fromPosition, itemEx, toPosition)

if(getPlayerStorageValue(cid, 34530) > 0) then
doPlayerSendTextMessage(cid, 21, "Received a mount.")
return TRUE
end

doPlayerAddMount(cid, 9)
doRemoveItem(item.uid,1)
doPlayerSendTextMessage(cid, 21, "You receive a new mount.")
setPlayerStorageValue(cid, 34530, 1)
doSendMagicEffect(getPlayerPosition(cid), 30)
return TRUE
end