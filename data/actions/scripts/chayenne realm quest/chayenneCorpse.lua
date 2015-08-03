function onUse(cid, item, fromPosition, itemEx, toPosition)
	if getPlayerStorageValue(cid, 77649) < 1 then
		doPlayerAddItem(cid, 6571, 2)
		doPlayerAddItem(cid, 7632, 1)
		setPlayerStorageValue(cid, 77649, 1)
		doPlayerSendTextMessage(cid, 19, "Happy birthday, Tibia!")
		doTeleportThing(cid, {x = 32715, y = 31634, z = 7}, FALSE)
		doSendMagicEffect(getCreaturePosition(cid), 30)
		------------------- CHAYENNE KEY RANDOM --------------------
		chance = math.random(1, 4)
		if chance == 2 then
			doPlayerAddItem(cid, 16015, 1) 
		end
		----------------------------------------------------
	else
		doPlayerSendTextMessage(cid, 19, "You already got your reward.")
	end
end