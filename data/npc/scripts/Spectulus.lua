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
	
	
	if(msgcontains(msg, "machine")) then
		if(getPlayerStorageValue(cid, 33313) == 1) and getPlayerStorageValue(cid, 33312) < 2 then
			selfSay("Ah, the machine you found at that island. Well, I built this thing to venture far beneath the very soil we walk on. I suspected something there. Something deep down below. Something evil. Even more so than the dreaded bugs which are crawling my study. ...", cid)
			selfSay("Drilling hole after hole only to get stuck in another hard, unbreakable sediment again and again, I was about to quit this pointless enterprise. ...", cid)
			selfSay("However, the very last day I lingered on that island, I finally fell into a large hollow right under the beach. My drill was shattered and the machine was not mobile anymore. ...", cid)
			npcHandler:say("I am well aware that this may sound laughable now - at this part all of my colleagues burst into laughter anyway - but suddenly there were stairs. Incredibly large stairs that led to the underworld. A world deep under the sea - can you believe this?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			selfSay("You do? Well, the end of this story was that I had to leave the place. ...", cid)
			selfSay("I couldn't explore what lies below the stairs as their was an unpredictable stream. Diving into these waters would have been an uncontrollable risk, even with the means to survive without any air. ...", cid)
			selfSay("So I used the portable teleporting device I installed into my machine in case of an emergency and went home. I could only take the most important research documents with me and had to leave most of my equipment in the cave. ...", cid)
			selfSay("Of course I also left my final notes with the coordinates there. And for the life of me I cannot remember where I dug that stupid hole. ...", cid)
			selfSay("When I arrived at home I immediately started looking for a way to manoeuvre in these chaotic conditions once I rediscovered the lost entrance. I never remembered it, but it seems you found it as you indeed have my original notes. ...", cid)
			npcHandler:say("Oh and just in case you want to complete what I have started - feel free to do so. Up to it?", cid)
			npcHandler.topic[cid] = 2
		elseif(npcHandler.topic[cid] == 2) then
			selfSay("Well, if you really want to delve into this - I could use some help. So you have found my machine on that island? And you found the notes with the coordinates? Then you can find the entrance! ...", cid)
			selfSay("Just look for a large staircase with sprawling steps. There is an unpassable stream there that will prevent you from venturing further on. But fear not, you can indeed travel down there - with these small enhancements I created. ...", cid)
			selfSay("At first, take this gold for the passage by ship and return to the Gray Island from where I started my expedition many years ago. From there you should find a way to reach the Gray Beach of Quirefang as no ordinary ship can land there. ...", cid)
			npcHandler:say("I will put this under your footgear. Here you go. And this in your nose. There. And there will be no further problems for you down there. Except- ah, well you'll find out yourself soon enough, won't you?", cid)
			npcHandler.topic[cid] = 3
		elseif(npcHandler.topic[cid] == 3) then
			npcHandler:say("Then off you go! I'm sorry that I cannot offer you any further help but I'm sure you will find support along your way. And - be careful. The sea can appear pitch black down there.", cid)
			setPlayerStorageValue(cid, 33312, 2) -- quest log finish mission 01
			setPlayerStorageValue(cid, 33314, 1)
			npcHandler.topic[cid] = 0	
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())