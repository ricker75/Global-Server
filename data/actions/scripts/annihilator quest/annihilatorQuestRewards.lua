local rewards = {
	[27215] = 2494,
	[27216] = 2400,
	[27217] = 2431,
	[27218] = 2326
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(getPlayerStorageValue(cid, 2215) < 1) then
		doPlayerAddItem(cid, rewards[item.uid], 1)
		doPlayerAddExp(cid, 100000, true, true)
		setPlayerStorageValue(cid,2215, 1)
		player:addAchievement(225) -- Achievement Annihilator
		doPlayerSendTextMessage(cid, 19, "You have found " .. getItemName(rewards[item.uid]) .. ".") 
	else
		doPlayerSendTextMessage(cid, 19, "The chest is empty.")
	end
	return true
end
