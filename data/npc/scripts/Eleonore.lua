local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	
	if(msgcontains(msg, "ring")) then
		if(getPlayerStorageValue(cid, 28901) < 1) then
			selfSay("My ring was stolen by a parrot, directly from my dressing table near the window. It flew to the nearby mountains and I fear my ring will be lost forever. Whoever returns it to me will be rewarded generously. ...", cid)
			npcHandler:say("I guess that evil parrot hid the ring somewhere on a high tree or a rock so that you might need a rake to get it.", cid)
			setPlayerStorageValue(cid, 28901, 1)
			setPlayerStorageValue(cid, 29105, 1) -- Quest Log
			npcHandler.topic[cid] = 0
		elseif(getPlayerStorageValue(cid, 28901) == 1) then
			npcHandler:say("Oh, my beloved ring! Have you found it and want to return it to me?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "errand")) then
		if(getPlayerStorageValue(cid, 28901) == 3) and getPlayerStorageValue(cid, 29110) < 1 then
			npcHandler:say("Great, thank you! As promised, here are your 5 gold pieces. Is there ... anything left that you might want to discuss with me?", cid)
			doPlayerAddItem(cid, 2148, 5)
			setPlayerStorageValue(cid, 29106, 3) -- Quest Log
			setPlayerStorageValue(cid, 29110, 1) -- exaust
			npcHandler.topic[cid] = 0
		end
	elseif(msgcontains(msg, "peg leg")) then
		if(getPlayerStorageValue(cid, 29110) == 1) then
			npcHandler:say("You have returned my ring and proven yourself as trustworthy. There is something I have to discuss with you. Are you willing to listen?", cid)
			npcHandler.topic[cid] = 5
		end
	elseif(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 29105) == 3) and getPlayerStorageValue(cid, 29106) < 1 then
			npcHandler:say("Thank you! It is not a difficult matter but a rather urgent one. I need to send some money to a person in town. Would you be willing to run this small errand for me?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			if(getPlayerItemCount(cid, 6093) >= 1) then
			npcHandler:say("Oh, thank you so much! Take this gold as a reward. ... which reminds me, I would need some help in another matter. It is only a small errand. Are you interested?", cid)
			doPlayerRemoveItem(cid, 6093, 1)
			doPlayerAddItem(cid, 2148, 150)
			setPlayerStorageValue(cid, 29105, 3) -- Quest Log
			npcHandler.topic[cid] = 2
		else
			npcHandler:say("You do not have the ring.", cid)
			npcHandler.topic[cid] = 0
		end
		elseif(npcHandler.topic[cid] == 2) then
			npcHandler:say("Thank you! It is not a difficult matter but a rather urgent one. I need to send some money to a person in town. Would you be willing to run this small errand for me?", cid)
			npcHandler.topic[cid] = 3
		elseif(npcHandler.topic[cid] == 3) then
			npcHandler:say("I was hoping that you'd agree. Please deliver these 200 gold pieces to the herbalist Charlotta in the south-western part of the town. If you return from this errand, I will grant you 5 gold pieces as reward for your efforts.", cid)
			doPlayerAddItem(cid, 2148, 200)
			setPlayerStorageValue(cid, 28901, 2)
			setPlayerStorageValue(cid, 29106, 1) -- Quest Log
			npcHandler.topic[cid] = 0	
		elseif(npcHandler.topic[cid] == 5) then
			selfSay("I am glad to hear that. So please listen: Due to circumstances too complicated to explain now, I met Captain Ray Striker. He is ... a freedom fighter and would not find my father's acceptance, but we fell in love ...", cid)
			selfSay("Even though he had to hide for a while, we have stayed in contact for a long time now. And our love grew even further against all odds ...", cid)
			selfSay("However, recently we lost contact. I don't know what has happened to him and fear the worst ...", cid)
			selfSay("We always have been aware that something terrible might happen to him due to his lifestyle. But perhaps there is a harmless explanation for the absence of messages <holds her tears back>. I have arranged a passage for you to Ray's hiding place ...", cid)
			selfSay("Contact Captain Waverider, the old fisherman, and tell him the secret word 'peg leg'. He will make sure that you arrive safely ...", cid)
			npcHandler:say("Please look for Ray and find out what happened to him and why he was not able to answer. Return to me as soon as you have found something out. I wish you a good journey.", cid)
			setPlayerStorageValue(cid, 28901, 4)
			setPlayerStorageValue(cid, 29107, 1) -- Quest Log
			setPlayerStorageValue(cid, 29110, 2) -- exaust
			npcHandler.topic[cid] = 0	
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())