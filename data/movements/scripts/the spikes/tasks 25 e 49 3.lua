function onStepIn(cid, item, position, fromPosition)
    local newPosition = {x=32239, y=32619, z=10}
	local noPosition = {x=32237, y=32605, z=10}
        if (getPlayerLevel(cid) >= 25) and (getPlayerLevel(cid) <= 49) then
		    	doTeleportThing(cid, newPosition, TRUE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, noPosition, TRUE)
			doPlayerSendTextMessage(cid,19,'This area is not suitable for your skills.')
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
end








