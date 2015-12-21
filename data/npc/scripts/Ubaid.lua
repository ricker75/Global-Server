local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	
	
	-- GREET
	if(msg == "DJANNI'HAH" and getPlayerStorageValue(cid, BlueDjinn.MissionStart) < 1) and (not npcHandler:isFocused(cid)) then
		if(getPlayerStorageValue(cid, Factions) > 0) then
			npcHandler:addFocus(cid)
			if(getPlayerStorageValue(cid, BlueDjinn.MissionStart) < 1 or not BlueOrGreen) then
				npcHandler:say("What? You know the word, Player? All right then - I won't kill you. At least, not now.", cid)
				npcHandler:addFocus(cid)
			end
		end
	end
	-- GREET

	if(not npcHandler:isFocused(cid)) then
		return false
	end

	-- JOINING
	if(msgcontains(msg, "passage")) then
		if(getPlayerStorageValue(cid, GreenDjinn.MissionStart) < 1) then
			selfSay("Only the mighty Efreet, the true djinn of Tibia, may enter Mal'ouquah! ...", cid)
			npcHandler:say("All Marids and little worms like yourself should leave now or something bad may happen. Am I right?", cid)
			npcHandler.topic[cid] = 1
		end
	-- JOINING
	
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 2) then
			npcHandler:say("So you pledge loyalty to king Malor and you are willing to never ever set foot on Marids' territory, unless you want to kill them? Yes?", cid)
			npcHandler.topic[cid] = 3
		elseif(npcHandler.topic[cid] == 3) then
			selfSay("Well then - welcome to Mal'ouquah. ...", "Go now to general Baa'leal and don't forget to greet him correctly! ...", cid) 
			npcHandler:say("And don't touch anything!", cid)
			npcHandler.topic[cid] = 0
			setPlayerStorageValue(cid, GreenDjinn.MissionStart, 1)
		end
	elseif(msgcontains(msg, "no")) then
		if(npcHandler.topic[cid] == 1) then
			selfSay("Of cour... Huh!? No!? I can't believe it! ...", cid)
			selfSay("You... you got some nerves... Hmm. ...", cid)
			npcHandler:say("Maybe we have some use for someone like you. Would you be interested in working for us. Helping to fight the Marid?", cid)
			npcHandler.topic[cid] = 2
		end
	end
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("Farewell human!", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)