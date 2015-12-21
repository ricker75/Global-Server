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
	

	if msgcontains(msg, "them") then
		if(getPlayerStorageValue(cid, 33830) == 3) then
			npcHandler:say("We were attacked by some sort of assassin trolls or something. They came over us like a storm and in the blink of an eye it was over... everyone was either killed or captured.", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "mission")) then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("I warn you, those trolls are WAY more dangerous than the usual kind. Alone, I can't do anything for my brothers. Find a way to the trolls' hideout and rescue my brothers. Are you willing to help me?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif msgcontains(msg, "yes") then
		if(npcHandler.topic[cid] == 2) then
			npcHandler:say("Great! I hope you find my brothers. Good luck!", cid)
			setPlayerStorageValue(cid, 33830, 4)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end


 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())