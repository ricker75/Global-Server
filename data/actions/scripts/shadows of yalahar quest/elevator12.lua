-- Script feito por Yuri Lagrotta --
-- Não retire os creditos --

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.actionid == 35605 then 	
		if(item.itemid == 9890) then	
			if(getPlayerStorageValue(cid, 95592) > 38) then					
			doTeleportThing(cid, {x = 32550, y = 31250, z = 11}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		end
	end

	elseif item.actionid == 35606 then 	
		if(item.itemid == 9889) then	
			if(getPlayerStorageValue(cid, 95592) > 38) then					
			doTeleportThing(cid, {x = 32550, y = 31250, z = 9}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		end
	end
	

		end
	return true
end
