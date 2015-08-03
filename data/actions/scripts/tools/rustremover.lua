local ITEMS = {
    [9808] = { -- Rusty Armor (common), 6958 unrusts
        {"plate armor", 1.97},
        {"brass armor", 13.05},
        {"scale armor", 24.5},
        {"chain armor", 30.14}
    },
    [9809] = {  -- Rusty Armor (semi-rare), 1027 unrusts
        {"crown armor", 0.49},
        {"paladin armor", 2.34},
        {"knight armor", 3.12},
        {"plate armor", 9.64},
        {"brass armor", 14.70},
        {"chain armor", 15.77},
        {"scale armor", 18.31}
    },
    [9810] = { -- Rusty Armor (rare), 1591 unrusts
        {"golden armor", 0.06},
        {"paladin armor", 0.13},
        {"crown armor", 1.51},
        {"knight armor", 17.35},
        {"plate armor", 17.85},
        {"brass armor", 30.11}
    },
    [9811] = { -- Rusty Legs (common), 826 unrusts
        {"plate legs", 1.33},
        {"brass legs", 11.74},
        {"studded legs", 23.85},
        {"chain legs", 32.57}
    },
    [9812] = { -- Rusty Legs (semi-rare), 161 unrusts
        {"knight legs", 1.86},
        {"plate legs", 10.56},
        {"brass legs", 9.32},
        {"chain legs", 18.63},
        {"studded legs", 19.25}
    },
    [9813] = { -- Rusty Legs (semi-rare), ? unrusts
        {"golden legs", 0.75},
        {"crown legs", 1.5},
        {"knight legs", 12.5},
        {"plate legs", 18.5},
        {"brass legs", 30}
    }
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local rusty = ITEMS[itemEx.itemid]
    if rusty == nil then
        return false
    end

    local iEx = Item(itemEx.uid)
    local random, chance = math.random() * 100, 0

    for i = 1, #rusty do
        chance = chance + rusty[i][2]
        if random <= chance then
            iEx:transform(rusty[i][1])
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