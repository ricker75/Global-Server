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
	

	if(msgcontains(msg, "help")) then
		if(getPlayerStorageValue(cid, 985) < 1) then
			npcHandler:say("Defeat. {Slime}. We. Will. Why. Did. You. Kill. Us? Do. You. Want. To. Rectify. And. Help?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			setPlayerStorageValue(cid, 985, 1)
			doPlayerAddItem(cid, 13601, 1)
			npcHandler:say("Then. Take. This. Gobbler. Always. Hungry. Eats. Slime. Fungus. Go. ", cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())