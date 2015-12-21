function onStepIn(cid, item, position, fromPosition)
    local newPosition = {x=32243, y=32589, z=14}
	local noPosition = {x=32237, y=32605, z=14}
        if (getPlayerLevel(cid) >= 80) then
		    	doTeleportThing(cid, newPosition, TRUE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, noPosition, TRUE)
			doPlayerSendTextMessage(cid,19,'As soon as you enter the water a very strong drift drags you down. Entering these waters is too dangerous without preparation.')
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end
end








