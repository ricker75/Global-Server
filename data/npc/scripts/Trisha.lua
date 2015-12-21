local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	local player = Player(cid)
	
	if msgcontains(msg, "addon") then
		if player:getStorageValue(12225) < 1 then
			npcHandler:say("To get warrior shoulder spike you need give me 100 hardened bones, 100 turtle shells, a fighting spirit and a dragon claw. Do you have it with you?", player)
			npcHandler.topic[cid] = 1
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:getItemCount(5925) >= 100 and player:getItemCount(5899) >= 100 and player:getItemCount(5884) >= 1 and player:getItemCount(5919) >= 1 then
				npcHandler:say("Ah, right! The warrior shoulder spike! Here you go.", player)
				player:removeItem(5925, 100)
				player:removeItem(5899, 100)
				player:removeItem(5884, 1)
				player:removeItem(5919, 1)
				player:setStorageValue(12225, 2)
				player:addOutfitAddon(142, 1)
				player:addOutfitAddon(134, 1)
				player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
				local cStorage = Storage.Achievements.WildWarrior
				if player:getStorageValue(cStorage) < 1 then
					player:setStorageValue(cStorage, 1)
				elseif player:getStorageValue(cStorage) == 1 then
					player:addAchievement('Wild Warrior')
					player:setStorageValue(cStorage, 2)
				end
				npcHandler.topic[cid] = 0	
			else
				npcHandler:say("You don't have it...", player)
			end
		end
	return true
	end
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())