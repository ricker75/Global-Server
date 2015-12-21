local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not(npcHandler:isFocused(cid))) then
		return false
	end
	 	
	if msgcontains(msg, 'wood') or msgcontains(msg, 'ship') or msgcontains(msg, 'wreck') or msgcontains(msg, 'passage') or msgcontains(msg, 'liberty bay') then
		if(getPlayerStorageValue(cid, 55700) < 1) then
		npcHandler:say('I would love to bring you back to Liberty Bay, but as you can see, my ship is ruined. I also hurt my leg and can barely move. Can you help me?', cid)
		npcHandler.topic[cid] = 1
	elseif(getPlayerStorageValue(cid, 55700) == 1) then
		npcHandler:say("Have you brought 30 pieces of wood so that I can repair the ship? ", cid)
		npcHandler.topic[cid] = 3
	elseif(getPlayerStorageValue(cid, 55700) == 2) then
		npcHandler:say("Do you want to travel back to Liberty Bay?", cid)
		npcHandler.topic[cid] = 4
	end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			selfSay("Thank you. Luckily, the damage my ship has taken looks more severe than it is, so I will only need a few wooden boards. ...", cid)
			selfSay("I saw some lousy trolls running away with some parts of the ship. It might be a good idea to follow them and check if they have some more wood. ...", cid)
			npcHandler:say("We will need 30 pieces of wood, no more, no less. Did you understand everything?", cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			npcHandler:say("Good! Please return once you have gathered 30 pieces of wood.", cid)
			setPlayerStorageValue(cid, 55700, 1)
			setPlayerStorageValue(cid, 29105, 1) -- Quest Log Default
			setPlayerStorageValue(cid, 29109, 1) -- Quest Log
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			if(getPlayerItemCount(cid, 5901) >= 30) then
				doPlayerRemoveItem(cid, 5901, 30)
				npcHandler:say("Excellent! Now we can leave this godforsaken place. Thank you for your help. Should you ever want to return to this island, ask me for a passage to Goroma.", cid)
				setPlayerStorageValue(cid, 55700, 2)
				setPlayerStorageValue(cid, 29109, 2) -- Quest Log
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 4 then
			doTeleportThing(cid, {x=32285, y=32891, z=6})
			doSendMagicEffect({x=32285, y=32891, z=6}, CONST_ME_TELEPORT)
			npcHandler.topic[cid] = 0
    		end
		end
	return true
end 

npcHandler:setMessage(MESSAGE_GREET, "Hello, Sir |PLAYERNAME|.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye then.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())