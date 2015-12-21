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
	

	if(msgcontains(msg, "addon")) then
		if(getPlayerStorageValue(cid, 1005) < 1) then
			npcHandler:say("Would you like to wear bear paws like I do? No problem, just bring me 50 bear paws and 50 wolf paws and I'll fit them on.", cid)
			setPlayerStorageValue(cid, 1005, 1)
			npcHandler.topic[cid] = 0
		end
	elseif(msgcontains(msg, "paws") or msgcontains(msg, "addon")) then
		if(getPlayerStorageValue(cid, 1005) == 1) then
			npcHandler:say("Have you brought 50 bear paws and 50 wolf paws?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			if(getPlayerItemCount(cid, 5896) >= 50 and getPlayerItemCount(cid, 5897) >= 50) then
				npcHandler:say("Excellent! Like promised, here are your bear paws. ", cid)
				doPlayerRemoveItem(cid, 5896, 50)
				doPlayerRemoveItem(cid, 5897, 50)
				setPlayerStorageValue(cid, 1005, 2)
				doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 148 or 144, 1)
				npcHandler.topic[cid] = 0	
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())