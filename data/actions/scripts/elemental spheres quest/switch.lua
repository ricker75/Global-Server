local positions = {
	[5] = {pos = {old = {x = 33268, y = 31833, z = 10}, new = {x = 33272, y = 31831, z = 12}}, itemid = 8304}, -- Sorcerer
	[6] = {pos = {old = {x = 33268, y = 31838, z = 10}, new = {x = 33263, y = 31840, z = 12}}, itemid = 8305}, -- Druid
	[7] = {pos = {old = {x = 33270, y = 31835, z = 10}, new = {x = 33263, y = 31831, z = 12}}, itemid = 8300}, -- Paladin
	[8] = {pos = {old = {x = 33266, y = 31835, z = 10}, new = {x = 33263, y = 31831, z = 12}}, itemid = 8306}, -- Knight

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local p = Player(cid)
	if Tile({x = 33269, y = 31837, z = 12}):getItemById(5071) then
	--if getTileItemById({x = 33269, y = 31837, z = 12}, 5071).uid > 100 then
		return true
	end

	for vocation, info in pairs(positions) do
		local pid = Tile(info.pos.old):getTopCreature()

		if not pid or not pid:isPlayer() or pid:getVocation() ~= vocation or pid:getItemCount(info.itemid) < 1 or pid:getStorageValue(60025) < 2 then
			p:say("You need one player of each vocation having completed the Elemental Spheres quest and also carrying the elemental rare item.", TALKTYPE_MONSTER_SAY)
			return true
		end

	end

	if #getCreaturesInArea({x = 33241, y = 31815, z = 12}, {x = 33300, y = 31874, z = 12}, true) > 0 then
		p:say("A team is facing Lord of the Elements.", TALKTYPE_MONSTER_SAY)
		return true
	end

	for _, v in pairs(positions) do
		local pid = Tile(v.pos.old):getTopCreature()
		pid:getPosition():sendMagicEffect()
		pid:teleportTo(v.pos.new)
		pid:getPosition():sendMagicEffect(10)
	end

	return false
end
