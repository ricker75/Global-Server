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
	
	
	if(msgcontains(msg, "addon") or msgcontains(msg, "outfit")) then
		if(getPlayerStorageValue(cid, 10055) < 1) then
			npcHandler:say("You're talking about my sabre? Well, even though you earned our trust, you'd have to fulfil a task first before youare granted to wear such a sabre.", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "task")) then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("Are you up to the task which I'm going to give you and willing to prove you're worthy of wearing such a sabre?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif(msgcontains(msg, "eye patche") or msgcontains(msg, "eye")) then
		if(getPlayerStorageValue(cid, 10055) == 1) then
			npcHandler:say("Have you gathered 100 eye patches?", cid)
			npcHandler.topic[cid] = 4
		else
			npcHandler:say("You don't have it...", cid)
	end
	elseif(msgcontains(msg, "peg leg") or msgcontains(msg, "peg")) then
		if(getPlayerStorageValue(cid, 10055) == 2) then
			npcHandler:say("Have you gathered 100 peg legs?", cid)
			npcHandler.topic[cid] = 5
		else
			npcHandler:say("You don't have it...", cid)
	end
	elseif(msgcontains(msg, "hooks") or msgcontains(msg, "hook")) then
		if(getPlayerStorageValue(cid, 10055) == 3) then
			npcHandler:say("Have you gathered 100 hooks?", cid)
			npcHandler.topic[cid] = 6
		else
			npcHandler:say("You don't have it...", cid)
	end

	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 2) then
			selfSay("Listen, the task is not that hard. Simply prove that you are with us and not with the pirates from Nargor by bringingme some of their belongings. ...", cid)
			selfSay("Bring me 100 of their eye patches, 100 of their peg legs and 100 of their hooks, in that order. ...", cid)
			npcHandler:say("Have you understood everything I told you and are willing to handle this task?", cid)
			npcHandler.topic[cid] = 3
		elseif(npcHandler.topic[cid] == 3) then
			npcHandler:say("Good! Come back to me once you have gathered 100 eye patches.", cid)
			setPlayerStorageValue(cid, 10055, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 4) then
			if(getPlayerItemCount(cid, 6098) >= 100) then
				npcHandler:say("Good job. Alright, now bring me 100 peg legs.", cid)
				doPlayerRemoveItem(cid, 6098, 100)
				setPlayerStorageValue(cid, 10055, 2)
				npcHandler.topic[cid] = 0	
			end
		elseif(npcHandler.topic[cid] == 5) then
			if(getPlayerItemCount(cid, 6126) >= 100) then
				npcHandler:say("Nice. Lastly, bring me 100 pirate hooks. That should be enough to earn your sabre.", cid)
				doPlayerRemoveItem(cid, 6126, 100)
				setPlayerStorageValue(cid, 10055, 3)
				npcHandler.topic[cid] = 0	
			end
		elseif(npcHandler.topic[cid] == 6) then
			if(getPlayerItemCount(cid, 6097) >= 100) then
				npcHandler:say(" I see, I see. Well done. Go to Morgan and tell him this codeword: 'firebird'. He'll know what to do.", cid)
				doPlayerRemoveItem(cid, 6097, 100)
				setPlayerStorageValue(cid, 10055, 4)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())