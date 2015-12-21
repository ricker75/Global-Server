local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
local voices = {
	'Interesting reaction. Bloodcurdling. Must inspect further.',
	'This is really sanguine!',
	'Hmm... the conductors are too dry to transmit energy.',
	'Ah, fresh blood. My favourite.'
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
	if(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9977) == 1) and (getPlayerStorageValue(cid,9978) < 1) then
		selfSay("So someone sent you after a scroll, eh? A stroll for a scroll! <chuckles> Sounds like an old-fashioned necromancer thing. ...", cid)
		selfSay("Well, this piece here is a rather fascinating thing - see those strange blood stains? - ...", cid)
		selfSay("My predecessors have had it for quite a while without finding out more - I was hoping to investigate, but there's always so much to do! ...", cid)
		npcHandler:say("Ah, so you want it, too? Well, do me a favour: fetch two samples and assist in my experiment, in exchange for the scroll piece. Yes?", cid)
		npcHandler.topic[cid] = 1
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 and (getPlayerStorageValue(cid,9977) == 1) then
		selfSay("Sanguine! I need two different blood samples - The first one from the necromancer's pure blood chamber. ... ", cid)
		selfSay("I was barred from the premises. For my research! Shameful! I'm a martyr to the cause - oh, the second sample you said? ...", cid)
		selfSay("The second sample you must retrieve from the sacrificial chamber in the ancient vampire crypts, first floor, far west. ...", cid)
		npcHandler:say("Take these two sterilised vials, one for each blood basin. Oh, I wish I could go myself! Come back when you have filled both vials.", cid)
		player:setStorageValue(9978, 1)
		player:addItem(21417, 2)
		npcHandler.topic[cid] = 0
	elseif(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission') or msgcontains(msg, 'blood')) and (getPlayerStorageValue(cid,9980) == 1) and (getPlayerStorageValue(cid,9981) < 1) then
		npcHandler:say("Hello hello! Did you bring those blood samples?", cid)
		npcHandler.topic[cid] = 2
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 2 and (getPlayerStorageValue(cid,9980) == 1) then
		if player:getItemCount(21419) >= 1 and player:getItemCount(21418) >= 1 then
			selfSay("Now, let me see... yes... yes... very good. Let me add THIS ..... swill it... there. Sanguine! ...", cid)
			selfSay("We're not finished yet. Take this tainted blood vial ...", cid)
			npcHandler:say("Dab some drops from it on to the four blood pagodas in the inner circle here. Then pull the lightning lever over there.", cid)
			player:setStorageValue(9981, 1)
			player:removeItem(21418, 1)
			player:removeItem(21419, 1)
			player:addItem(21449, 1)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say("You haven't got any blood.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9986) == 1) and (getPlayerStorageValue(cid,9987) < 1) then
		npcHandler:say("Hello hello! Did Hello hello! Well now, painted all those blood pagodas properly?", cid)
		npcHandler.topic[cid] = 3
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 3 and (getPlayerStorageValue(cid,9986) == 1) then
		selfSay("Sanguine! Did you see those sparks! We definitely had some energy transfer! Well done! Now, for your reward. ...", cid)
		selfSay("Err... I would awfully like to know more about the scroll ...", cid)
		selfSay("Would you settle for a heartfelt handshake instead - oh, you wouldn't? Well, er, okay ...", cid)
		npcHandler:say("Give me a minute or two to retrieve it. Ask me for the {scroll} or the {mission}", cid)
		player:setStorageValue(9987, 1)
		npcHandler.topic[cid] = 0
	elseif(msgcontains(msg, 'scroll') or msgcontains(msg, 'mission')) and (getPlayerStorageValue(cid,9987) == 1) and (getPlayerStorageValue(cid,9988) < 1) then
		npcHandler:say("Hello hell- oh, you've come for the scroll, haven't you?", cid)
		npcHandler.topic[cid] = 4
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 4 and (getPlayerStorageValue(cid,9987) == 1) then
		npcHandler:say("My heart bleeds to part from it. Here. Extend your hand - I'll just retrieve some blood from in exchange - HOLD STILL.", cid)
		player:setStorageValue(9988, 1)
		player:addItem(21250, 1)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())