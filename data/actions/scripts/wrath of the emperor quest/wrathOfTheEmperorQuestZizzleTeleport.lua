function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.uid == 3184) then
		if(getPlayerStorageValue(cid, 1050) == 21) then
			if(getPlayerPosition(cid).x == 33078 and 
				getPlayerPosition(cid).y == 31080 and 
				getPlayerPosition(cid).z == 13) then
				doTeleportThing(cid, {x = 33082, y = 31110, z = 2})
				doSendMagicEffect({x = 33082, y = 31110, z = 2}, CONST_ME_TELEPORT)
			end
		end
	elseif(item.uid == 3185) then
		if(getPlayerStorageValue(cid, 1050) == 21) then
			if(getPlayerPosition(cid).x == 33082 and 
				getPlayerPosition(cid).y == 31110 and 
				getPlayerPosition(cid).z == 2) then
				doTeleportThing(cid, {x = 33078, y = 31080, z = 13})
				doSendMagicEffect({x = 33078, y = 31080, z = 13}, CONST_ME_TELEPORT)
			end
		end
	end
	return true
end