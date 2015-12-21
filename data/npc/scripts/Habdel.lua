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
	
	
	if(msgcontains(msg, "addon") or msgcontains(msg, "outfit")) then
		if(getPlayerStorageValue(cid, 68328) < 1) then
			npcHandler:say("My scimitar? Yes, that is a true masterpiece. Of course I could make one for you, but I have a small request. Would you fulfil a task for me?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "comb")) then
		if(getPlayerStorageValue(cid, 68330) < 1) then
			npcHandler:say("Have you brought a mermaid's comb for Ishina?", cid)
			npcHandler.topic[cid] = 3
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			selfSay("Listen, um... I know that Ishina has been wanting a comb for a long time... not just any comb, but a mermaid's comb. She said it prevents split ends... or something. ...", cid)
			npcHandler:say("Do you think you could get one for me so I can give it to her? I really would appreciate it.", cid)
			npcHandler.topic[cid] = 2
		elseif(npcHandler.topic[cid] == 2) then
			npcHandler:say("Brilliant! I will wait for you to return with a mermaid's comb then.", cid)
			setPlayerStorageValue(cid, 68328, 1)
			npcHandler.topic[cid] = 0
		elseif(npcHandler.topic[cid] == 3) and getPlayerItemCount(cid, 5945) >= 1 then
			npcHandler:say("Yeah! That's it! I can't wait to give it to her! Oh - but first, I'll fulfil my promise: Here is your scimitar! Thanks again!", cid)
			doPlayerRemoveItem(cid, 5945, 1)
			doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 150 or 146, 1)
			setPlayerStorageValue(cid, 68330, 1)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())