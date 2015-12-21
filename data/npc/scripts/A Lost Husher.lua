local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

function greetCallback(cid)
	local player = Player(cid)
	if player:getStorageValue(Storage.spikeTask.Undercover) > 0 and player:getStorageValue(Storage.spikeTask.Undercover) < 4 and player:getStorageValue(Storage.spikeTask.LostHusher) <= os.time() then
		npcHandler:setMessage(MESSAGE_GREET, "Pssst! Keep it down! <gives you an elaborate report on monster activity>")
		player:setStorageValue(Storage.spikeTask.Undercover, player:getStorageValue(Storage.spikeTask.Undercover) + 1)
		player:setStorageValue(Storage.spikeTask.LostHusher, os.time() + 20*3600)
	else
		npcHandler:setMessage(MESSAGE_GREET, "Hi!")
	end
	return true
end

npcHandler:setMessage(MESSAGE_WALKAWAY, 'Good bye, |PLAYERNAME|!')
npcHandler:setMessage(MESSAGE_FAREWELL, 'Good bye |PLAYERNAME| and take care.')
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
npcHandler:setCallback(CALLBACK_GREET, greetCallback)