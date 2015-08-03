function onUse(cid, item, fromPosition, itemEx, toPosition)
		if(itemEx.itemid == 3698) then
			doTransformItem(item.uid, 3697)
		elseif(itemEx.itemid == 3697) then
			doTransformItem(item.uid, 3698)
		   end
end