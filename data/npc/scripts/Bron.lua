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
	storagebarbarian = 22015
	
	if(msgcontains(msg, "addon") or msgcontains(msg, "outfit")) then
		if(getPlayerStorageValue(cid, storagebarbarian) < 1) then
			npcHandler:say("To get barbarian wig you need give me a fighting spirit, the warrior\'s sweat, 50 red pieces of cloth, 50 green pieces of cloth and 10 spider silk yarns. Do you have them with you?", cid)
			npcHandler.topic[cid] = 1
		else
			selfSay("You already have this outfit!", cid)
			npcHandler.topic[cid] = 0
		end
	elseif(msgcontains(msg, "yes") and getPlayerStorageValue(cid, storagebarbarian) < 1) then
			if getPlayerItemCount(cid,5884) >= 1 and getPlayerItemCount(cid,5885) >= 1 and getPlayerItemCount(cid,5911) >= 50 and getPlayerItemCount(cid,5910) >= 50 and getPlayerItemCount(cid,5886) >= 10 then
				doPlayerRemoveItem(cid,5884,1)
				doPlayerRemoveItem(cid,5885,1)
				doPlayerRemoveItem(cid,5911,50)
				doPlayerRemoveItem(cid,5910,50)
				doPlayerRemoveItem(cid,5886,10)
				npcHandler:say("Ah, right! The barbarian wig! Here you go.", cid)
				doPlayerAddOutfit(cid, 143, 2)
				doPlayerAddOutfit(cid, 147, 2)  
				setPlayerStorageValue(cid, storagebarbarian, 1)
				if player:getStorageValue(22015) == 1 and player:getStorageValue(22012) == 1 then
					player:addAchievement('Brutal Politeness')
				end
				npcHandler.topic[cid] = 0
			else
				selfSay("You do not have all the required items.", cid)
				npcHandler.topic[cid] = 0
			end
		end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())