local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function greetCallback(cid)
	local p = Player(cid)
	if(p:getStorageValue(1004) < 9) then
		npcHandler:say("GRRRRRRRRRRRRR", cid)
		return false
	end
	return true
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	

	local p = Player(cid)
	if(msgcontains(msg, "addon") or msgcontains(msg, "outfit")) then
		if(p:getStorageValue(1004) == 9) then
			npcHandler:say("I can see in your eyes that you are a honest and friendly person, " .. getPlayerName(cid) .. ". You were patient enough to learn our language and I will grant you a special gift. Will you accept it?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 2) then	
			npcHandler:say("From now on, you shall be known as " .. getPlayerName(cid) .. ", the bear warrior. You shall be strong and proud as Angros, the great dark bear. He shall guide your path.", cid)
			p:setStorageValue(1004, 10)
			doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 148 or 144, 2)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end


npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())