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
	

	if msgcontains(msg, "tunnel") then
		if(getPlayerStorageValue(cid, 33830) == 1) then
			selfSay("There should be a book in our library about tunnelling. I don't have that much time to talk to you about that. ...", cid)
			npcHandler:say("If you want to have some information, you'll just have to find that book. If you need some equipment, go ask Harog. You'll find the library in the north eastern wing of Beregar city.", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "book")) then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("The book about tunnelling is in the library which is located in the north eastern wing of Beregar city.", cid)
			setPlayerStorageValue(cid, 33830, 2)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())