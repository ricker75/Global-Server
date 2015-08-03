function onUse(cid, item, fromPosition, itemEx, toPosition)
		if(item.itemid == 10153) then
			if(itemEx.itemid == 9801) then
					if(getPlayerStorageValue(cid, 95592) == 12) then
					if getPlayerStorageValue(cid, 324325) <= os.time() then
					golem = math.random(1,4)

					if golem == 1 then
					doCreatureSay(cid, "You ruined the golem remains!", TALKTYPE_ORANGE_1)
					setPlayerStorageValue(cid, 324325, os.time()+10)

					elseif golem == 2 then
					doSummonCreature("Rat", getThingPos(cid))
					doCreatureSay(cid, "Something was stuck in the golem!", TALKTYPE_ORANGE_1)
					setPlayerStorageValue(cid, 324325, os.time()+10)

					elseif golem == 3 then
					doPlayerAddItem(cid, 10151, 1)
					doCreatureSay(cid, "You have salvaged a golem part!", TALKTYPE_ORANGE_1)
					setPlayerStorageValue(cid, 324325, os.time()+10)
			
					elseif golem == 4 then
					doPlayerAddItem(cid, 8309, 1)
					doCreatureSay(cid, "You salvaged some scrap metal!", TALKTYPE_ORANGE_1)
					setPlayerStorageValue(cid, 324325, os.time()+10)

					end
				end
			end
		end
	end
return true
end