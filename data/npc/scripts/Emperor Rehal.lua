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
	

	if msgcontains(msg, "mission") then
		if(getPlayerStorageValue(cid, 33830) < 1) then
			npcHandler:say("As you have proven yourself trustworthy I'm going to assign you a special mission. Are you interested?", cid)
			npcHandler.topic[cid] = 1
		elseif(getPlayerStorageValue(cid, 33830) == 5) and getPlayerStorageValue(cid, 33832) < 1 then
			selfSay("My son was captured by trolls? Doesn't sound like him, but if you say so. Now you want a reward, huh? ...", cid)
			npcHandler:say("Look at these dwarven legs. They were forged years ago by a dwarf who was rather tall for our kind. I want you to have them. Thank you for rescuing my son ".. getPlayerName(cid) ..".", cid)
			setPlayerStorageValue(cid, 33832, 1)
			doPlayerAddItem(cid, 2504, 1)
			npcHandler.topic[cid] = 0
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			selfSay("Splendid! My son Rehon set off on an expedition to the deeper mines. He and a group of dwarfs were to search for new veins of crystal. Unfortunately they have been missing for 2 weeks now. What I'd like you to do is to find out what happened. ...", cid)
			npcHandler:say("Find my son and if he's alive bring him back. You will find a reactivated ore wagon tunnel at the entrance of the great citadel which leads to the deeper mines. If you encounter problems within the tunnel go ask Xorlosh, he can help you.", cid)
			setPlayerStorageValue(cid, 33830, 1)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end


 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())