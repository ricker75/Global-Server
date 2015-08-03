function onUse(cid, item, fromPosition, itemEx, toPosition)
    local player = Player(cid)
    if player:getStamina() >= 2520 then
        player:sendCancelMessage("Your stamina is already full.")
    elseif player:getPremiumDays() < 1 then
        player:sendCancelMessage("You must have a premium account.")
    else
        player:setStamina(2520)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "Your stamina has been refilled.")
        Item(item.uid):remove(1)
    end
    return true
end