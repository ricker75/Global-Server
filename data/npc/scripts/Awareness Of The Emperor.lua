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

	if(msgcontains(msg, "mission")) then
		if(getPlayerStorageValue(cid, 1050) == 26 and getPlayerStorageValue(cid, 1090) == 5) then
			selfSay("The amplified force of the snake god is tearing the land apart. It is using my crystals in a reverse way to drain the vital force from the land and its inhabitants to fuel its power. ... ", cid)
			selfSay("I will withstand its influence as good as possible and slow this process. You will have to fight its worldly incarnation though. ... ", cid)
			selfSay("It is still weak and disoriented. You might stand a chance - this is our only chance. I will send you to the point to where the vital force is channelled. I have no idea where that might be though. ... ", cid)
			selfSay("You will probably have to fight some sort of vessel the snake god uses. Even if you defeat it, it is likely that it only weakens the snake. ... ", cid)
			selfSay("You might have to fight several incarnations until the snake god is worn out enough. Then use the power of the snake's own sceptre against it. Use it on its corpse to claim your victory. ... ", cid)
			npcHandler:say("Be prepared for the fight of your life! Are you ready?", cid)
			npcHandler.topic[cid] = 1
		elseif(getPlayerStorageValue(cid, 1050) == 28) then
			selfSay("So you have mastered the crisis you invoked with your foolishness. I should crush you for your involvement right here and now. ... ", cid)
			selfSay("But such an act would bring me down to your own barbaric level and only fuel the corruption that destroys the land that I own. Therefore I will not only spare your miserable life but show your the generosity of the dragon emperor. ... ", cid)
			selfSay("I will reward you beyond your wildest dreams! ... ", cid)
			selfSay("I grant you three chests - filled to the lid with platinum coins, a house in the city in which you may reside, a set of the finest armor Zao has to offer, and a casket of never-ending mana. ... ", cid)
			npcHandler:say("Speak with magistrate Izsh in the ministry about your reward. And now leave before I change my mind! ", cid)
			setPlayerStorageValue(cid, 1050, 29)
			setPlayerStorageValue(cid, 15180, 1) -- quest log mission 12
			npcHandler.topic[cid] = 0
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			setPlayerStorageValue(cid, 1050, 27)
			setPlayerStorageValue(cid, 15170, 1) -- quest log mission 11
			npcHandler:say("So be it! ", cid)
			npcHandler.topic[cid] = 1
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())