function onStepIn(cid, item, position, fromPosition)
    local newPosition = {x=32225, y=32607, z=15}
	local noPosition = {x=32237, y=32605, z=15}
        if (getPlayerLevel(cid) >= 80) then
		    	doTeleportThing(cid, newPosition, TRUE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, noPosition, TRUE)
			doPlayerSendTextMessage(cid,19,'This area is not suitable for your skills.')
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
end








