local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not(npcHandler:isFocused(cid))) then
		return false
	end
	
	
	if(msgcontains(msg, "food")) then
		if(getPlayerStorageValue(cid, 10060) < 1) then
			selfSay("Hey there, just to let you know - I am not a man of many words. I prefer 'deeds', you see? The poor of this city will not feed themselves. ... ", cid)
			selfSay("So in case you've got nothing better to do - and it sure looks that way judging by how long you're already loitering around in front of my nose - please help us. ... ", cid)
			selfSay("If you can find some of the nutritious, juicy {roots} in the outskirts of Rathleton, bring them here. We will gladly take bundles of five roots each, and hey - helping us, helps you in the long term, trust me. ", cid)
			setPlayerStorageValue(cid, 20061, 0)
			setPlayerStorageValue(cid, 10060, 1)
			setPlayerStorageValue(cid, 20060, 1) -- quest log mission 1
			npcHandler.topic[cid] = 1
		elseif(getPlayerStorageValue(cid, 20061) == 5) then
			npcHandler:say("Yes? You brought some juicy roots? How nice of you - That's one additional voice in the {magistrate} of {Rathleton} for you!... ", cid)
			npcHandler.topic[cid] = 2
		end	
	elseif(msgcontains(msg, "bye")) then
		if(npcHandler.topic[cid] == 1) then
			npcHandler:say("Take care out there!", cid)
			npcHandler.topic[cid] = 0
		end

	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 2) then
			npcHandler:say("Spend it wisley, thought, put in a word for the poor, will ye? Sure you will. ", cid)
			setPlayerStorageValue(cid, 10050, 2)
			setPlayerStorageValue(cid, 20061, 6)
			npcHandler.topic[cid] = 3
		end		
	elseif(msgcontains(msg, "bye")) then
		if(npcHandler.topic[cid] == 2) then
			npcHandler:say("Take care out there!", cid)
			npcHandler.topic[cid] = 0
		end
	end	
	return true
end
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
