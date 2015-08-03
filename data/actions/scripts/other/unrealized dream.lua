local ITEMS = {
    [22598] = {
        {"rubbish", 10.7},
		{"snowball", 10.32},
		{"dice", 9.77},
		{"present", 9.6},
		{"blue rose", 9.56},
		{"simple dress", 9.56},
		{"mirror", 9.53},
		{"piggy bank", 4.85},
		{"lute", 4.81},
		{"spellwand", 4.19},
		{"goldfish bowl", 3.83},
		{"meat", 3.2},
		{"copper prision key", 2.04},
		{"bronze prision key", 2.03},
		{"silver prision key", 1.88},
		{"cluster of solace", 1.28},
		{"wedding ring", 0.6},
		{"pair of earmuffs", 0.59},
		{"dream warden claw", 0.51},
		{"golden prision key", 0.5},
		{"stuffed bunny", 0.41},
		{"bag of apple slices", 0.23}
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local udream = ITEMS[itemEx.itemid]
    if udream == nil then
        return false
    end

    local iEx = Item(itemEx.uid)
    local random, chance = math.random() * 100, 0

    for i = 1, #udream do
        chance = chance + udream[i][2]
        if random <= chance then
            iEx:transform(udream[i][1])
            iEx:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
            Item(item.uid):remove(1)
            return true
        end
    end

    iEx:getPosition():sendMagicEffect(CONST_ME_BLOCKHIT)
    Item(item.uid):remove(1)
    iEx:remove()
    return true
end