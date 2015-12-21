local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end

local lastSound = 0
function onThink()
	if lastSound < os.time() then
		lastSound = (os.time() + 5)
		if math.random(100) < 25 then
			Npc():say("Psst! Over here!", TALKTYPE_SAY)
		end
	end
	npcHandler:onThink()
end

local function getTable(player)
local itemsList = {}
local buyList = {
	{id = 10942, buy = 600, name = 'Almanac of Magic'},
	{id = 10154, buy = 10000, name = 'Animal Fetish'},
	{id = 10943, buy = 600, name = 'Baby Rotworm'},
	{id = 7500, buy = 6000, name = 'Bale of White Cloth'},
	{id = 2329, buy = 8000, name = 'Bill'},
	{id = 9369, buy = 50000, name = 'Blood Crystal'},
	{id = 10159, buy = 10000, name = 'Bloodkiss Flower'},
	{id = 10109, buy = 5000, name = 'Bundle of Rags'},
	{id = 10615, buy = 1000, name = 'Carrying Device'},
	{id = 7499, buy = 2000, name = 'Cigar'},
	{id = 2347, buy = 1000, name = 'Cookbook'},
	{id = 14338, buy = 40000, name = 'Damaged Logbook'},
	{id = 14352, buy = 17000, name = 'Dark Essence'},
	{id = 10158, buy = 13000, name = 'Deep Crystal'},
	{id = 10169, buy = 8000, name = 'Elemental Crystal'},
	{id = 11397, buy = 600, name = 'Empty Beer Bottle'},
	{id = 8111, buy = 100, name = 'Exploding Cookie'},
	{id = 12501, buy = 4000, name = 'Exquisite Silk'},
	{id = 12503, buy = 4000, name = 'Exquisite Wood'},
	{id = 12500, buy = 600, name = 'Faded Last Will'},
	{id = 4845, buy = 1000, name = 'Family Brooch'},
	{id = 10308, buy = 10000, name = 'Fan Club Membership Card'},
	{id = 10616, buy = 1000, name = 'Filled Carrying Device'},
	{id = 8766, buy = 7000, name = 'Fishnapped Goldfish'},
	{id = 10926, buy = 700, name = 'Flask of Crown Polisher'},
	{id = 11106, buy = 1000, name = 'Flask of Extra Greasy Oil'},
	{id = 10760, buy = 1000, name = 'Flask of Poison'},
	{id = 12506, buy = 4000, name = 'Flexible Dragon Scale'},
	{id = 14351, buy = 5000, name = 'Formula for a Memory Potion'},
	{id = 4858, buy = 6000, name = 'Funeral Urn'},
	{id = 9662, buy = 50000, name = 'Ghosts Tear'},
	{id = 4843, buy = 24000, name = 'Giant Apes Hair'},
	{id = 10165, buy = 13500, name = 'Golem Blueprint'},
	{id = 10173, buy = 25000, name = 'Golem Head'},
	{id = 10454, buy = 350, name = 'Headache Pill'},
	{id = 2330, buy = 8000, name = 'Letterbag'},
	{id = 12285, buy = 1000, name = 'Lump of Clay'},
	{id = 10307, buy = 8500, name = 'Machine Crate'},
	{id = 12508, buy = 4000, name = 'Magic Crystal'},
	{id = 10167, buy = 13000, name = 'Mago Mechanic Core'},
	{id = 10928, buy = 650, name = 'Map to the Unknown'},
	{id = 7281, buy = 500, name = 'Memory Crystal'},
	{id = 4852, buy = 3000, name = 'Memory Stone'},
	{id = 12507, buy = 4000, name = 'Mystic Root'},
	{id = 10225, buy = 5250, name = 'Nautical Map'},
	{id = 12505, buy = 4000, name = 'Old Iron'},
	{id = 10170, buy = 13000, name = 'Old Power Core'},
	{id = 10613, buy = 1000, name = 'Plans for a Strange Device'},
	{id = 10614, buy = 1000, name = 'Rare Crystal'},
	{id = 12297, buy = 1000, name = 'Sacred Earth'},
	{id = 10155, buy = 12500, name = 'Shadow Orb'},
	{id = 4854, buy = 500, name = 'Sheet of Tracing Paper'},
	{id = 7697, buy = 15000, name = 'Signet Ring'},
	{id = 4846, buy = 8000, name = 'Snake Destroyer'},
	{id = 10945, buy = 666, name = 'Soul Contract'},
	{id = 14323, buy = 5000, name = 'Special Flask'},
	{id = 12502, buy = 4000, name = 'Spectral Cloth'},
	{id = 4847, buy = 15000, name = 'Spectral Dress'},
	{id = 10166, buy = 12500, name = 'Stabilizer'},
	{id = 15389, buy = 5000, name = 'Strange Powder'},
	{id = 12504, buy = 4000, name = 'Strong Sinew'},
	{id = 2346, buy = 16000, name = 'Tear of Daraman'},
	{id = 7699, buy = 5000, name = 'Technomancer Beard'},
	{id = 9733, buy = 8000, name = 'The Alchemists Formulas'},
	{id = 8752, buy = 10000, name = 'The Ring of the Count'},
	{id = 7487, buy = 16000, name = 'Toy Mouse'},
	{id = 10944, buy = 550, name = 'Universal Tool'},
	{id = 12295, buy = 1000, name = 'Unworked Sacred Wood'},
	{id = 4838, buy = 18000, name = 'Whisper Moss'},
	{id = 10157, buy = 12500, name = 'Worm Queen Tooth'},
	{id = 14336, buy = 4000, name = 'Wrinkled Parchment'}
		}

