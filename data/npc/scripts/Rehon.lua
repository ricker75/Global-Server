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
	

	if msgcontains(msg, "mission") then
		if(getPlayerStorageValue(cid, 33830) == 4) and getPlayerItemCount(cid, 14350) >= 1 then
			npcHandler:say("By the Gods! You have the key to the cell! Thank you sooo much, mate. And now leave. I'll wait here until the air is clean and then I'm out of here.", cid)
			doPlayerRemoveItem(cid, 14350, 1)
			setPlayerStorageValue(cid, 33830, 5)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())