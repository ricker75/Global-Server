local config = {
	dungeon = {x = 33290, y = 31786, z = 13},
	gateVenore = {x = 32834, y = 32082, z = 7},
	gateAbDendriel = {x = 32680, y = 31720, z = 7},
	gateThais = {x = 32268, y = 32162, z = 7},
	gateCarlin = {x = 32263, y = 31847, z = 7},
	gateEdron = {x = 33221, y = 31921, z = 7},
	gateKazordoon = {x = 32574, y = 31981, z = 7}
}

function onStepIn(cid, item, pos)
	if item.actionid == 9710 and (getGlobalStorageValue(9710) == 1) then
		if getPlayerLevel(cid) >= 60 then
			doTeleportThing(cid, config.dungeon)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have to be at least level 60 to enter this gate.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			doTeleportThing(cid, config.gateVenore)
		end
	end
	if item.actionid == 9711 and (getGlobalStorageValue(9711) == 1) then
		if getPlayerLevel(cid) >= 60 then
			doTeleportThing(cid, config.dungeon)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have to be at least level 60 to enter this gate.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			doTeleportThing(cid, config.gateAbDendriel)
		end
	end
	if item.actionid == 9712 and (getGlobalStorageValue(9712) == 1) then
		if getPlayerLevel(cid) >= 60 then
			doTeleportThing(cid, config.dungeon)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have to be at least level 60 to enter this gate.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			doTeleportThing(cid, config.gateThais)
		end
	end
	if item.actionid == 9713 and (getGlobalStorageValue(9713) == 1) then
		if getPlayerLevel(cid) >= 60 then
			doTeleportThing(cid, config.dungeon)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have to be at least level 60 to enter this gate.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			doTeleportThing(cid, config.gateCarlin)
		end
	end
	if item.actionid == 9714 and (getGlobalStorageValue(9714) == 1) then
		if getPlayerLevel(cid) >= 60 then
			doTeleportThing(cid, config.dungeon)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have to be at least level 60 to enter this gate.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			doTeleportThing(cid, config.gateEdron)
		end
	end
	if item.actionid == 9716 and (getGlobalStorageValue(9716) == 1) then
		if getPlayerLevel(cid) >= 60 then
			doTeleportThing(cid, config.dungeon)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "You have to be at least level 60 to enter this gate.")
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
			doTeleportThing(cid, config.gateKazordoon)
		end
	end
	if item.actionid == 9715 and (getGlobalStorageValue(9714) == 1) then
		doTeleportThing(cid, config.gateEdron)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
	end
	if item.actionid == 9715 and (getGlobalStorageValue(9716) == 1) then
		doTeleportThing(cid, config.gateKazordoon)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
	end
	if item.actionid == 9715 and (getGlobalStorageValue(9713) == 1) then
		doTeleportThing(cid, config.gateCarlin)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
	end
	if item.actionid == 9715 and (getGlobalStorageValue(9712) == 1) then
		doTeleportThing(cid, config.gateThais)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
	end
	if item.actionid == 9715 and (getGlobalStorageValue(9711) == 1) then
		doTeleportThing(cid, config.gateAbDendriel)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
	end
	if item.actionid == 9715 and (getGlobalStorageValue(9710) == 1) then
		doTeleportThing(cid, config.gateVenore)
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_FIREAREA)
	end
end