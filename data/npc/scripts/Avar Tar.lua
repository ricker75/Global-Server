local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

 if msgcontains(msg, "outfits") then
    selfSay("I'm tired of all these young unskilled wannabe heroes. Every Tibian can show his skills or actions by wearing a special outfit. To prove oneself worthy of the demon outfit, this is how it goes: ...", cid)
	selfSay("The base outfit will be granted for completing the annihilator quest, which isn't much of a challenge nowadays, in my opinion. Anyway ... ", cid)
	selfSay("The shield however will only be granted to those adventurers who have finished the demon helmet quest. ... ", cid)
	selfSay("Well, the helmet is for those who really are tenacious and have hunted down all 6666 demons and finished the demon oak as well. ...", cid) 
	selfSay("Are you interested?", cid)
	npcHandler.topic[cid] = 1
 elseif npcHandler.topic[cid] == 1 and msgcontains(msg, "yes") then
    selfSay("So you want to have the demon outfit, hah! Let's have a look first if you really deserve it. Tell me: {base}, {shield} or {helmet}?", cid)
    npcHandler.topic[cid] = 2    
 elseif npcHandler.topic[cid] == 2 and msgcontains(msg, "base") then
    if (getPlayerStorageValue(cid,2215)) > 0 and getPlayerStorageValue(cid, 87499) <= 0 then
		selfSay("Receive the base outfit.", cid)
		doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 542 or 541, 0)
		setPlayerStorageValue(cid, 87499, 1)
	elseif (getPlayerStorageValue(cid,2215) <= 0) then
		selfSay("You need complete annihilator quest for gain this outfit.", cid)
	else
		selfSay("You have this base outfit.", cid)
	end
    npcHandler.topic[cid] = 0
 elseif npcHandler.topic[cid] == 2 and msgcontains(msg, "shield") then
    if (getPlayerStorageValue(cid,2217)) > 0 and getPlayerStorageValue(cid, 87497) < 0 and getPlayerStorageValue(cid, 87499) == 1 then
		selfSay("Receive the shield.", cid)
		doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 542 or 541, 1)
		setPlayerStorageValue(cid, 87497, 1)
	elseif (getPlayerStorageValue(cid,2217) <= 0) then
		selfSay("You need complete demon helmet quest for gain this outfit.", cid)
	else
		selfSay("You have this shield addon.", cid)
	end
    npcHandler.topic[cid] = 0
 elseif npcHandler.topic[cid] == 2 and msgcontains(msg, "helmet") then
    if (getPlayerStorageValue(cid,1010)) == 3 and getPlayerStorageValue(cid, 87498) < 0 and getPlayerStorageValue(cid, 87499) == 1 then
      	doPlayerAddOutfit(cid, getPlayerSex(cid) == 0 and 542 or 541, 2)
		selfSay("Receive the helmet.", cid)
		setPlayerStorageValue(cid, 87498, 1)
	elseif (getPlayerStorageValue(cid,1010) < 3) then
		selfSay("You need complete demon oak quest for gain this outfit.", cid)
	else
		selfSay("You have this helmet addon.", cid)
	end
    npcHandler.topic[cid] = 0
 end
return TRUE
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())