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
	
	local player = Player(cid)
	
	if(msgcontains(msg, "gold")) then
		if(getPlayerStorageValue(cid, 28901) == 2) then
			npcHandler:say("Oh, so you brought some gold from Eleonore to me?", cid)
			npcHandler.topic[cid] = 1
		end

	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
				if player:getMoney() >= 200 then
				npcHandler:say("Hmm, it seems that Eleonore does trust you. Perhaps she is even right. However. Since we need some help right now I guess we can't be too picky. Return to Eleonore and tell her the secret password: 'peg leg'. She will tell you more about her problem.", cid)
				player:removeMoney(200)
				setPlayerStorageValue(cid, 28901, 3)
				setPlayerStorageValue(cid, 29106, 2) -- Quest Log
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You do not have the gold.", cid)
				npcHandler.topic[cid] = 0
			end
		end
	end
	return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())