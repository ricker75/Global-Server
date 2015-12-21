local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	if msgcontains(msg, "stampor") or msgcontains(msg, "mount") then
		if not player:hasMount(11) then
				npcHandler:say("You did bring all the items I requqested, cuild. Good. Shall I travel to the spirit realm and try finding a stampor compasion for you?", cid)
				npcHandler.topic[cid] = 1
		else
			npcHandler:say("You already have stampor mount.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "addon") then
		if player:hasOutfit(player:getSex() == 0 and 158 or 154) then
			if player:getStorageValue(Storage.OutfitQuest.ShamanAddons) < 1 then
				selfSay("Deep in the Tiquandian jungle a monster lurks which is seldom seen. It is the revenge of the jungle against humankind. ...", cid)
				selfSay("This monster, if slain, carries a rare root called Mandrake. If you find it, bring it to me. Also, gather 5 of the voodoo dolls used by the mysterious dworc voodoomasters. ...", cid)
				npcHandler:say("If you manage to fulfil this task, I will grant you your own staff. Have you understood everything and are ready for this test?", cid)
				npcHandler.topic[cid] = 4
			elseif player:getStorageValue(Storage.OutfitQuest.ShamanAddons) == 1 then
				npcHandler:say("Have you gathered the mandrake and the 5 voodoo dolls from the dworcs?", cid)
				npcHandler.topic[cid] = 5
			elseif player:getStorageValue(Storage.OutfitQuest.ShamanAddons) == 2 then
				npcHandler:say("You have successfully passed the first task. If you can fulfil my second task, I will grant you a mask like the one I wear. Will you listen to the requirements?", cid)
				npcHandler.topic[cid] = 6
			end
		else
			npcHandler:say("Come back when you can wear shamanic clothing.", cid)
		end
	elseif msgcontains(msg, "tribal mask") then
		if player:getStorageValue(Storage.OutfitQuest.ShamanAddons) == 3 then
			npcHandler:say("Have you gathered the 5 tribal masks and the 5 banana staves?", cid)
			npcHandler.topic[cid] = 8
		end
	elseif(msgcontains(msg, "spellbook")) then
		if player:getItemCount(6120) >= 1 then
			player:removeItem(6120, 1)
			player:setStorageValue(37938, 1)
			npcHandler:say("Ah, thank you very much! I will honour his memory.", cid)
			npcHandler.topic[cid] = 0
		end
	elseif(msgcontains(msg, "energy field")) then
		if player:getStorageValue(37938) == 1 then
			npcHandler:say("Ah, the energy barrier set up by the cult is maintained by lousy magic, but is still effective. Without a proper counterspell you won't be able to pass it.", cid)
			npcHandler.topic[cid] = 9
		end
	elseif(msgcontains(msg, "counterspell")) then
		if npcHandler.topic[cid] == 9 then
			npcHandler:say("You mean, you are interested in a counterspell to cross the energy barrier on Goroma?", cid)
			npcHandler.topic[cid] = 10
		elseif player:getStorageValue(55701) == 1 then
			npcHandler:say("Did you bring the fresh dead chicken?", cid)
			npcHandler.topic[cid] = 12
		elseif player:getStorageValue(55701) == 2 then
			npcHandler:say("Did you bring the fresh dead rat?", cid)
			npcHandler.topic[cid] = 13
		elseif player:getStorageValue(55701) == 3 then
			npcHandler:say("Did you bring the fresh dead black sheep?", cid)
			npcHandler.topic[cid] = 14
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:removeItem(13299, 50) and player:removeItem(13301, 30) and player:removeItem(13300, 100) then
				selfSay("Ohhhhh Mmmmmmmmmmmm Ammmmmgggggggaaaaaaa ...", cid)
				selfSay("Aaaaaaaaaahhmmmm Mmmaaaaaaaaaa Kaaaaaamaaaa ...", cid)
				selfSay("Brrt! I think it worked! It's a male stampor. I linked this spirit to yours. You can probably already summon him to you ...", cid) 
				npcHandler:say("So, since me are done here... I need to prepare another ritual, so please let me work, cuild.", cid)
				player:addMount(11)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			else
				npcHandler:say("Sorry you don't have the necessary items.", cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			if player:getItemCount(5941) >= 1 then
				player:setStorageValue(Storage.FriendsandTraders.TheBlessedStakeWaitTime, os.time())
				npcHandler:say("<mumblemumble> Sha Kesh Mar!", cid)
				player:removeItem(5941, 1)
				player:addItem(5942, 1)
			else
				npcHandler:say("You don't have the required items.", cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 4 then
			player:setStorageValue(50085, 1)
			npcHandler:say("Good! Come back once you found a mandrake and collected 5 dworcish voodoo dolls.", cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 5 then
			if player:getItemCount(5015) > 0 and player:getItemCount(3955) >= 5 then
				player:removeItem(5015, 1)
				player:removeItem(3955, 5)
				player:addOutfitAddon(158, 1)
				player:addOutfitAddon(154, 1)
				player:setStorageValue(Storage.OutfitQuest.ShamanAddons, 2)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
				npcHandler:say("I am proud of you, my child, excellent work. This staff shall be yours from now on!", cid)
			else
				npcHandler:say("You don't have the required items.", cid)
			end
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 6 then
			selfSay("The dworcs of Tiquanda like to wear certain tribal masks which I would like to take a look at. Please bring me 5 of these masks. ...", cid)
			selfSay("Secondly, the high ape magicians of Banuta use banana staves. I would love to learn more about theses staves, so pleasebring me 5 of them also. ...", cid)
			npcHandler:say("If you manage to fulfil this task, I will grant you your own mask. Have you understood everything and are ready for this test?", cid)
			npcHandler.topic[cid] = 7
		elseif npcHandler.topic[cid] == 7 then
			player:setStorageValue(Storage.OutfitQuest.ShamanAddons, 3)
			selfSay("Good! Come back once you have collected 5 tribal masks and 5 banana staves. ...", cid)
			npcHandler:say("I shall grant you a sign of your progress as shaman if you can fulfil my task.", cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 8 then
			if player:getItemCount(3966) >= 5 and player:getItemCount(3967) >= 5 then
				player:removeItem(3966, 5)
				player:removeItem(3967, 5)
				player:addOutfitAddon(158, 2)
				player:addOutfitAddon(154, 2)
				player:setStorageValue(Storage.OutfitQuest.ShamanAddons, 4)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
				npcHandler:say("Well done, my child! I hereby grant you the right to wear a shamanic mask. Do it proudly.", cid)
			else
				npcHandler:say("You don't have the required items.", cid)
			end
		elseif npcHandler.topic[cid] == 10 then
				npcHandler:say("This is really not advisable. Behind this barrier, strong forces are raging violently. Are you sure that you want to go there?", cid)
				npcHandler.topic[cid] = 11
		elseif npcHandler.topic[cid] == 11 then
				selfSay("I guess I cannot stop you then. Since you told me about my apprentice, it is my turn to help you. I will perform a ritual for you, but I need a few ingredients. ...", cid)
				npcHandler:say("Bring me one fresh dead chicken, one fresh dead rat and one fresh dead black sheep, in that order.", cid)
				player:setStorageValue(55701, 1)
				npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 12 then
			if player:getItemCount(4265) >= 1 then
				player:removeItem(4265, 1)
				npcHandler:say("Very good! <mumblemumble> 'Your soul shall be protected!' Now, I need a fresh dead rat.", cid)
				player:setStorageValue(55701, 2)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 13 then
			if player:getItemCount(2813) >= 1 then
				player:removeItem(2813, 1)
				npcHandler:say("Very good! <chants and dances> 'You shall face black magic without fear!' Now, I need a fresh dead black sheep.", cid)
				player:setStorageValue(55701, 3)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
		elseif npcHandler.topic[cid] == 14 then
			if player:getItemCount(2914) >= 1 then
				player:removeItem(2914, 1)
				npcHandler:say("Very good! <stomps staff on ground> 'EVIL POWERS SHALL NOT KEEP YOU ANYMORE! SO BE IT!'", cid)
				player:setStorageValue(55701, 4)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say("You don't have it...", cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "wooden stake") then
		if npcHandler.topic[cid] < 1 then
			if player:getStorageValue(Storage.FriendsandTraders.TheBlessedStake) == 12 and player:getItemCount(5941) >= 1 then
				if player:getStorageValue(Storage.FriendsandTraders.TheBlessedStakeWaitTime) + 7 * 24 * 60 * 60 < os.time() then
					npcHandler:say("Ten prayers for a blessed stake? Don't tell me they made you travel whole Tibia for it! Listen, child, if you bring me a {wooden stake}, I'll bless it for you. <chuckles>", cid)
					npcHandler.topic[cid] = 2
				else
					npcHandler:say("Sorry I'm still exhausted from the last ritual. come back later and try again.", cid)
					npcHandler.topic[cid] = 0
				end
			end
		elseif npcHandler.topic[cid] == 2 then
			if player:getItemCount(5941) >= 1 then
				npcHandler:say("Would you like to receive a spiritual prayer to bless your stake?", cid)
				npcHandler.topic[cid] = 3
			end
		end
	elseif msgcontains(msg, "no") and npcHandler.topic[cid] > 2 then
		npcHandler:say("Maybe next time.", cid)
		npcHandler.topic[cid] = 0
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())