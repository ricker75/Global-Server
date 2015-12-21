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
	

	-- WAGON TICKET
	if(msgcontains(msg, "ticket")) then
		if(getPlayerStorageValue(cid, 1131) < os.time()) then
			npcHandler:say("Do you want to purchase a weekly wagon ticket for 250 gold?", cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say("Your weekly ticket is still valid. Would be a waste of money to purchase a second one.", cid)
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			if(getPlayerMoney(cid) >= 250) then
				doPlayerRemoveMoney(cid, 250)
				setPlayerStorageValue(cid, 1131, os.time() + 7 * 24 * 60 * 60 * 1000)
				npcHandler:say("Thank you for purchasing a wagon ticket.", cid)
			else
				npcHandler:say("You don't have enought money.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	-- WAGON TICKET
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())