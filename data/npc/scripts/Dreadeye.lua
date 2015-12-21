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
			if(getPlayerStorageValue(cid, 95591) == 1) and getPlayerStorageValue(cid, 91593) < 1 then
			selfSay("Of course! He will receive the knowledge that I choose to share with him - although with his limited intelligence I doubt he will grasp the concepts I send him. ...", cid)
			selfSay("Warn him that the consequences, for you both, will be dire if you fail to succeed in your undertaking. Your limited intellect cannot comprehend the importance of this. ...", cid)
			npcHandler:say("Even I do not know what this portends. But.. yet .. sometimes .. there is a glimpse. An insight that unsettles me. An emotion long forgotten.", cid)
			setPlayerStorageValue(cid, 95592, getPlayerStorageValue(cid, 95592) + 1)
			setPlayerStorageValue(cid, 82960, getPlayerStorageValue(cid, 82960) + 1) -- quest log
			setPlayerStorageValue(cid, 91593, 1)
			npcHandler.topic[cid] = 0			
	    	end
		end
	return true
end 

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
