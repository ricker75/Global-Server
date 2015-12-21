local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid)       npcHandler:onCreatureAppear(cid)     end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)     end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)   end
function onThink()				npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	
	
	-- GREET
	if(msg == "DJANNI'HAH") and (not npcHandler:isFocused(cid)) then
		if(getPlayerStorageValue(cid, Factions) > 0) then
			npcHandler:addFocus(cid)
			if(getPlayerStorageValue(cid, GreenDjinn.MissionStart) < 1 or not BlueOrGreen) then
				npcHandler:say("Welcome, human " .. getCreatureName(cid) .. ", to our humble abode.", cid)
				npcHandler:addFocus(cid)
			end
		end
	end
	-- GREET
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local player = Player(cid)
	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, BlueDjinn.MissionStart+2) == 3 and getPlayerStorageValue(cid, BlueDjinn.MissionStart+3) < 1) then
			selfSay("Sooo. Fa'hradin has told me about your extraordinary exploit, and I must say I am impressed. ...", cid)
			selfSay("Your fragile human form belies your courage and your fighting spirit. ...", cid)
			selfSay("I hardly dare to ask you because you have already done so much for us, but there is a task to be done, and I cannot think of anybody else who would be better suited to fulfill it than you. ...", cid)
			npcHandler:say("Think carefully, human, for this mission will bring you into real danger. Are you prepared to do us that final favour?", cid)
			npcHandler.topic[cid] = 1
		elseif(getPlayerStorageValue(cid, BlueDjinn.MissionStart+3) == 3) then
			npcHandler:say("Have you found Fa'hradin's lamp and placed it in Malor's personal chambers?", cid)
			npcHandler.topic[cid] = 2
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			selfSay("All right. Listen! Thanks to Rata'mari's report we now know what Malor is up to: he wants to do to me what I have done to him - he wants to imprison me in Fa'hradin's lamp! ...", cid)
			selfSay("Of course, that won't happen. Now, we know his plans. ...", cid)
			selfSay("But I am aiming at something different. We have learnt one important thing: At this point of time, Malor does not have the lamp yet, which means it is still where he left it. We need that lamp! If we get it back we can imprison him again! ...", cid)
			selfSay("From all we know the lamp is still in the Orc King's possession! Therefore I want to ask you to enter thewell guarded halls over at Ulderek's Rock and find the lamp. ...", cid)
			selfSay("Once you have acquired the lamp you must enter Mal'ouquah again. Sneak into Malor's personal chambersand exchange his sleeping lamp with Fa'hradin's lamp! ...", cid)
			npcHandler:say("If you succeed, the war could be over one night later! I and all djinn will be in your debt forever! May Daraman watch over you!", cid)
			npcHandler.topic[cid] = 0
			setPlayerStorageValue(cid, BlueDjinn.MissionStart+3, 1)
		elseif(npcHandler.topic[cid] == 2) then
			selfSay("Daraman shall bless you and all humans! You have done us all a huge service! Soon, this awful war will be over! ...", cid)
			npcHandler:say("Know, that from now on you are considered one of us and are welcome to trade with Haroun and Nah'bob whenever you want to!", cid)
			npcHandler.topic[cid] = 0
			setPlayerStorageValue(cid, BlueDjinn.MissionStart+3, 4)
			player:addAchievement('Marid Ally')
		end
	end
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("Farewell, stranger. May Uman open your minds and your hearts to Daraman's wisdom!", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)