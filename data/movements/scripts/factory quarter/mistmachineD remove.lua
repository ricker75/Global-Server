function onStepIn(cid, item, position, fromPosition)
    local newPosition = {x=32876, y=31312, z=10}
	local noPosition = {x=32876, y=31312, z=10}
        if (getPlayerStorageValue(cid, 10250) == 1) then
		    	doTeleportThing(cid, newPosition, TRUE)
			doSendMagicEffect(newPosition, CONST_ME_TELEPORT)
			setPlayerStorageValue(cid, 10250, -1)
		else
			doTeleportThing(cid, noPosition, TRUE)
			doSendMagicEffect(noPosition, CONST_ME_TELEPORT)
			setPlayerStorageValue(cid, 10250, -1)
	end
end