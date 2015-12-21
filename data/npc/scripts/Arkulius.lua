local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)	npcHandler:onCreatureSay(cid, type, msg:lower())	end
function onThink()						npcHandler:onThink()						end

local config = {
	[5] = {boss_item = 8304, add_item = 8867, boss_name = "Fire Overlord", boss_sto = 60027},
	[6] = {boss_item = 8305, add_item = 8869, boss_name = "Earth Overlord", boss_sto = 60030},
	[7] = {boss_item = 8300, add_item = 8853, boss_name = "Ice Overlord", boss_sto = 60029},
	[8] = {boss_item = 8306, add_item = 8883, boss_name = "Energy Overlord", boss_sto = 60028},
}

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local p = Player(cid)

	if p:getStorageValue(60025) == -1 then
		if msgcontains(msg, "alverus") then
			selfSay("It happened while he carried out an experiment concerning the creation of the elemental shrines. I still get goose bumps just by thinking of it. ...", cid)
			selfSay("You need to know about the process of creating an elemental shrine to understand it completely, but I don't want to go into detail now. ...", cid)
			selfSay("Anyway, his spell had a different outcome than he had planned. He accidentally created an Ice Overlord, pure living elemental ice, who froze him in a blink of an eye.", cid)
			npcHandler.topic[cid] = 1
		elseif msgcontains(msg, "shrines") and npcHandler.topic[cid] == 1 then
			selfSay("The creation of the elemental shrines is a really complex matter. They are actually nodes, locations where the matching elemental sphere is very close. ...", cid)
			selfSay("The shrine itself is like a portal between our world and the elemental sphere and enables us to use the elemental energy emerging from it.", cid)
			npcHandler.topic[cid] = 2
		elseif msgcontains(msg, "sphere") and npcHandler.topic[cid] == 2 then
			selfSay("I found a way to visit them. It's VERY dangerous and there is a decent chance that you won't come back BUT if you succeed you'll write history!!! Ask me about that {mission} if you're interested.", cid)
			npcHandler.topic[cid] = 3
		elseif msgcontains(msg, "mission") and npcHandler.topic[cid] == 3 then
			if p:getLevel() < 80 or not config[p:getVocation():getId()] then
				selfSay("I'm sorry this task is highly dangerous and I need experienced people for it. ", cid)
				return false
			end

			selfSay("Okay, listen closely: First of all, you need to gather 20 enchanted amethysts in order to go to the energy sphere. Deep under the academy, one floor below the elemental shrines, there is a machine. Put the gems in there and activate it. ...", cid)
			selfSay("Once you got there, find a way to gather elemental energy in any form. You will face energy elementals, that's for sure, but I don't know how the energy is stored. ...", cid)
			selfSay("Anyway, there should be a way to use that energy and strengthen one of the elementals. If my calculations are right, you will create an Energy Overlord who hopefully will consist of some sort of 'concentrated' energy. ...", cid)
			selfSay("THAT'S what we need!! Are you in on it?", cid)

			npcHandler.topic[cid] = 4
		elseif msgcontains(msg, "yes") and npcHandler.topic[cid] == 4 then
			selfSay("Good, don't waste time! Come back here when you have the elemental object!", cid)
			p:setStorageValue(60025, 1)
		end
	elseif p:getStorageValue(60025) == 1 then
		if msgcontains(msg, "mission") then
			if p:getStorageValue(config[p:getVocation():getId()].boss_sto) < 1 or p:getItemCount(config[p:getVocation():getId()].boss_item) < 1 then
				selfSay("You need some kind of pure elemental soil from the ".. config[p:getVocation():getId()].boss_name .. ". Come back when you've got it.", cid)
			else
				local add = {[5] = "an knight, a druid, and a paladin", [6] = "a sorcerer, an knight and a paladin",
				[7] = "an knight, a sorcerer, and a druid",  [8] = "a sorcerer, a druid, and a paladin"}

				selfSay("Impressive!! Let me take a look.......Ahh, ".. ItemType(config[p:getVocation():getId()].boss_item):getName():upper() .."! Now you need to find a ".. add[p:getVocation():getId()] .." who also completed this first task. ...", cid)
				selfSay("Go down in the cellar again. I prepared a room under the academy where it should be safe. Your task is to charge the machines with the elemental substances and summon the LORD OF THE ELEMENTS. ...", cid)
				selfSay("When you use an obsidian knife on it's corpse you hopefully get some of the precious neutral matter. It's the only way to revive my dear friend Alverus!!", cid)
				p:setStorageValue(60025, 2)
			end
		end
	elseif p:getStorageValue(60025) == 2 then
		if msgcontains(msg, "mission") then
			if p:getStorageValue(60031) > 0 and p:getItemCount(8310) > 0 then
				selfSay("AMAZING!! I'm going to start immediately with the research. If it turns out the way I expect it, Alverus will be revived soon!! Here, take this as a reward and try to collect more of this substance. I'll make you a good offer, I promise.", cid)
				p:addItem(config[p:getVocation():getId()].add_item, 1)
				p:setStorageValue(60025, 3)
				Position(getThingPos(cid)):sendMagicEffect(13)
			else
				selfSay("Come back when you finish your current mission.", cid)
			end
		end
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
