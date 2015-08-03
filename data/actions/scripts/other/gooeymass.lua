function onUse(cid, item, fromPosition, itemEx, toPosition)
if (math.random(1,10) == 1) then -- Bonus calc
	doPlayerAddItem(cid, 15492, 1)
	doRemoveItem(item.uid, 1)
	doCreatureSay(cid, "Yeah!", TALKTYPE_ORANGE_1)
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_GIFT_WRAPS)
elseif (math.random(1,10) == 2) then
	doPlayerAddItem(cid, 9971, 1)
	doRemoveItem(item.uid, 1)
	doCreatureSay(cid, "Yeah!", TALKTYPE_ORANGE_1)
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_GIFT_WRAPS)
elseif (math.random(1,10) == 3) then
	doPlayerAddItem(cid, 7591, 1)
	doRemoveItem(item.uid, 1)
	doCreatureSay(cid, "Yeah!", TALKTYPE_ORANGE_1)
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_GIFT_WRAPS)
elseif (math.random(1,10) == 4) then
	doPlayerAddItem(cid, 7590, 1)
	doRemoveItem(item.uid, 1)
	doCreatureSay(cid, "Yeah!", TALKTYPE_ORANGE_1)
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_GIFT_WRAPS)
elseif (math.random(1,10) == 5) then
	doPlayerAddItem(cid, 2152, 1)
	doRemoveItem(item.uid, 1)
	doCreatureSay(cid, "Yeah!", TALKTYPE_ORANGE_1)
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_GIFT_WRAPS)
elseif (math.random(1,10) == 6) then
	doPlayerAddItem(cid, 15487, 10)
	doRemoveItem(item.uid, 1)
	doCreatureSay(cid, "Yeah!", TALKTYPE_ORANGE_1)
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_GIFT_WRAPS)
elseif (math.random(1,10) == 7) then
	doPlayerAddItem(cid, 5022, 1)
	doRemoveItem(item.uid, 1)
	doCreatureSay(cid, "Yeah!", TALKTYPE_ORANGE_1)
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_GIFT_WRAPS)
elseif (math.random(1,10) == 8) then
	doPlayerAddItem(cid, 2144, 1)
	doRemoveItem(item.uid, 1)
	doCreatureSay(cid, "Yeah!", TALKTYPE_ORANGE_1)
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_GIFT_WRAPS)
elseif (math.random(1,10) == 9) then
	doPlayerAddItem(cid, 15546, 1)
	doRemoveItem(item.uid, 1)
	doCreatureSay(cid, "Yeah!", TALKTYPE_ORANGE_1)
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_GIFT_WRAPS)
elseif (math.random(1,10) == 10) then
	doCreatureSay(cid, "Fail!", TALKTYPE_ORANGE_1)
	doSendMagicEffect(getPlayerPosition(cid), CONST_ME_BLOCKHIT)
	doRemoveItem(item.uid, 1)
end
	return TRUE
end