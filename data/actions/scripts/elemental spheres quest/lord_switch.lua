local config = {
	[5] = {pos = {x = 33272, y = 31831}, aid = 4125,  -- Sorcerer
		wall_id = 5071,
		machine_id = 8896,
		wall = {
			{x = 33266, y = 31828, z = 12},
			{x = 33267, y = 31828, z = 12},
			{x = 33268, y = 31828, z = 12},
			{x = 33269, y = 31828, z = 12},
			{x = 33270, y = 31828, z = 12},
		},
		area = {{x = 33263, y = 31806, z = 12}, {x = 33272, y = 31828, z = 12}},
	},

	[6] = {pos = {x = 33263, y = 31840,}, aid = 4126,  -- Druid
		wall_id = 5071,
		machine_id = 8896,
		wall = {
			{x = 33266, y = 31843, z = 12},
			{x = 33267, y = 31843, z = 12},
			{x = 33268, y = 31843, z = 12},
			{x = 33269, y = 31843, z = 12},
			{x = 33270, y = 31843, z = 12},
		},
		area = {{x = 33263, y = 31843, z = 12}, {x = 33272, y = 31865, z = 12}},
	},

	[7] = {pos = {x = 33272, y = 31840}, aid = 4127,  -- Paladin
		wall_id = 5072,
		machine_id = 8895,
		wall = {
			{x = 33275, y = 31834, z = 12},
			{x = 33275, y = 31835, z = 12},
			{x = 33275, y = 31836, z = 12},
			{x = 33275, y = 31837, z = 12},
			{x = 33275, y = 31838, z = 12},
		},
		area = {{x = 33275, y = 31831, z = 12}, {x = 33297, y = 31840, z = 12}},
	},

	[8] = {pos = {x = 33263, y = 31831}, aid = 4128,  -- Knight
		wall_id = 5072,
		machine_id = 8895,
		wall = {
			{x = 33260, y = 31834, z = 12},
			{x = 33260, y = 31835, z = 12},
			{x = 33260, y = 31836, z = 12},
			{x = 33260, y = 31837, z = 12},
			{x = 33260, y = 31838, z = 12},
		},
		area = {{x = 33238, y = 31832, z = 12}, {x = 33260, y = 31840, z = 12}},
	},
}

local machines_pos = {
	[5] = {x = 33263, y = 31810, z = 12},
	[6] = {x = 33263, y = 31860, z = 12},
	[7] = {x = 33292, y = 31831, z = 12},
	[8] = {x = 33243, y = 31831, z = 12},
}

local function ready()
	for _, v in pairs(config) do
		if not Tile(v.wall[1]):getItemById(v.wall_id) then
			return false
		end
	end

	return true
end

local function limparTuto(lord)
	if lord:isCreature() then
		lord:remove()
	end
	for _, pid in pairs(getCreaturesInArea({x = 33238, y = 31806, z = 12}, {x = 33297, y = 31865, z = 12}, true)) do
		pid:teleportTo({x = 33268, y = 31835, z = 10})
	end

	for i, v in pairs(config) do
		for _, pos in pairs(v.wall) do
			local item = Tile(pos):getItemById(v.wall_id)

			if item then
				Item(item):remove(1)
			end
		end
	end

	return true
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local p = Player(cid)
	local p_voc = p:getVocation():getId()
	local conf = config[p_voc]

	local p_pos = p:getPosition()

	if not conf or conf.aid ~= item.actionid or not Tile(machines_pos[p_voc]):getItemById(conf.machine_id) or p_pos.x ~= conf.pos.x or p_pos.y ~= conf.pos.y or Tile(conf.wall[1]):getItemById(conf.wall_id) or #getCreaturesInArea(conf.area[1], conf.area[2], true) > 0 then
		return true
	end

	for v, pos in pairs(conf.wall) do
		Game.createItem(conf.wall_id, 1, pos)
	end

	if p_voc == 5 or p_voc == 6 then
		local p = machines_pos[p_voc]
		Tile(p):getItemById(8896):transform(7913) -- doTransformItem(getTileItemById(p, 8896).uid, 7913)
		Tile({x = p.x, y = p.y + 1, z = p.z}):getItemById(8897):transform(7914)
		--doTransformItem(getTileItemById({x = p.x, y = p.y + 1, z = p.z}, 8897).uid, 7914)
	else
		local p = machines_pos[p_voc]
		Tile(p):getItemById(8895):transform(7912) -- doTransformItem(getTileItemById(p, 8894).uid, 7911)
		Tile({x = p.x - 1, y = p.y, z = p.z}):getItemById(8894):transform(7911)
		--doTransformItem(getTileItemById({x = p.x + 1, y = p.y, z = p.z}, 8895).uid, 7912)
	end

	if ready() then
		local lord = Game.createMonster("Lord Of The Elements", {x = 33270, y = 31845, z = 12})
		addEvent(limparTuto, 600000, lord)
	end

	return true
end
