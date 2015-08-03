---- string of mending id "22542"-----
local breakChance = 60

local brokenItems = {
    
[13877] = {22516} -----Broken Ring Id "13877" Ring of ending "22516"
}


function onUse(cid, item, fromPosition, itemEx, toPosition)
    
if brokenItems[itemEx.itemid] ~= nil then
        
if math.random(100) <= breakChance then
            
doRemoveItem(itemEx.uid)
            
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You broke it.")
 
doSendMagicEffect(getCreaturePosition(cid),17)
       
else
            
local newId = brokenItems[itemEx.itemid][math.random(#brokenItems[itemEx.itemid])]
            
doTransformItem(itemEx.uid,newId)
            
doPlayerSendTextMessage(cid,MESSAGE_INFO_DESCR,"You removed the broken Part, revealing a "..getItemName(newId))
 
doSendMagicEffect(getCreaturePosition(cid),48)
        
end
        
doRemoveItem(item.uid,1)
        
return TRUE
    
end
    return FALSE

end