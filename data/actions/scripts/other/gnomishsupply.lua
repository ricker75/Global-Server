function onUse(cid, item, frompos, item2, topos)

presente = math.random(1,20)
pos = getPlayerPosition(cid)

--surpriese bag--
if presente == 1 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,7439,1) --bersek potion
doRemoveItem(item.uid,1)

elseif presente == 2 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,2158,1) --blue gem
doRemoveItem(item.uid,1)

elseif presente == 3 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,7443,1) --bullseye potions
doRemoveItem(item.uid,1)

elseif presente == 4 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,2160,1) --crystal coin
doRemoveItem(item.uid,1)

elseif presente == 5 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,18304,1) --crystalline arrow
doRemoveItem(item.uid,1)

elseif presente == 6 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,18437,1) --envenomed arrow
doRemoveItem(item.uid,1)

elseif presente == 7 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,18522,1) --gnomish voucher type CA2
doRemoveItem(item.uid,1)

elseif presente == 8 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,18519,1) --gnomish voucher type MA2
doRemoveItem(item.uid,1)

elseif presente == 9 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,7591,1) --great health potion
doRemoveItem(item.uid,1)

elseif presente == 10 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,7590,1) --great mana potion
doRemoveItem(item.uid,1)

elseif presente == 11 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,2155,1) --green gem
doRemoveItem(item.uid,1)

elseif presente == 12 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,7618,4) --health potion
doRemoveItem(item.uid,1)

elseif presente == 13 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,7620,4) --mana potion
doRemoveItem(item.uid,1)

elseif presente == 14 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,7440,1) --mastermind potion
doRemoveItem(item.uid,1)

elseif presente == 15 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,18397,1) --mushroom pie
doRemoveItem(item.uid,1)

elseif presente == 16 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,18455,1) --pet pig
doRemoveItem(item.uid,1)

elseif presente == 17 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,2152,5) --platinum coin
doRemoveItem(item.uid,1)

elseif presente == 18 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,5911,1) --red piece of cloth
doRemoveItem(item.uid,1)

elseif presente == 19 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,2787,20) --white mushroom
doRemoveItem(item.uid,1)

elseif presente == 20 then
doSendMagicEffect(pos,26)
doPlayerAddItem(cid,2154,1) --yellow gem
doRemoveItem(item.uid,1)
end

return 1
end