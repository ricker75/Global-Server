local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)


function onCreatureAppear(cid)       npcHandler:onCreatureAppear(cid)       end
function onCreatureDisappear(cid)     npcHandler:onCreatureDisappear(cid)       end
function onCreatureSay(cid, type, msg)     npcHandler:onCreatureSay(cid, type, msg)     end
function onThink()         npcHandler:onThink()             end

function creatureSayCallback(cid, type, msg)
     if not npcHandler:isFocused(cid) then
         return false
     end

     

     if msgcontains(msg, "name") then
     npcHandler:say("I'm professor Falonzo from the mage's guild.", cid)
	 elseif msgcontains(msg, "job") then
     npcHandler:say("I'm a researcher of scientific council of the mage guild and I came to that place to study this anomaly.", cid)
	 elseif msgcontains(msg, "place") then
     npcHandler:say("This plane is now inhabited by intruders and creatures that accidentally became dragged in.", "It is neither completely of our world nor is it still that disconnected and unreachable as it used to be. I fear it's only a harbinger of something more dangerous and more sinister.", cid)
	 elseif msgcontains(msg, "anomaly") then
     npcHandler:say("Well, the whole place here is an anomaly so to say. You can hardly have missed the fact that you arrived here through a mystical gate.", "Well actually it's no gate at all but a rift in the fabric of nature. It is this minor plane trying to reconnect to our world.", cid)
	 elseif msgcontains(msg, "plane") then
     npcHandler:say("This is a lesser plane of tarnished, elemental fire that once belonged to the world that we know. It was despoiled in the wars of the gods and broke loose from our world. Lost and drifting through the void, without a connection to our plane.", cid)
	 elseif msgcontains(msg, "intruders") then
     npcHandler:say("Infernalists were the first who found their way into this sphere. Hoping to tap its rotten power somehow. Yet this sphere created creatures of its own and draw others here from other planes.", cid)
	 elseif msgcontains(msg, "dragged") then
     npcHandler:say("This place became a fiery trap to certain beings with an affinity to fire. Somehow it reconnects randomly with the known world, to which it once belonged", "but also to other places that it shares some affinity with like hellish places of unspeakable evil that spawn infernal creatures.", cid)
	 elseif msgcontains(msg, "sinister") or msgcontains(msg, "changed") then
     npcHandler:say("Something is tearing at the fabric of reality. I can't tell what is it but the boundaries between worlds are fading.", "A process that what watched for over a century but which has extremely grown in momentum over the last few years. Something is happening and it's for sure nothing good.","Be it as it may, the plane trying to reconnect was only a side effect. It still might teach us about what is happening and it has for sure attracted some attention already.", cid)
	 elseif msgcontains(msg, "lost") then
     npcHandler:say("Well, that was how it used to be. Lost and without any connection to our world. But that was before things ... have changed.", cid)
	 elseif msgcontains(msg, "boundaries") then
     npcHandler:say("We know about other planes of existence but in all history it has never been as easy to reach them as it is now.", "Sometimes world seem to overlap and we can identify more and more such planes and worlds. More then we ever had imagined. All we can tell is, that something is changing. And not for the good.", cid)
	 elseif msgcontains(msg, "attention") then
     npcHandler:say("Such an anomaly can't go unnoticed for long. That lead to the presence to unwanted intruders and other entities were dragged into by the nature of the sphere.", cid) 
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())