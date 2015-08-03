local config = {
	[2212] = {306, 2520},
	[2213] = {305, 2493},
	[2214] = {304, 2645}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(2217) < 1 then
		player:addExperience(250000, true)
		player:setStorageValue(2217, 1)
	end
	
	local targetItem = config[item.uid]
	if not targetItem then
		return true
	end
	
	if player:getStorageValue(targetItem[1]) > 0 then
		player:sendTextMessage(19, "The chest is empty.")
		return true
	end
	
	local itemType = ItemType(targetItem[2])
	if itemType:getArticle() ~= "" then
		text = itemType:getArticle() .. " " .. itemType:getName()
	else
		text = itemType:getName()
	end

	player:setStorageValue(targetItem[1], 1)
	player:addItem(targetItem[2], 1)
	player:sendTextMessage(19, string.format("You have found %s.", text))
	return true
end