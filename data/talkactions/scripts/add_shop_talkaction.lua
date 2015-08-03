function onSay(cid, words, param, channel)
local params = string.explode(param, ",")
local price = params[1]
table.remove(params, 1)
local desc = table.concat(params,",")
local name = ''
local item1 = getPlayerSlotItem(cid, CONST_SLOT_RIGHT)
local itemid1 = item1.itemid
local count1 = item1.type
local itemid2 = 0
local count2 = 0

if(itemid1 == 0) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Put item in right hand.")
return true
end
if(not price) then
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You must set price.")
return true
end
price = tonumber(price)
local itemInfo = getItemInfo(itemid1)
local offer_type = 'item'
if(isContainer(item1.uid)) then
local item2 = getContainerItem(item1.uid, 0)
if(item2.itemid > 0) then
count1 = getContainerCap(item1.uid)
itemid2 = item2.itemid
count2 = item2.type
offer_type = 'container'
itemInfo = getItemInfo(itemid2)
end
end
local count1_desc = (count1 > 0) and count1 or 1
local count2_desc = (count2 > 0) and count2 or 1
if(itemid2 == 0) then
name = count1_desc .. 'x ' .. itemInfo.name
else
name = count1_desc .. 'x ' .. count2_desc .. 'x ' .. itemInfo.name
end
db.executeQuery('INSERT INTO `z_shop_offer` (`id` ,`points` ,`itemid1` ,`count1` ,`itemid2` ,`count2` ,`offer_type` ,`offer_description` ,`offer_name`) VALUES (NULL , ' .. price .. ', ' .. itemid1 .. ', ' .. count1 .. ', ' .. itemid2 .. ', ' .. count2 .. ', \'' .. offer_type .. '\', ' .. db.escapeString(desc) .. ', ' .. db.escapeString(name) .. ');')
doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Item >> " .. name .. " << added to SMS shop. Price is " .. price .. " premium points.")
return true
end