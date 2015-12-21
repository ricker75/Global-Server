function onStepIn(cid, item, pos, fromPosition, toPosition)
	if(getPlayerStorageValue(cid, 33314) > 0) then
		else
			doTeleportThing(cid, {x = 33511, y = 31331, z = 8}, TRUE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_WATERSPLASH)
			doPlayerSendTextMessage(cid, 19, "As soon as you enter the water a very strong drift drags you down. Entering these waters is too dangerous without preparation.")
	end
	return TRUE
end