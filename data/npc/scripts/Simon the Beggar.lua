local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	
	-- Beggar Beard e Dress addon quest by Yuri Lagrotta
	if(msgcontains(msg, "outfit")) then
		if(getPlayerStorageValue(cid, 19905) < 1) then
			npcHandler:say("Haha, that beard is - well, not fake, but there's a trick behind it. I noticed people tend to be more generous towards a poor gramps. Want to know my trick?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "ape fur") or msgcontains(msg, "fur")) then
		if(getPlayerStorageValue(cid, 19905) == 1) then
			npcHandler:say("Have you brought me the 100 pieces of ape fur and 20000 gold pieces?", cid)
			npcHandler.topic[cid] = 3
		end
	-- Beggar Staff addon quest by Yuri Lagrotta
	elseif(msgcontains(msg, "addon")) then
		if(getPlayerStorageValue(cid, 19906) < 1) then
			npcHandler:say("No, no. Our deal is finished, no complaining now, I don't have time all day. And no, you can't have my staff.", cid)
			npcHandler.topic[cid] = 5
		end
	elseif(msgcontains(msg, "staff")) then
		if(npcHandler.topic[cid] == 5) then
			npcHandler:say("I said, no! Or well - I have a suggestion to make. Will you listen?", cid)
			npcHandler.topic[cid] = 6
		elseif(getPlayerStorageValue(cid, 19906) == 1) then
			npcHandler:say("Did you bring my favourite staff??", cid)
			npcHandler.topic[cid] = 8
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			selfSay("I can mix a secret potion which will increase your facial hair growth enormeously. I call it 'Instabeard'. However, it requires certain ingredients. ...", cid)
			selfSay("For the small fee of 20000 gold pieces I will help you mix this potion. Just bring me 100 pieces of ape fur, which are necessary to create this potion. ...", cid)
			npcHandler:say("Do we have a deal?", cid)
			npcHandler.topic[cid] = 2
		elseif(npcHandler.topic[cid] == 2) then
			npcHandler:say("Great! Come back to me once you have the 100 pieces of ape fur and I'll do my part of the deal.", cid)
			setPlayerStorageValue(cid, 19905, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 3) then
			if(getPlayerItemCount(cid, 5883) >= 100) and getPlayerItemCount(cid, 2160) >= 2 then
				npcHandler:say("Ah, right! The beggar beard or beggar dress! Here you go.", cid)
				doPlayerRemoveItem(cid, 5883, 100)
				doPlayerRemoveItem(cid, 2160, 2)
				doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 157 or 153, 1)
				setPlayerStorageValue(cid, 19905, 2)
				npcHandler.topic[cid] = 0	
			end
		elseif(npcHandler.topic[cid] == 6) then
			selfSay("When I was wandering around in Tibia, I lost my favourite staff somewhere in the northern ruins in Edron. ...", cid)
			selfSay("Uh, don't ask me what I was doing there... sort of a pilgrimage. Well anyway, if you could bring that staff back to me, I promise I'll give you my current one. ...", cid)
			npcHandler:say("What do you say?", cid)
			npcHandler.topic[cid] = 7
		elseif(npcHandler.topic[cid] == 7) then
			npcHandler:say("Good! Come back to me once you have retrieved my staff. Good luck.", cid)
			setPlayerStorageValue(cid, 19906, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 8) then
			if(getPlayerItemCount(cid, 6107) >= 1) then
				npcHandler:say("Yes!! That's it! I'm so glad! Here, you can have my other one. Thanks!", cid)
				doPlayerRemoveItem(cid, 6107, 1)
				doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 157 or 153, 2)
				setPlayerStorageValue(cid, 19906, 2)
				npcHandler.topic[cid] = 0	
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())