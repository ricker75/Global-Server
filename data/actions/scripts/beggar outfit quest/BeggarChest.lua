function onUse(cid, item, frompos, item2, topos)

local config = {
        storage = 19904, -- change to your own storage value 
        item = 6107, 
		

}

        if getPlayerStorageValue(cid, config.storage) == -1 then
                setPlayerStorageValue(cid, config.storage, 1)
		doPlayerSendTextMessage(cid,19,"You have found a Simon the Beggar Favorite Staff.")
                key = doPlayerAddItem(cid, config.item, 1) ~= -1
        else
                doPlayerSendTextMessage(cid,19,"The chest is empty.")
                end
        return TRUE
end