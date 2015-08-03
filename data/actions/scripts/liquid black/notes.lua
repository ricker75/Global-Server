function onUse(cid, item, fromPosition, itemEx, toPosition)
        if(item.uid == 33310) then
                if(Player(cid):getStorageValue(33311) < 1) then
                        Player(cid):setStorageValue(33311, 1)
			Player(cid):addItem(15576, 1)
                        Player(cid):sendTextMessage(19, "You have found notes and coordinates.")
                else
                        Player(cid):sendTextMessage(19, "The chest is empty.")
                end
        end
        return true
end
