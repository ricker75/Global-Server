function onSay(cid, words, param)
	local split = param:split(",")
	
	if not hasVip(cid) then
		doPlayerSendCancel(cid, "you need to be VIP.") return true
	elseif not split[1] then
		ShowItemsTabble(cid) return true
	elseif tonumber(split[1]) or tonumber(split[2]) then
		doPlayerSendCancel(cid, "Entera AutoLoot system, please write !autoloot add, name or !autoloot remove, name") return true
	elseif isInArray({"add","remove"}, tostring(split[1])) then
		split[2] = split[2]:gsub("^%s*(.-)$", "%1")
		local func,check = tostring(split[1]) == "add" and addItemTable or removeItemTable, tostring(split[1]) == "add" and true or false
		local item = getItemIdByName(tostring(split[2]), false) 
		if not item then
			doPlayerSendCancel(cid, "This item does not exist.") return true
		elseif check == true and isInArray(autoLootInfo.BlockItemsList, item) then
			doPlayerSendCancel(cid, "You can not add this item in the list!") return true
		elseif isInTable(cid, item) == check then
			doPlayerSendCancel(cid, "This Item "..(check == true and "already" or "is not").." in your list.") return true
		end
		func(cid, item)
		local player = Player(cid)
		player:save()
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE,check == true and "you added the item "..split[2].." in the list" or "you removed the item "..split[2].." from the list") return true
	end
end