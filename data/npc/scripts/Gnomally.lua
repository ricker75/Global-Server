local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)			npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

local item = 'I\'m sorry, but you do not have the required items for this trade.'
local done = 'Here you are, thank you for your business.'

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	
	if msgcontains(msg, 'equipament') then
		npcHandler:say('You can here change some items for {gill gugel}, {gill coat}, {gill legs}, {spellbook of vigilance}, {prismatic armor}, {prismatic legs}, {prismatic boots}, {prismatic helmet}, {prismatic shield}, {iron loadstone}, {glow wine}, {Gnomish Voucher Type CA1}, {Gnomish Voucher Type CA2}, {Gnomish Voucher Type MA1}, {Gnomish Voucher Type MA2}.', cid)
	elseif msgcontains(msg, 'gill coat') then
		if getPlayerItemCount(cid,18423) >= 10 then
			npcHandler:say('Did you bring me the 10 major crystalline token?', cid)
			npcHandler.topic[cid] = 1
		else
			npcHandler:say('I need a {10 major crystalline token}, to give you one Gill Coat. Please come back when you have them.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 1 then
		npcHandler.topic[cid] = 0
		if getPlayerItemCount(cid,18423) >= 10 then
			if doPlayerRemoveItem(cid,18423, 10) == TRUE then
				npcHandler:say(done, cid)
				doPlayerAddItem(cid, 18399, 1)
			end
		else
			npcHandler:say(item, cid)
		end
	elseif msgcontains(msg, 'gill gugel') then
		if getPlayerItemCount(cid,18423) >= 10 then
			npcHandler:say('Did you bring me the 10 major crystalline token?', cid)
			npcHandler.topic[cid] = 2
		else
			npcHandler:say('I need a {10 major crystalline token}, to give you the Gill Gugel. Come back when you have it.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 2 then
		npcHandler.topic[cid] = 0
		if getPlayerItemCount(cid,18423) >= 10 then
			if doPlayerRemoveItem(cid,18423,10) == TRUE then
				npcHandler:say(done, cid)
				doPlayerAddItem(cid,18398,1)
			end
		else
			npcHandler:say(item, cid)
		end
	elseif msgcontains(msg, 'gill legs') then
		if getPlayerItemCount(cid,18423) >= 10 then
			npcHandler:say('Did you bring me 10 major crystalline token ?', cid)
			npcHandler.topic[cid] = 3
		else
			npcHandler:say('I need {10 major crystalline token}, to give you the Gill Legs. Come back when you have it.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 3 then
		npcHandler.topic[cid] = 0
		if getPlayerItemCount(cid,18423) >= 10 then
			if doPlayerRemoveItem(cid,18423,10) == TRUE then
				doPlayerAddItem(cid,18400,1)
				npcHandler:say(done, cid)
			end
		else
			npcHandler:say(item, cid)
		end
	elseif msgcontains(msg, 'spellbook of vigilance') then
		if getPlayerItemCount(cid,18423) >= 10 then
			npcHandler:say('Did you bring me 10 major crystalline token?', cid)
			npcHandler.topic[cid] = 4
		else
			npcHandler:say('I need {10 major crystalline token}, to give you the Spellbook of Vigilance. Come back when you have them.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 4 then
		npcHandler.topic[cid] = 0
		if getPlayerItemCount(cid,18423) >= 10 then
			if doPlayerRemoveItem(cid,18423,10) == TRUE then
				doPlayerAddItem(cid,18401,1)
				npcHandler:say(done, cid)
			end
		else
			npcHandler:say(item, cid)
		end
	elseif msgcontains(msg, 'prismatic helmet') then
		if getPlayerItemCount(cid,18423) >= 10 then
			npcHandler:say('Did you bring me 10 major crystalline tokens?', cid)
			npcHandler.topic[cid] = 5
		else
			npcHandler:say('I need {10 major crystalline tokens}, to give you the Prismatic Helmet. Come back when you have them.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 5 then
		npcHandler.topic[cid] = 0
		if getPlayerItemCount(cid,18423) >= 10 then
			if doPlayerRemoveItem(cid,18423,10) == TRUE then
				doPlayerAddItem(cid,18403,1)
				npcHandler:say(done, cid)
			end
		else
			npcHandler:say(item, cid)
		end
	elseif msgcontains(msg, 'prismatic armor') then
		if getPlayerItemCount(cid,18423) >= 10 then
			npcHandler:say('Did you bring me 10 major crystalline tokens?', cid)
			npcHandler.topic[cid] = 6
		else
			npcHandler:say('I need {10 major crystalline tokens}, to give you the Prismatic Armor. Come back when you have them.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 6 then
		npcHandler.topic[cid] = 0
		if getPlayerItemCount(cid,18423) >= 10 then
			doPlayerRemoveItem(cid,18423,10)
			doPlayerAddItem(cid,18404,1)
			npcHandler:say(done, cid)
		else
			npcHandler:say(item, cid)
		end
	elseif msgcontains(msg, 'prismatic legs') then
		if getPlayerItemCount(cid,18423) >= 10 then
			npcHandler:say('Did you bring me 10 major crystalline tokens?', cid)
			npcHandler.topic[cid] = 7
		else
			npcHandler:say('I need a {10 major crystalline tokens}, to give you the Prismatic Legs. Come back when you have it.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 7 then
		npcHandler.topic[cid] = 0
		if getPlayerItemCount(cid,18423) >= 10 then
			if doPlayerRemoveItem(cid,18423,10) == TRUE then
				doPlayerAddItem(cid,18405,1)
				npcHandler:say(done, cid)
			end
		else
			npcHandler:say(item, cid)
		end
	elseif msgcontains(msg, 'prismatic boots') then
		if getPlayerItemCount(cid,18423) >= 10 then
			npcHandler:say('Did you bring me 10 major crystalline tokens?', cid)
			npcHandler.topic[cid] = 8
		else
			npcHandler:say('I need a {10 major crystalline tokens}, to give you the Prismatic Boots. Come back when you have it.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 8 then
		npcHandler.topic[cid] = 0
		if getPlayerItemCount(cid,18423) >= 10 then
			if doPlayerRemoveItem(cid,18423,10) == TRUE then
				doPlayerAddItem(cid,18406,1)
				npcHandler:say(done, cid)
			end
		else
			npcHandler:say(item, cid)
		end
	elseif msgcontains(msg, 'prismatic shield') then
		if getPlayerItemCount(cid,18423) >= 10 then
			npcHandler:say('Did you bring me the 10 major crystalline tokens?', cid)
			npcHandler.topic[cid] = 9
		else
			npcHandler:say('I need a {10 major crystalline tokens}, to give you the Prismatic Shield. Come back when you have them.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 9 then
		npcHandler.topic[cid] = 0
		if getPlayerItemCount(cid,18423) >= 10 then
			if doPlayerRemoveItem(cid,18423,10) == TRUE then
				doPlayerAddItem(cid,18410,1)
				npcHandler:say(done, cid)
			end
		else
			npcHandler:say(item, cid)
		end
	elseif msgcontains(msg, 'Gnomish Voucher Type CA1') then
		if getPlayerItemCount(cid,18422) >= 70 then
			npcHandler:say('Did you bring me the 70 minor crystalline tokens?', cid)
			npcHandler.topic[cid] = 10
		else
			npcHandler:say('I need a {70 minor crystalline tokens}, to give you the Gnomish Voucher Type CA1. Come back when you have it.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 10 then
		npcHandler.topic[cid] = 0
		if getPlayerItemCount(cid,18422) >= 70 then
			if doPlayerRemoveItem(cid,18422,70) == TRUE then
				doPlayerAddItem(cid,18521,1)
				npcHandler:say(done, cid)
			end
		else
			npcHandler:say(item, cid)
		end

	elseif msgcontains(msg, 'Gnomish Voucher Type CA2') then
		if getPlayerItemCount(cid,18422) >= 70 then
			npcHandler:say('Did you bring me 70 minor crystalline tokens?', cid)
			npcHandler.topic[cid] = 11
		else
			npcHandler:say('I need a {70 minor crystalline tokens}, to give you the Gnomish Voucher Type CA2. Come back when you have it.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 11 then
		npcHandler.topic[cid] = 0
		if getPlayerItemCount(cid,18422) >= 70 then
			if doPlayerRemoveItem(cid,18422,70) == TRUE then
				doPlayerAddItem(cid,18522,1)
				npcHandler:say(done, cid)
			end
		else
			npcHandler:say(item, cid)
		end

	elseif msgcontains(msg, 'Gnomish Voucher Type MA1') then
		if getPlayerItemCount(cid,18422) >= 70 then
			npcHandler:say('Did you bring me the 70 minor crystalline tokens?', cid)
			npcHandler.topic[cid] = 12
		else
			npcHandler:say('I need a {70 minor crystalline tokens}, to give you the Gnomish Voucher Type MA1. Come back when you have it.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 12 then
		npcHandler.topic[cid] = 0
		if getPlayerItemCount(cid,18422) >= 70 then
			if doPlayerRemoveItem(cid,18422,70) == TRUE then
				doPlayerAddItem(cid,18518,1)
				npcHandler:say(done, cid)
			end
		else
			npcHandler:say(item, cid)
		end

	elseif msgcontains(msg, 'Gnomish Voucher Type MA2') then
		if getPlayerItemCount(cid,18422) >= 70 then
			npcHandler:say('Did you bring me the 70 minor crystalline tokens?', cid)
			npcHandler.topic[cid] = 13
		else
			npcHandler:say('I need a {70 minor crystalline tokens}, to give you the Gnomish Voucher Type MA2. Come back when you have it.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 13 then
		npcHandler.topic[cid] = 0
		if getPlayerItemCount(cid,18422) >= 70 then
			if doPlayerRemoveItem(cid,18422,70) == TRUE then
				doPlayerAddItem(cid,18519,1)
				npcHandler:say(done, cid)
			end
		else
			npcHandler:say(item, cid)
		end

	elseif msgcontains(msg, 'iron loadstone') then
		if getPlayerItemCount(cid,18423) >= 20 then
			npcHandler:say('Did you bring me the 20 major crystalline tokens?', cid)
			npcHandler.topic[cid] = 14
		else
			npcHandler:say('I need a {20 major crystalline tokens}, to give you the Iron Loadstone. Come back when you have it.', cid)
			npcHandler.topic[cid] = 0
		end

	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 14 then
		npcHandler.topic[cid] = 0
		if getPlayerItemCount(cid,18423) >= 20 then
			if doPlayerRemoveItem(cid,18423,20) == TRUE then
				doPlayerAddItem(cid,18447,1)
				npcHandler:say(done, cid)
			end
		else
			npcHandler:say(item, cid)
		end

	elseif msgcontains(msg, 'glow wine') then
		if getPlayerItemCount(cid,18423) >= 20 then
			npcHandler:say('Did you bring me the 20 major crystalline tokens?', cid)
			npcHandler.topic[cid] = 15
		else
			npcHandler:say('I need a {20 major crystalline tokens}, to give you the Iron Loadstone. Come back when you have it.', cid)
			npcHandler.topic[cid] = 0
		end

	elseif msgcontains(msg, 'yes') and npcHandler.topic[cid] == 15 then
		npcHandler.topic[cid] = 0
		if getPlayerItemCount(cid,18423) >= 20 then
			if doPlayerRemoveItem(cid,18423,20) == TRUE then
				doPlayerAddItem(cid,18448,1)
				npcHandler:say(done, cid)
			end
		else
			npcHandler:say(item, cid)
		end
	elseif msgcontains(msg, 'no') and npcHandler.topic[cid] >= 1 and npcHandler.topic[cid] <= 15 then
		npcHandler:say('Well, then leave.')
		npcHandler.topic[cid] = 0
	end
	
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())