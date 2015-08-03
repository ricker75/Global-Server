function remove01()
    doTransformItem(getTileItemById({x = 32647, y = 32216, z = 7},6475).uid,13170)
    return true
end 

function remove02()
    doTransformItem(getTileItemById({x = 32659, y = 32213, z = 7},6475).uid,13170)
    return true
end 

function remove03()
    doTransformItem(getTileItemById({x = 32644, y = 32183, z = 6},6474).uid,13172)
    return true
end 

function remove04()
    doTransformItem(getTileItemById({x = 32660, y = 32201, z = 7},6474).uid,13171)
    return true
end 

function remove05()
    doTransformItem(getTileItemById({x = 32652, y = 32200, z = 5},6474).uid,13172)
    return true
end 

function onUse(cid, item, fromPosition, itemEx, toPosition)

	
if(item.itemid == 2557) then

		if itemEx.actionid == 42501 then
			if(getPlayerStorageValue(cid, 41600) == 3) and getPlayerStorageValue(cid, 41500) < 6 then
			doTransformItem(getTileItemById({x = 32647, y = 32216, z = 7},13170).uid,6475)
			setPlayerStorageValue(cid, 41500, getPlayerStorageValue(cid, 41500) + 1)
			addEvent(remove01, 2*60*1000)
		end
 	  
	
		elseif itemEx.actionid == 42502 then
			if(getPlayerStorageValue(cid, 41600) == 3) and getPlayerStorageValue(cid, 41500) < 6 then
			doTransformItem(getTileItemById({x = 32659, y = 32213, z = 7},13170).uid,6475)
			setPlayerStorageValue(cid, 41500, getPlayerStorageValue(cid, 41500) + 1)
			addEvent(remove02, 2*60*1000)
		end

		elseif itemEx.actionid == 42503 then
			if(getPlayerStorageValue(cid, 41600) == 3) and getPlayerStorageValue(cid, 41500) < 6 then
			doTransformItem(getTileItemById({x = 32644, y = 32183, z = 6},13172).uid,6474)
			setPlayerStorageValue(cid, 41500, getPlayerStorageValue(cid, 41500) + 1)
			addEvent(remove03, 2*60*1000)
		end

		elseif itemEx.actionid == 42504 then
			if(getPlayerStorageValue(cid, 41600) == 3) and getPlayerStorageValue(cid, 41500) < 6 then
			doTransformItem(getTileItemById({x = 32660, y = 32201, z = 7},13171).uid,6474)
			setPlayerStorageValue(cid, 41500, getPlayerStorageValue(cid, 41500) + 1)
			addEvent(remove04, 2*60*1000)
		end

		elseif itemEx.actionid == 42505 then
			if(getPlayerStorageValue(cid, 41600) == 3) and getPlayerStorageValue(cid, 41500) < 6 then
			doTransformItem(getTileItemById({x = 32652, y = 32200, z = 5},13172).uid,6474)
			setPlayerStorageValue(cid, 41500, getPlayerStorageValue(cid, 41500) + 1)
			addEvent(remove05, 2*60*1000)
		
			end
 		  end
	end
	return true
end