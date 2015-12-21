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
	
	
	if(msgcontains(msg, "addon") or msgcontains(msg, "outfit")) then
		if(getPlayerStorageValue(cid, 68335) < 1) then
			npcHandler:say("My turban? Eh no, you can't have it. Only oriental weaponmasters may wear it after having completed a difficult task.", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "task")) then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("You mean, you would like to prove that you deserve to wear such a turban?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif(msgcontains(msg, "ape fur")) then
		if(getPlayerStorageValue(cid, 68335) == 1) then
			npcHandler:say("Have you really managed to fulfil the task and brought me 100 pieces of ape fur?", cid)
			npcHandler.topic[cid] = 4
		end
	elseif(msgcontains(msg, "fish fins")) then
		if(getPlayerStorageValue(cid, 68335) == 2) then
			npcHandler:say("Were you able to discover the undersea race and retrieved 100 fish fins?", cid)
			npcHandler.topic[cid] = 5
		end
	elseif(msgcontains(msg, "enchanted chicken wings")) then
		if(getPlayerStorageValue(cid, 68335) == 3) then
			npcHandler:say("Were you able to get hold of two enchanted chicken wings?", cid)
			npcHandler.topic[cid] = 6
		end
	elseif(msgcontains(msg, "blue cloth") or msgcontains(msg, "blue piece of cloth")) then
		if(getPlayerStorageValue(cid, 68335) == 4) then
			npcHandler:say("Ah, have you brought the 100 pieces of blue cloth?", cid)
			npcHandler.topic[cid] = 7
		end

	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 2) then
			selfSay("Alright, then listen to the following requirements. We are currently in dire need of ape fur since the Caliph has requested a newbathroom carpet. ...", cid)
			selfSay("Thus, please bring me 100 pieces of ape fur. Secondly, it came to our ears that the explorer society has discovered a new undersea race of fishmen. ...", cid)
			selfSay("Their fins are said to allow humans to walk on water! Please bring us 100 of these fish fin. ...", cid)
			selfSay("Third, if the plan of walking on water should fail, we need enchanted chicken wings to prevent the testers from drowning. Please bring me two. ...", cid)
			selfSay("Last but not least, just drop by with 100 pieces of blue cloth and I will happily show you how to make a turban. ...", cid)
			npcHandler:say("Did you understand everything I told you and are willing to handle this task?", cid)
			npcHandler.topic[cid] = 3
		elseif(npcHandler.topic[cid] == 3) then
			npcHandler:say("Excellent! Come back to me once you have collected 100 pieces of ape fur.", cid)
			setPlayerStorageValue(cid, 68335, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 4) and getPlayerItemCount(cid, 5883) >= 100 then
			npcHandler:say("Ahhh, this softness! I'm impressed, ".. getPlayerName(cid) ..". You're on the best way to earn that turban. Now, please retrieve 100 fish fins.", cid)
			doPlayerRemoveItem(cid, 5883, 100)
			setPlayerStorageValue(cid, 68335, 2)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 5) and getPlayerItemCount(cid, 5895) >= 100 then
			npcHandler:say("I never thought you'd make it, ".. getPlayerName(cid) ..". Now we only need two enchanted chicken wings to start our waterwalking test!", cid)
			doPlayerRemoveItem(cid, 5895, 100)
			setPlayerStorageValue(cid, 68335, 3)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 6) and getPlayerItemCount(cid, 5891) >= 2 then
			npcHandler:say("Great, thank you very much. Just bring me 100 pieces of blue cloth now and I will happily show you how to make a turban.", cid)
			doPlayerRemoveItem(cid, 5891, 2)
			setPlayerStorageValue(cid, 68335, 4)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 7) and getPlayerItemCount(cid, 5912) >= 100 then
			npcHandler:say("Ah! Congratulations - even if you are not a true weaponmaster, you surely deserve to wear this turban. Here, I'll tie it for you.", cid)
			doPlayerRemoveItem(cid, 5912, 100)
			doPlayerAddOutfit(cid, 146, 2)
			setPlayerStorageValue(cid, 68335, 5)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())