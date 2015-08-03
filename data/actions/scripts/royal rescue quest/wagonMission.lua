local nodes = {
	[49041] = {x = 32566, y = 31505, z = 9}, 
	[49042] = {x = 32578, y = 31507, z = 9}, 
	[49043] = {x = 32611, y = 31513, z = 9},
	[49044] = {x = 32625, y = 31514, z = 9},
	[49045] = {x = 32652, y = 31507, z = 10},
	[49046] = {x = 32692, y = 31501, z = 11},
	[49047] = {x = 32687, y = 31471, z = 13},
	[49048] = {x = 32687, y = 31470, z = 13},
	[49049] = {x = 32687, y = 31470, z = 13},
	[49050] = {x = 32580, y = 31487, z = 9},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerStorageValue(cid, 33830) > 2) and getPlayerStorageValue(cid, 33832) < 1 then
		doTeleportThing(cid, nodes[item.actionid])
		doSendMagicEffect(nodes[item.actionid], CONST_ME_TELEPORT)
	end
	return true
end