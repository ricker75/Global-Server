function onUse(cid, item, frompos, item2, topos)

presente = math.random(1,11)
pos = getPlayerPosition(cid)

if presente == 1 then
doSendMagicEffect(pos,27)
doPlayerAddItem(cid,2237,1)
doRemoveItem(item.uid,1)

elseif presente == 2 then
doSendMagicEffect(pos,27)
doPlayerAddItem(cid,2232,1)
doRemoveItem(item.uid,1)

elseif presente == 3 then
doSendMagicEffect(pos,27)
doPlayerAddItem(cid,6577,1)
doRemoveItem(item.uid,1)

elseif presente == 4 then
doSendMagicEffect(pos,27)
doPlayerAddItem(cid,2220,1)
doRemoveItem(item.uid,1)

elseif presente == 5 then
doSendMagicEffect(pos,27)
doPlayerAddItem(cid,2227,1)
doRemoveItem(item.uid,1)

elseif presente == 6 then
doSendMagicEffect(pos,27)
doPlayerAddItem(cid,5894,1)
doRemoveItem(item.uid,1)

elseif presente == 7 then
doSendMagicEffect(pos,27)
doPlayerAddItem(cid,13508,1)
doRemoveItem(item.uid,1)

elseif presente == 8 then
doSendMagicEffect(pos,27)
doPlayerAddItem(cid,13926,1)
doRemoveItem(item.uid,1)

elseif presente == 9 then
doSendMagicEffect(pos,27)
doPlayerAddItem(cid,13925,1)
doRemoveItem(item.uid,1)

elseif presente == 10 then
doSendMagicEffect(pos,27)
doPlayerAddItem(cid,5879,1)
doRemoveItem(item.uid,1)

elseif presente == 11 then
doSendMagicEffect(pos,27)
doPlayerAddItem(cid,2114,1)
doRemoveItem(item.uid,1)
end

return 1
end