if player:getStorageValue(Storage.thievesGuild.Quest) >= 9 then
	for i = 1, #buyList do
		table.insert(itemsList, buyList[i])
	end
end

return itemsList
end

local function setNewTradeTable(table)
	local items = {}
	for _, v in ipairs(table) do
		items[v.id] = {itemId = v.id, buyPrice = v.buy, sellPrice = v.sell, subType = 0, realName = v.name}
	end
	return items
end


local function creatureSayCallback(cid, type, msg)
	local player = Player(cid)

	if msgcontains(msg, "hello") or msgcontains(msg, "hi") then
		npcHandler:say("Hello.", cid)
		npcHandler:addFocus(cid)
	elseif msgcontains(msg, "bye") or msgcontains(msg, "farewell") then
		npcHandler:say("It was a pleasure to help you, "..player:getName()..".", cid)
		npcHandler:releaseFocus(cid)
		npcHandler:resetNpc(cid)
	elseif msgcontains(msg, "trade") and player:getStorageValue(Storage.thievesGuild.Quest) >= 9 then

		local items = setNewTradeTable(getTable(player))

		local function onBuy(cid, item, subType, amount, ignoreCap, inBackpacks)
			if (ignoreCap == false and (player:getFreeCapacity() < getItemWeight(items[item].itemId, amount) or inBackpacks and player:getFreeCapacity() < (getItemWeight(items[item].itemId, amount) + getItemWeight(1988, 1)))) then
				return player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You don\'t have enough cap.')
			end
			if items[item].buyPrice <= player:getMoney() then
				if inBackpacks then
					local container = Game.createItem(1988, 1)
					local bp = player:addItemEx(container)
					if(bp ~= 1) then
						return player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You don\'t have enough container.')
					end
					for i = 1, amount do
						container:addItem(items[item].itemId, items[item])
					end
				else
					return
					player:addItem(items[item].itemId, amount, false, items[item]) and
					player:removeMoney(amount * items[item].buyPrice) and
					player:sendTextMessage(MESSAGE_INFO_DESCR, 'You bought '..amount..'x '..items[item].realName..' for '..items[item].buyPrice * amount..' gold coins.')
				end
				player:sendTextMessage(MESSAGE_INFO_DESCR, 'You bought '..amount..'x '..items[item].realName..' for '..items[item].buyPrice * amount..' gold coins.')
				player:removeMoney(amount * items[item].buyPrice)
			else
				player:sendTextMessage(MESSAGE_STATUS_SMALL, 'You do not have enough money.')
			end
			return true
			end

		local function onSell(cid, item, subType, amount, ignoreEquipped)
			if items[item].sellPrice then
				return
				player:removeItem(items[item].itemId, amount, -1, ignoreEquipped) and
				player:addMoney(items[item].sellPrice * amount) and

				player:sendTextMessage(MESSAGE_INFO_DESCR, 'You sold '..amount..'x '..items[item].realName..' for '..items[item].sellPrice * amount..' gold coins.')
			end
			return true
		end
		openShopWindow(cid, getTable(player), onBuy, onSell)
		npcHandler:say("Keep in mind you won't find better offers here. Just browse through my wares.", cid)
	else
		npcHandler:say("I don't trade with not recognized traders.", cid)
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())
