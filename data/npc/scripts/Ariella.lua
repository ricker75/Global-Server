local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local YELL = {
	"Have a drink in Meriana's only tavern!"
}
 
yell_delay = 20
frequency = 25
 
function onThink() 
	if ((os.time() - yell_delay) >= frequency) then
		yell_delay = os.time()
		doCreatureSay(getNpcCid(), YELL[math.random(#YELL)], 1)
	end
	npcHandler:onThink() 
end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	if(msgcontains(msg, "addon") or msgcontains(msg, "outfit")) then
		if(getPlayerStorageValue(cid, 10065) < 1) then
			npcHandler:say("You mean my hat? Well, I might have another one just like that, but I won't simply give it away, even if you earned our trust. You'd have to fulfil a task first.", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "task")) then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("Your task is to bring me the shirt of the Lethal Lissy, the sabre of Ron the Ripper, the hat of Brutus Bloodbeard and the eye patch of Deadeye Devious. Did you succeed?", cid)
			npcHandler.topic[cid] = 2
		end

	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 2) then
			if(getPlayerItemCount(cid, 6101) >= 1) and getPlayerItemCount(cid, 6102) >= 1 and getPlayerItemCount(cid, 6100) >= 1 and getPlayerItemCount(cid, 6099) >= 1 then
				npcHandler:say("INCREDIBLE! You have found all four of them! You have my respect. You more than deserve this hat. There you go.", cid)
				doPlayerRemoveItem(cid, 6101, 1)
				doPlayerRemoveItem(cid, 6102, 1)
				doPlayerRemoveItem(cid, 6100, 1)
				doPlayerRemoveItem(cid, 6099, 1)
				setPlayerStorageValue(cid, 10065, 2)
				doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 155 or 151, 2)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())