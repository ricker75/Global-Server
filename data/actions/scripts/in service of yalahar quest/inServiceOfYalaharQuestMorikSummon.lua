function onUse(cid, item, fromPosition, itemEx, toPosition)
		if(Player(cid):getStorageValue(30) == 31 and Player(cid):getStorageValue(9031) < 1) then
			doSummonCreature("Morik the Gladiator",{x=32685, y=31242, z=6})
			doSendMagicEffect({x=32685, y=31242, z=6}, CONST_ME_TELEPORT)
			Player(cid):setStorageValue(9031, 1)
		end
	return true
end
