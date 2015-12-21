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
	
	if(msgcontains(msg, "jester staff") or msgcontains(msg, "staff")) then
		if(getPlayerStorageValue(cid, 18650) < 1) then
			npcHandler:say("To get jester staff you need to give me a giant spider silk, 4 minotaur leathers and 10000 gold coins. Do you have them with you?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "jester hat") or msgcontains(msg, "hat")) then
		if(getPlayerStorageValue(cid, 18651) < 1) then
			npcHandler:say("To get jester hat you need to give me 5 white piece of cloth and 10000 gold coins. Do you have them with you?", cid)
			npcHandler.topic[cid] = 2
		end

	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
		        if getPlayerItemCount(cid,5879) >= 1 and getPlayerItemCount(cid,5878) >= 4 and player:getMoney() >= 10000 then 
      			doPlayerRemoveItem(cid,5879,1) 
				doPlayerRemoveItem(cid,5878,4) 
				player:removeMoney(10000)
				npcHandler:say("You\'re hell of a guy, I bet you enjoyed it. As you represent everything a fool stands for, I give you this fool\'s sceptre to spiceup your jester outfit.", cid)
				doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 270 or 273, 1)
				setPlayerStorageValue(cid, 18650, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", player)
			end
		elseif(npcHandler.topic[cid] == 2) then
		     if getPlayerItemCount(cid,5909) >= 5 and player:getMoney() >= 10000 then
       			doPlayerRemoveItem(cid,5909,5) 
				player:removeMoney(10000)
				npcHandler:say("By Kurik, I knew you have it in you. You are a fool after my fancy. Take this jester hat, you deserve it. It will go nicely with your jester costume.", cid)
				doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 270 or 273, 2)
				setPlayerStorageValue(cid, 18651, 1)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", player)
			end
		end
	end
	return true
end


npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())