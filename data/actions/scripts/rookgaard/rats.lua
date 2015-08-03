  -- rook lever by Yuri Lagrotta --

poss = {
[1] = {x=32099, y=32205, z=8},
[2] = {x=32100, y=32205, z=8},
[3] = {x=32101, y=32205, z=8}
}

local lever = {
[1] = {x=32098, y=32204, z=8},
[2] = {x=32104, y=32204, z=8}
}

local itemids = 5770
local exhausth = 2 --em quantos segundos podera usar denovo

function onUse(cid, item, fromPosition, itemEx, toPosition)
        if item.itemid == 1945 then	
		if (getGlobalStorageValue(11548) <= os.time()) then
		doTransformItem(getTileItemById(poss[1],4645).uid,itemids)
                doCreateItem(itemids,poss[1])
		 doCreateItem(itemids,poss[2])
                if getTileItemById(poss[2],4645).itemid ~= nil then
                        doTransformItem(getTileItemById(poss[2],4645).uid,itemids)
                end
                if getTileItemById(poss[3],4647).itemid > 0 then
                        doTransformItem(getTileItemById(poss[3],4647).uid,itemids)
                end

                doTransformItem(item.uid,item.itemid+1)
                doTransformItem(getTileItemById(lever[b],1945).uid,1946)
		setGlobalStorageValue(11548,os.time()+exhausth)
	end


        elseif item.itemid == 1946 then
		doTransformItem(getTileItemById(poss[2],5770).uid,4619)
                doCreateItem(4616,poss[1])

                doCreateItem(351,poss[3])
                doCreateItem(4645,poss[1])
		doCreateItem(9023,poss[1])
                doCreateItem(4647,poss[3])
                doTransformItem(item.uid,item.itemid-1)
                doTransformItem(getTileItemById(lever[b],1946).uid,1945)
        end
        return TRUE
end 