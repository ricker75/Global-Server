-- AJEITAR 8575 ANTES NO FIRE

local aids = {
	[4120] = {used_id = 8299, target_id = 8573, effect = 3, transform_id = 8575, create_id = 0, sto = 40064}, -- Sorcerer
	[4121] = {used_id = 8303, target_id = 8567, effect = 29, transform_id = 0, create_id = 1491, sto = 40065}, -- Knight
	[4122] = {used_id = 8302, target_id = 8571, effect = 29, transform_id = 8574, create_id = 0, sto = 40066}, -- Paladin
	[4123] = {used_id = 8298, target_id = 8572, effect = 29, transform_id = 8576, create_id = 0, sto = 40067}, -- Druids
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local soil = aids[itemEx.actionid]
	if soil and item.itemid == soil.used_id  and itemEx.itemid == soil.target_id then

		if soil.create_id ~= 0 then
			Game.createItem(soil.create_id, 1, toPosition)
			addEvent(function()
				Tile(toPosition):getItemById(soil.create_id):remove(1)
				--doRemoveItem(getTileItemById(toPosition, create_id).uid, 1)
			end, 30000)
		else
			addEvent(function(aid)
				Tile(toPosition):getItemById(soil.transform_id):transform(aid)
				--doTransformItem(getTileItemById(toPosition, soil.transform_id).uid, aid)
			end, 30000, itemEx.itemid)

			Item(itemEx.uid):transform(soil.transform_id)
			--doTransformItem(itemEx.uid, soil.transform_id)

			Item(item.uid):remove(1)
			--doRemoveItem(item.uid, 1)
		end

		fromPosition:sendDistanceEffect(toPosition, soil.effect)
		--doSendDistanceShoot(fromPosition, toPosition, soil.effect)
		Item(item.uid):remove(1)
		return true
	end

	return false
end
