local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end

function creatureSayCallback(cid, type, msg)
	
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	if msgcontains(msg, "hi") or msgcontains(msg, "hello") then
		selfSay("maintenance", cid)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, "bye") then
		selfSay("bye", cid)
		npcHandler.topic[cid] = 0
	end
end	

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())