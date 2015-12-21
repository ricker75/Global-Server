local corpses = {8967, 8934, 8969, 8968} -- ID dos corpses
local xd = {
        [4120] = { -- Sorcerer
                sto = 40064,
                name = "Fire Overlord",
                transform_id = 8575, create_id = 0,
                boss_pos = {x = 33199, y = 32106, z = 13},
                pos = {
                        {x = 33198, y = 32109, z = 13},
                        {x = 33201, y = 32109, z = 13},
                        {x = 33203, y = 32107, z = 13},
                        {x = 33203, y = 32104, z = 13},
                        {x = 33201, y = 32102, z = 13},
                        {x = 33198, y = 32102, z = 13},
                        {x = 33196, y = 32104, z = 13},
                        {x = 33196, y = 32107, z = 13},
                },
        },

        [4121] = { -- Knight
                sto = 40065,
                name = "Energy Overlord",
                transform_id = 0, create_id = 1491,
                boss_pos = {x = 33095, y = 32193, z = 13},
                pos = {
                        {x = 33094, y = 32196, z = 13},
                        {x = 33097, y = 32196, z = 13},
                        {x = 33099, y = 32194, z = 13},
                        {x = 33099, y = 32191, z = 13},
                        {x = 33097, y = 32189, z = 13},
                        {x = 33094, y = 32189, z = 13},
                        {x = 33092, y = 32191, z = 13},
                        {x = 33092, y = 32194, z = 13},
                },
        },

        [4122] = { -- Paladin
                sto = 40066,
                name = "Ice Overlord",
                transform_id = 8574, create_id = 0,
                boss_pos = {x = 33286, y = 32101, z = 13},
                pos = {
                        {x = 33285, y = 32104, z = 13},
                        {x = 33288, y = 32104, z = 13},
                        {x = 33290, y = 32102, z = 13},
                        {x = 33290, y = 32099, z = 13},
                        {x = 33288, y = 32097, z = 13},
                        {x = 33285, y = 32097, z = 13},
                        {x = 33283, y = 32099, z = 13},
                        {x = 33283, y = 32102, z = 13},
                },
        },

        [4123] = { -- Druid
                sto = 40067,
                name = "Earth Overlord",
                transform_id = 8576, create_id = 0,
                boss_pos = {x = 33347, y = 32208, z = 13},
                pos = {
                        {x = 33346, y = 32210, z = 13},
                        {x = 33344, y = 32208, z = 13},
                        {x = 33344, y = 32205, z = 13},
                        {x = 33346, y = 32203, z = 13},
                        {x = 33349, y = 32203, z = 13},
                        {x = 33351, y = 32205, z = 13},
                        {x = 33351, y = 32208, z = 13},
                        {x = 33349, y = 32210, z = 13},
                },
        },
}

local function getSoils(aid, id)
        local c = 0

        for _, v in pairs(xd[aid].pos) do
                if getTileItemById(v, id).itemid ~= 0 then
                        c = c + 1
                end
        end

        return c
end

function onAddItem(moveitem, tileitem, position)
        local mi = Item(moveitem.uid)
        if (ItemType(moveitem.itemid):isCorpse() or isInArray(corpses, moveitem.itemid)) and moveitem.itemid ~= 8964 then
                local soil = xd[tileitem.actionid]
                if getSoils(tileitem.actionid, soil.create_id ~= 0 and soil.create_id or soil.transform_id) > 7 and getGlobalStorageValue(soil.sto) < 1 then
                        local bid = Game.createMonster(soil.name, soil.boss_pos)
                        bid:registerEvent("ElementalSpheres")

                        setGlobalStorageValue(soil.sto, 1)
                        mi:remove(1)
                        return true
                end
        end

        return true
end

function onStepIn(cid)
        Player(cid):setStorageValue(70000, -1)
        return true
end