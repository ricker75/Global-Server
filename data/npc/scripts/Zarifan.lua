local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local voices = {
	'<sigh> lost... word...',
	'<sigh> ohhhh.... memories...',
	'The secrets... too many... sleep...',
	'Loneliness...'
}

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 10)
		if math.random(100) < 20 then
			Npc():say(voices[math.random(#voices)], TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	local player = Player(cid)
	if(msgcontains(msg, 'magic') or msgcontains(msg, 'mission')) and getPlayerStorageValue(cid,12901) == 1 then
		npcHandler:say("...Tell me...the first... magic word.", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'friendship') and npcHandler.topic[cid] == 1 and getPlayerStorageValue(cid,12901) == 1 then
		npcHandler:say("Yes... YES... friendship... now... second word?", cid)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, 'lives') and npcHandler.topic[cid] == 2 and getPlayerStorageValue(cid,12901) == 1 then
		npcHandler:say("Yes... YES... friendship... lives... now third word?", cid)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, 'forever') and npcHandler.topic[cid] == 3 and getPlayerStorageValue(cid,12901) == 1 then
		selfSay("Yes... YES... friendship... lives... FOREVER. ...", cid)
		selfSay("What you seek.... is buried. Beneath the sand. No graves. ...", cid)
		selfSay("Between a triangle of big stones you must dig... in the eastern caves. ...", cid)
		npcHandler:say("And say hello... to... my old friend... Omrabas.", cid)
		player:setStorageValue(12902, 1)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())