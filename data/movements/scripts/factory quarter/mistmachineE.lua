function onStepIn(cid, item, position, fromPosition)
    local newPosition = {x=32869, y=31312, z=11}
	local noPosition = {x=32875, y=31318, z=10}
        if (getPlayerStorageValue(cid, 10251) == 1) then
		    	doTeleportThing(cid, newPosition, TRUE)
			doSendMagicEffect(newPosition, CONST_ME_TELEPORT)
		else
			doTeleportThing(cid, fromPosition, TRUE)
			doSendMagicEffect(noPosition, CONST_ME_POFF)
                doPlayerSendTextMessage(cid,19,"Access denied! Please insert 4 gear wheels into the relais either to the left or to the right, to calibrate the teleporter.") 

	end
end