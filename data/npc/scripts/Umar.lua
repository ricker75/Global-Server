dofile('data/lib/MissionSelect.lua')

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	
	
	-- GREET
	if(msg == "DJANNI'HAH" and (getPlayerStorageValue(cid, GreenDjinn.MissionStart) < 1) or not BlueOrGreen) and (not npcHandler:isFocused(cid)) then
		if(getPlayerStorageValue(cid, Factions) > 0) then
			npcHandler:addFocus(cid)
			if(getPlayerStorageValue(cid, GreenDjinn.MissionStart) < 1 or not BlueOrGreen) then
				selfSay("Whoa? You know the word! Amazing, " .. getCreatureName(cid) .. "!...", cid)
				npcHandler:say("I should go and tell Fa'hradin. ...","Well. Why are you here anyway, " .. getCreatureName(cid) .. "?", cid)
				npcHandler:addFocus(cid)
			end
		end
		return true
	end
	-- GREET
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	-- JOINING
	if(msgcontains(msg, "passage")) then
		if(getPlayerStorageValue(cid, BlueDjinn.MissionStart) < 1) then
			selfSay("If you want to enter our fortress you have to become one of us and fight the Efreet. ...", cid)
			npcHandler:say("So, are you willing to do so?", cid)
			npcHandler.topic[cid] = 1
		end
	-- JOINING
	
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("Are you sure? You pledge loyalty to king Gabel, who is... you know. And you are willing to never ever set foot on Efreets' territory, unless you want to kill them? Yes?", cid)
			npcHandler.topic[cid] = 2
		elseif(npcHandler.topic[cid] == 2) then
			selfSay("Oh. Ok. Welcome then. You may pass. ...", cid)
			npcHandler:say("And don't forget to kill some Efreets, now and then.", cid)
			npcHandler.topic[cid] = 3
			setPlayerStorageValue(cid, BlueDjinn.MissionStart, 1)
		end
	end
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("<salutes>Aaaa -tention!.", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)