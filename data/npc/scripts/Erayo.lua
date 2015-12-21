local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function greetCallback(cid)
	if(getCreatureCondition(cid, CONDITION_INVISIBLE)) then
		return true
	end
	return false
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	
	if(msgcontains(msg, "addon") or msgcontains(msg, "outfit")) then
		if(getPlayerStorageValue(cid, 18903) < 1) then
			npcHandler:say("Vescu gave you an assassin outfit? Haha. Noticed it lacks the head piece? You look a bit silly. Want my old head piece?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "blue piece of cloth") or msgcontains(msg, "blue cloth")) then
		if(getPlayerStorageValue(cid, 18903) == 1) then
			npcHandler:say("Brought the 50 pieces of blue cloth?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif(msgcontains(msg, "green piece of cloth") or msgcontains(msg, "green cloth")) then
		if(getPlayerStorageValue(cid, 18903) == 2) then
			npcHandler:say("Brought the 50 pieces of green cloth?", cid)
			npcHandler.topic[cid] = 4
		end
	elseif(msgcontains(msg, "red piece of cloth") or msgcontains(msg, "red cloth")) then
		if(getPlayerStorageValue(cid, 18903) == 3) then
			npcHandler:say("Brought the 50 pieces of red cloth?", cid)
			npcHandler.topic[cid] = 5
		end
	elseif(msgcontains(msg, "brown piece of cloth") or msgcontains(msg, "brown cloth")) then
		if(getPlayerStorageValue(cid, 18903) == 4) then
			npcHandler:say("Brought the 50 pieces of brown cloth?", cid)
			npcHandler.topic[cid] = 6
		end
	elseif(msgcontains(msg, "yellow piece of cloth") or msgcontains(msg, "yellow cloth")) then
		if(getPlayerStorageValue(cid, 18903) == 5) then
			npcHandler:say("Brought the 50 pieces of yellow cloth?", cid)
			npcHandler.topic[cid] = 7
		end
	elseif(msgcontains(msg, "white piece of cloth") or msgcontains(msg, "white cloth")) then
		if(getPlayerStorageValue(cid, 18903) == 6) then
			npcHandler:say("Brought the 50 pieces of white cloth?", cid)
			npcHandler.topic[cid] = 8
		end
	elseif(msgcontains(msg, "spool of yarn") or msgcontains(msg, "yarn")) then
		if(getPlayerStorageValue(cid, 18903) == 7) then
			npcHandler:say("Brought the 10 spools of yarn?", cid)
			npcHandler.topic[cid] = 9
		end

	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			selfSay("Thought so. Could use some help anyway. Listen, I need stuff. Someone gave me a strange assignment - sneak into Thais castle at night and shroud it with cloth withoutanyone noticing it. ...", cid)
			selfSay("I wonder why anyone would want to shroud a castle, but as long as long as the guy pays, no problem, I'll do the sneaking part. Need a lot of cloth though. ...", cid)
			selfSay("Gonna make it colourful. Bring me 50 pieces of blue cloth, 50 pieces of green cloth, 50 pieces of red cloth, 50 pieces of brown cloth, 50 pieces of yellow cloth and 50 pieces of white cloth. ...", cid)
			npcHandler:say("Besides, gonna need 10 spools of yarn. Understood?", cid)
			npcHandler.topic[cid] = 2
		elseif(npcHandler.topic[cid] == 2) then
			npcHandler:say("Good. Start with the blue cloth. I'll wait.", cid)
			setPlayerStorageValue(cid, 18903, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 3) then
			if(getPlayerItemCount(cid, 5912) >= 50) then
				npcHandler:say("Good. Get me 50 pieces of green cloth now.", cid)
				doPlayerRemoveItem(cid, 5912, 50)
				setPlayerStorageValue(cid, 18903, 2)
				npcHandler.topic[cid] = 0	
			end
		elseif(npcHandler.topic[cid] == 4) then
			if(getPlayerItemCount(cid, 5910) >= 50) then
				npcHandler:say("Good. Get me 50 pieces of red cloth now.", cid)
				doPlayerRemoveItem(cid, 5910, 50)
				setPlayerStorageValue(cid, 18903, 3)
				npcHandler.topic[cid] = 0	
			end
		elseif(npcHandler.topic[cid] == 5) then
			if(getPlayerItemCount(cid, 5911) >= 50) then
				npcHandler:say("Good. Get me 50 pieces of brown cloth now.", cid)
				doPlayerRemoveItem(cid, 5911, 50)
				setPlayerStorageValue(cid, 18903, 4)
				npcHandler.topic[cid] = 0
			end
		elseif(npcHandler.topic[cid] == 6) then
			if(getPlayerItemCount(cid, 5913) >= 50) then
				npcHandler:say("Good. Get me 50 pieces of yellow cloth now.", cid)
				doPlayerRemoveItem(cid, 5913, 50)
				setPlayerStorageValue(cid, 18903, 5)
				npcHandler.topic[cid] = 0
			end
		elseif(npcHandler.topic[cid] == 7) then
			if(getPlayerItemCount(cid, 5914) >= 50) then
				npcHandler:say("Good. Get me 50 pieces of white cloth now.", cid)
				doPlayerRemoveItem(cid, 5914, 50)
				setPlayerStorageValue(cid, 18903, 6)
				npcHandler.topic[cid] = 0
			end
		elseif(npcHandler.topic[cid] == 8) then
			if(getPlayerItemCount(cid, 5909) >= 50) then
				npcHandler:say("Good. Get me 10 spools of yarn now.", cid)
				doPlayerRemoveItem(cid, 5909, 50)
				setPlayerStorageValue(cid, 18903, 7)
				npcHandler.topic[cid] = 0
			end
		elseif(npcHandler.topic[cid] == 9) then
			if(getPlayerItemCount(cid, 5886) >= 10) then
				npcHandler:say("Thanks. That's it, you're done. Good job. I keep my promise. Here's my old assassin head piece.", cid)
				doPlayerRemoveItem(cid, 5886, 10)
				doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 156 or 152, 1)
				setPlayerStorageValue(cid, 18903, 8)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())