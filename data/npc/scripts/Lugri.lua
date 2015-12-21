local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	

	if msgcontains(msg, 'task') then
		if getPlayerStorageValue(cid, 14003) < 0 then
			selfSay("What? Who are you to imply I need help from a worm like you? ...", cid)
			selfSay("I don't need help. But if you desperately wish to do something to earn the favour of Zathroth, feel free. Don't expect any reward though. ...", cid)
			npcHandler:say("Do you want to help and serve Zathroth out of your own free will, without demanding payment or recognition?", cid)
			npcHandler.topic[cid] = 6
		elseif getPlayerStorageValue(cid, 14003) == 4000 and getPlayerStorageValue(cid, 14103) < 1 then
			selfSay("You've slain a mere 4000 necromancers and priestesses. Still, you've shown some dedication. Maybe that means you can kill one of those so-called 'leaders' too. ...", cid)
			selfSay("Deep under Drefia, a necromancer called Necropharus is hiding in the Halls of Sacrifice. I'll place a spell on you with which you will be able to pass his weak protective gate. ...", cid)
			npcHandler:say("Know that this will be your only chance to enter his room. If you leave it or die, you won't be able to return. We'll see if you really dare enter those halls.", cid)
			setPlayerStorageValue(cid, 14103, 1)
			setPlayerStorageValue(cid, 81403, 1) -- storage boss acess
		end

	elseif(msgcontains(msg, "outfit")) then
		if(getPlayerStorageValue(cid, 1003) < 1) then
			npcHandler:say("This skull shows that you are a true follower of Zathroth and the glorious gods of darkness. Are you willing to prove your loyalty?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "shield")) then
		if(getPlayerStorageValue(cid, 1003) == 1) then
			npcHandler:say("Is it your true wish to sacrifice a medusa shield to Zathroth?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif(msgcontains(msg, "mail")) then
		if(getPlayerStorageValue(cid, 1003) == 2) then
			npcHandler:say("Is it your true wish to sacrifice a dragon scale mail to Zathroth?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif(msgcontains(msg, "legs")) then
		if(getPlayerStorageValue(cid, 1003) == 3) then
			npcHandler:say("Is it your true wish to sacrifice crown legs to Zathroth?", cid)
			npcHandler.topic[cid] = 4
		end	
	elseif(msgcontains(msg, "ring")) then
		if(getPlayerStorageValue(cid, 1003) == 4) then
			npcHandler:say("Is it your true wish to sacrifice a ring of the sky to Zathroth?", cid)
			npcHandler.topic[cid] = 5
		end

	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then	
			npcHandler:say("It will be a hard task which requires many sacrifices. Do you still want to proceed?", cid)
			npcHandler.topic[cid] = 7
		elseif(npcHandler.topic[cid] == 7) then	
			npcHandler:say("Good decision, " .. getPlayerName(cid) .. ". Your first sacrifice will be a medusa shield. Bring it to me and do give it happily.", cid)
			setPlayerStorageValue(cid, 1003, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 2) then
			if(getPlayerItemCount(cid, 2536) >= 1) then
				npcHandler:say("Good. I accept your sacrifice. The second sacrifice I require from you is a dragon scale mail. Bring it to me and do give it happily.", cid)
				doPlayerRemoveItem(cid, 2536, 1)
				setPlayerStorageValue(cid, 1003, 2)
				npcHandler.topic[cid] = 0	
			end
		elseif(npcHandler.topic[cid] == 3) then
			if(getPlayerItemCount(cid, 2492) >= 1) then
				npcHandler:say("Good. I accept your sacrifice. The third sacrifice I require from you are crown legs. Bring them to me and do give them happily.", cid)
				doPlayerRemoveItem(cid, 2492, 1)
				setPlayerStorageValue(cid, 1003, 3)
				npcHandler.topic[cid] = 0	
			end
		elseif(npcHandler.topic[cid] == 4) then
			if(getPlayerItemCount(cid, 2488) >= 1) then
				npcHandler:say("Good. I accept your sacrifice. The last sacrifice I require from you is a ring of the sky. Bring it to me and do give it happily.", cid)
				doPlayerRemoveItem(cid, 2488, 1)
				setPlayerStorageValue(cid, 1003, 4)
				npcHandler.topic[cid] = 0	
			end
		elseif(npcHandler.topic[cid] == 5) then
			if(getPlayerItemCount(cid, 2123) >= 1) then
				npcHandler:say("Good. I accept your sacrifice. You have proven that you are a true follower of Zathroth and do not hesitate to sacrifice worldly goods. Thus, I will reward you with this headgear. ", cid)
				doPlayerRemoveItem(cid, 2123, 1)
				setPlayerStorageValue(cid, 1003, 5)
				doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 149 or 145, 2)
				npcHandler.topic[cid] = 0	
			end
		elseif(npcHandler.topic[cid] == 6) then -- task necromancer
			selfSay("You do? I mean - wise decision. Let me explain. By now, Tibia has been overrun by numerous followers of different cults and beliefs. The true Necromancers died or left Tibia long ago, shortly after their battle was lost. ...", cid)
			selfSay("What is left are mainly pseudo-dark pretenders, the old wisdom and power being far beyond their grasp. They think they have the right to tap that dark power, but they don't. ...", cid)
			npcHandler:say("I want you to eliminate them. As many as you can. Both necromancers and priestesses. And as I said, don't expect a reward - this is what has to be done to cleanse Tibia of its false dark prophets.", cid)
			setPlayerStorageValue(cid, 14003, 0)
			setPlayerStorageValue(cid, 100157, 1) -- quest log killing in the name
			npcHandler.topic[cid] = 0	
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())