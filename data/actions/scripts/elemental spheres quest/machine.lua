local vocs = {
        [5] = {x = 33180, y = 32198, z = 13},
        [6] = {x = 33329, y = 32075, z = 13},
        [7] = {x = 33262, y = 32201, z = 13},
        [8] = {x = 33085, y = 32095, z = 13},
}

function onUse(cid, item, fromPosition, itemEx, tp)
        local p = Player(cid)

        if isInArray({7915, 7916}, item.itemid) then
                if item.itemid == 7915 then
                        Tile({x = tp.x + 1, y = tp.y, z = tp.z}):getItemById(7916):transform(8895)
                        --doTransformItem(getTileItemById({x = tp.x + 1, y = tp.y, z = tp.z}, 7916).uid, 8895)
                        Item(item.uid):transform(8894) --doTransformItem(item.uid, 8894)
                else
                        Tile({x = tp.x - 1, y = tp.y, z = tp.z}):getItemById(7915):transform(8894)
                        --doTransformItem(getTileItemById({x = tp.x - 1, y = tp.y, z = tp.z}, 7915).uid, 8894)
                        Item(item.uid):transform(8895) --doTransformItem(item.uid, 8895)
                end

                tp:sendMagicEffect(12)
                p:say("ON", TALKTYPE_ORANGE_1, false, cid, (tp or getCreaturePosition(cid)))
                if p:getStorageValue(60026) == 20 then
                        Position(getThingPos(cid)):sendMagicEffect(10)
                        p:teleportTo(vocs[p:getVocation():getId()])
                        p:getPosition():sendMagicEffect(10)
                        --Position(vocs[p:getVocation():getId()]):sendMagicEffect(10)

                        p:setStorageValue(60026, -1)
                end
        else
                if item.itemid == 8894 then
                        Tile({x = tp.x + 1, y = tp.y, z = tp.z}):getItemById(7916):transform(8895)
                        --doTransformItem(getTileItemById({x = tp.x + 1, y = tp.y, z = tp.z}, 8895).uid, 7916)
                        Item(item.uid):transform(7915)
                        --doTransformItem(item.uid, 7915)
                else
                        Tile({x = tp.x - 1, y = tp.y, z = tp.z}):getItemById(8894):transform(7915)
                        --doTransformItem(getTileItemById({x = tp.x - 1, y = tp.y, z = tp.z}, 8894).uid, 7915)

                        Item(item.uid):transform(7916)
                        --doTransformItem(item.uid, 7916)
                end
                p:say("OFF", TALKTYPE_ORANGE_1, false, cid, (tp or getCreaturePosition(cid)))
        end

        return true
end