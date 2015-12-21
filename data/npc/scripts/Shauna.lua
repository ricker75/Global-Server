local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                                      npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	

	-- Mission 1 - The Supply Thief 
	if(msgcontains(msg, "job")) then
		if(getPlayerStorageValue(cid, GreenDjinn.MissionStart+1) == 1) then
			npcHandler:say("What do you think? I am the sheriff of Carlin.", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "water pipe")) then
		if(npcHandler.topic[cid] == 1) then
			selfSay("Oh, there's a waterpipe in one of my cells? ...", cid)
			npcHandler:say("I guess my last {prisoner} forgot it there.", cid)
			npcHandler.topic[cid] = 2
		end
	elseif(msgcontains(msg, "prisoner")) then
		if(npcHandler.topic[cid] == 2) then
			selfSay("My last prisoner? Hmm. ...", cid) 
			selfSay("I think he was some guy from Darama. Can't remember his name. ...", cid)
			selfSay("He was here just for one night, because he got drunk and annoyed our citizens. ...", cid)
			selfSay("Obviously he wasn't pleased with this place, because he headed for Thais the next day. ...", cid)
			npcHandler:say("Something tells me that he won't stay out of trouble for too long.", cid)
			setPlayerStorageValue(cid, GreenDjinn.MissionStart+1, 2)
			npcHandler.topic[cid] = 0
		end
	end
	-- Mission 1 - The Supply Thief 
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())