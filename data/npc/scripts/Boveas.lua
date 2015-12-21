local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not(npcHandler:isFocused(cid))) then
		return false
	end
   	   	
	if (msgcontains(msg, 'research notes')) then
			if(getPlayerStorageValue(cid, 95591) == 1) and getPlayerStorageValue(cid, 91594) < 1 then
			npcHandler:say("Oh, of course I can send him my research notes. I'll drop them into the next mailbox as soon as possible. May the Gods bless the royal Tibian mail system and its fearless and sometimes maimed postmen.", cid)
			setPlayerStorageValue(cid, 95592, getPlayerStorageValue(cid, 95592) + 1)
			setPlayerStorageValue(cid, 82960, getPlayerStorageValue(cid, 82960) + 1) -- quest log
			setPlayerStorageValue(cid, 91594, 1)
			npcHandler.topic[cid] = 0
	    	end
		end
	return true
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
