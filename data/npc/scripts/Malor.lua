local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	
	
	-- GREET
	if(msg == "DJANNI'HAH") then
		if(getPlayerStorageValue(cid, Factions) > 0) then
			npcHandler:addFocus(cid)
			if(getPlayerStorageValue(cid, BlueDjinn.MissionStart) < 1 or not BlueOrGreen) then
				npcHandler:say("Greetings, human " .. getCreatureName(cid) ..". My patience with your kind is limited, so speak quickly and choose your words well.", cid)
				npcHandler:addFocus(cid)
			end
		end
	end
	-- GREET
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local player = Player(cid)
	-- Mission 3 - Orc Fortress
	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, GreenDjinn.MissionStart+2) == 3 and getPlayerStorageValue(cid, GreenDjinn.MissionStart+3) < 1) then
			selfSay("I guess this is the first time I entrust a human with a mission. And such an important mission, too. But well, we live in hard times, and I am a bit short of adequate staff. ...", cid) 
			selfSay("Besides, Baa'leal told me you have distinguished yourself well in previous missions, so I think you might be the right person for the job. ...", cid) 
			npcHandler:say("But think carefully, human, for this mission will bring you close to certain death. Are you prepared to embark on this mission?", cid)
			npcHandler.topic[cid] = 1
		elseif(getPlayerStorageValue(cid, GreenDjinn.MissionStart+3) == 3) then
			npcHandler:say("Have you found Fa'hradin's lamp and placed it in Malor's personal chambers?", cid)
			npcHandler.topic[cid] = 2
		end
	-- Mission 3 - Orc Fortress
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			selfSay("Well, listen. We are trying to acquire the ultimate weapon to defeat Gabel: Fa'hradin's lamp! ...", cid)
			selfSay("At the moment it is still in the possession of that good old friend of mine, the Orc King, who kindly released me from it. ...", cid)
			selfSay("However, for some reason he is not as friendly as he used to be. You better watch out, human, because I don't think you will get the lamp without a fight. ...", cid)
			selfSay("Once you have found the lamp you must enter Ashta'daramai again. Sneak into Gabel's personal chambers and exchange his sleeping lamp with Fa'hradin's lamp! ...", cid) 
			npcHandler:say("If you succeed, the war could be over one night later!", cid)
			npcHandler.topic[cid] = 0
			setPlayerStorageValue(cid, GreenDjinn.MissionStart+3, 1)
		elseif(npcHandler.topic[cid] == 2) then
			selfSay("Well well, human. So you really have made it - you have smuggled the modified lamp into Gabel's bedroom! ...", cid) 
			selfSay("I never thought I would say this to a human, but I must confess I am impressed. ...", "Perhaps I have underestimated you and your kind after all. ...", cid) 
			selfSay("I guess I will take this as a lesson to keep in mind when I meet you on the battlefield. ...", "But that's in the future. For now, I will confine myself to give you the permission to trade with my people whenever you want to. ..", cid)
			npcHandler:say("Farewell, human!", cid)
			npcHandler.topic[cid] = 0
			setPlayerStorageValue(cid, GreenDjinn.MissionStart+3, 4)
			player:addAchievement('Efreet Ally')
			npcHandler:releaseFocus(cid)
		end
	end
	if (msgcontains(msg, "bye") or msgcontains(msg, "farewell")) then
		npcHandler:say("Farewell, human. When I have taken my rightful place I shall remember those who served me well. Even if they are only humans.", cid)
		npcHandler.topic[cid] = 0
		npcHandler:releaseFocus(cid)
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)