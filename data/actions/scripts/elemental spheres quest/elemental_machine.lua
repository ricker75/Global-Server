local aids = {
	[4129] = {voc = 5, item = 8304, pos = {x = 33263, y = 31810, z = 12}},
	[4130] = {voc = 6, item = 8305, pos = {x = 33263, y = 31860, z = 12}},
	[4131] = {voc = 7, item = 8300, pos = {x = 33292, y = 31831, z = 12}},
	[4132] = {voc = 8, item = 8306, pos = {x = 33243, y = 31831, z = 12}},
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local p = Player(cid)
	local tab = aids[itemEx.actionid]

	local voc = p:getVocation():getId()
	if not tab or tab.voc ~= voc or tab.item ~= item.itemid or not isInArray({7913, 7914, 7911, 7912}, itemEx.itemid) then
		return false
	end

	local p = tab.pos

	if voc == 5 or voc == 6 then
		local p = tab.pos
		local machine1 = Tile(p):getItemById(7913)
		machine1:transform(8896)

		local machine2 = Tile({x = p.x, y = p.y + 1, z = p.z}):getItemById(7914)
		machine2:transform(8897)
	else
		local p = tab.pos
		local machine1 = Tile(p):getItemById(7912)
		machine1:transform(8895)

		local machine2 = Tile({x = p.x - 1, y = p.y, z = p.z}):getItemById(7911)
		machine2:transform(8894)
	end

	toPosition:sendMagicEffect(12)
	Item(item.uid):remove(1)
	return true
end
