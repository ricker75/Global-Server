-- Script feito por Yuri Lagrotta --
-- Não retire os creditos --

function onUse(cid, item, fromPosition, itemEx, toPosition)

	if item.actionid == 35603 then 	
		if(item.itemid == 10172) then	
			if(getPlayerStorageValue(cid, 95592) > 35) then					
			doTeleportThing(cid, {x = 32894, y = 31296, z = 11}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		end
	end

	elseif item.actionid == 35604 then 	
		if(item.itemid == 10172) then	
			if(getPlayerStorageValue(cid, 95592) > 35) then					
			doTeleportThing(cid, {x = 32894, y = 31296, z = 9}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
		end
	end
	

		end
	return true
end
