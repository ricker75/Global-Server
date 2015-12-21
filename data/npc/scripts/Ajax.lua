local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	storagebarbariantwo = 22012
	
	if(msgcontains(msg, "addon") or msgcontains(msg, "outfit")) then
		if(getPlayerStorageValue(cid, storagebarbariantwo) < 1) then
			npcHandler:say("To get barbarian axe you need give me 100 iron ore, a chunk of crude iron, 50 behemoth fangs and 50 lizard leathers. Do you have them with you?", cid)
			npcHandler.topic[cid] = 1
		else
			selfSay("You already have this outfit!", cid)
			npcHandler.topic[cid] = 0
		end
	elseif(msgcontains(msg, "yes") and getPlayerStorageValue(cid, storagebarbariantwo) < 1) then
			  if getPlayerItemCount(cid,5880) >= 100 and getPlayerItemCount(cid,5892) >= 1 and getPlayerItemCount(cid,5893) >= 50 and getPlayerItemCount(cid,5876) >= 50 then
				doPlayerRemoveItem(cid,5880,100)
				doPlayerRemoveItem(cid,5892,1) 
				doPlayerRemoveItem(cid,5893,50) 
				doPlayerRemoveItem(cid,5876,50)
				npcHandler:say("Ah, right! The barbarian axe! Here you go.", cid)
				doPlayerAddOutfit(cid, 143, 1)
				doPlayerAddOutfit(cid, 147, 1)  
				setPlayerStorageValue(cid, storagebarbariantwo, 1)
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