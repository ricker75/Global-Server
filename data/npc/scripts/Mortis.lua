local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                                      npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	

	if msgcontains(msg, "inquisition") then
		npcHandler:say("We all have our reasons to fight. The gods, justice, revenge or just to do the right thing. Regardless what the reasons are, the enemies are all the same: heretics, cultists and servants of the lords of evil.", cid)
	elseif msgcontains(msg, "studies") then
		npcHandler:say({"I was just a simple sub-leader of a branch of the inquisition, when a demon we purged from a desecrated temple tried to bargain for its freedom with information. ...","Of course we killed the vile abomination, but first we extracted the very information it deemed valuable to us. ...","It thought we might trade it in for his existence. Its information was of course vague and spiced with lies, but it was a start. ...","From thereon I dedicated my time in referencing books and praying for enlightenments from the gods. ...","I managed to deduce many facts about a base of the most evil of all demons, an unholy gathering place to plot and indulge in unspeakable rites. Some Yalahari texts even referenced this place as Roshamuul and to be avoided. ...","With an adventuring party, I located a compass-like device of Yalahari origin that pointed to that place. By the guidance of the gods, I had also found an artefact that allowed ships to travel the treacherous waters around this isle. ...","When our vanguard arrived here, we were unprepared for the sheer number of opponents and the massive fortifications. So it was only natural to call upon the heroes of the land to face this threat. ...","Despite all fortifications, the demons obviously never expected to be attacked here. Regardless of the progress we make though, this place is far from free from demonic presence and the purge has to continue."}, cid, 0, 1, 3000)
	elseif (msgcontains(msg, "demonic")) then
		npcHandler:say({"The works of a sinner are tainted by their sins. That's why we have to treat everything besides from our holy texts with care. ...","You can never tell if something is not the work of a sinner and how much of his taint has spilled into it."}, cid, 0, 1, 3000)
	elseif (msgcontains(msg, "Roshamuul") or msgcontains(msg, "isle")) then
		npcHandler:say({"Look around you, it's a fiendish wasteland. There's nothing to it. And I am repairing the very pathway that will lead even deeper into its tainted heart. ...","Yet, if it is of use to the inqusition, I will not complain. There IS a demonic presence here that needs to be purged after all."}, cid, 0, 1, 3000)
	elseif (msgcontains(msg, "dream")) then
		npcHandler:say("This is a bizarre place and dreams are almost like living things here.", cid)
	elseif (msgcontains(msg, "henricus")) then
		npcHandler:say("He is competent, pious and to the point. Just the man we need in dire times like this.", cid)
	elseif (msgcontains(msg, "pay")) then
		npcHandler:say("I know we brothers all do this for the inquisition, the gods and all that but... I know this is dangerous work. Talk to Sandomo and I am sure he can offer some kind of reward.", cid)
	elseif (msgcontains(msg, "bucket")) then
		npcHandler:say("You will need a bucket to fill the water, gravel or chalk into. You can get one down at the outpost from brother Maun.", cid)
	elseif (msgcontains(msg, "troughs")) then
		npcHandler:say("Once you have mixed mortar by adding water to a bucket of gravel and chalk, fill the mix into one of the troughs over there.", cid)
	elseif (msgcontains(msg, "gods")) then
		npcHandler:say("The gods of good are our light in the darkness. We owe them to fight this battle.", cid)
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())