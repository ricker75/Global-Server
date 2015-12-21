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
	

	if msgcontains(msg, "inquisition") then
		npcHandler:say({"The inquisition has to wipe out all demon resistance in this area. Before we can begin to heal the land, these abominations have to vanish. ...","It were my studies that unearthed the location of this abominable isle."}, cid, 0, 1, 3000)
	elseif msgcontains(msg, "studies") then
		npcHandler:say({"I was just a simple sub-leader of a branch of the inquisition, when a demon we purged from a desecrated temple tried to bargain for its freedom with information. ...","Of course we killed the vile abomination, but first we extracted the very information it deemed valuable to us. ...","It thought we might trade it in for his existence. Its information was of course vague and spiced with lies, but it was a start. ...","From thereon I dedicated my time in referencing books and praying for enlightenments from the gods. ...","I managed to deduce many facts about a base of the most evil of all demons, an unholy gathering place to plot and indulge in unspeakable rites. Some Yalahari texts even referenced this place as Roshamuul and to be avoided. ...","With an adventuring party, I located a compass-like device of Yalahari origin that pointed to that place. By the guidance of the gods, I had also found an artefact that allowed ships to travel the treacherous waters around this isle. ...","When our vanguard arrived here, we were unprepared for the sheer number of opponents and the massive fortifications. So it was only natural to call upon the heroes of the land to face this threat. ...","Despite all fortifications, the demons obviously never expected to be attacked here. Regardless of the progress we make though, this place is far from free from demonic presence and the purge has to continue."}, cid, 0, 1, 3000)
	elseif (msgcontains(msg, "Yalahari")) then
		npcHandler:say({"At least they did not consort with demons, but their disregard of the gods is inexcusable and probably the reason for their downfall. Of course all their work is tainted and must be handled with care. ...","After my successes, I was granted to oversee all research about the Yalahari."}, cid, 0, 1, 3000)
	elseif (msgcontains(msg, "research")) then
		npcHandler:say({"The works of a sinner are tainted by their sins. That's why we have to treat everything besides from our holy texts with care. ...","You can never tell if something is not the work of a sinner and how much of his taint has spilled into it."}, cid, 0, 1, 3000)
	elseif (msgcontains(msg, "Roshamuul") or msgcontains(msg, "isle")) then
		npcHandler:say("You can see the taint everywhere. This is what will become of the world if we don't stop these vile invaders here and now.", cid)
	elseif (msgcontains(msg, "demon")) then
		npcHandler:say("They are the enemy of course. An enemy who knows no mercy and deserves none. There is no option but confrontation.", cid)
	elseif (msgcontains(msg, "dream")) then
		npcHandler:say("Beware of your dreams. They might be just the door to your soul the demons need.", cid)
	elseif (msgcontains(msg, "Henricus")) then
		npcHandler:say("A brilliant man with a brilliant mind. He is far too valuable to be endangered here.", cid)
	elseif (msgcontains(msg, "book")) then
		npcHandler:say("I am no books expert, but if you found it here it is probably full of demonic lies.", cid)
	elseif (msgcontains(msg, "god")) then
		npcHandler:say("The gods trust in us that we cleanse this place. If we fail, not only will our own souls be doomed but perhaps the whole world itself.", cid)
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())