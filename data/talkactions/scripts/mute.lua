function onSay(cid, words, param)
	local player = Player(cid)

	local target = Player(param)
	if target == nil then
		player:sendCancelMessage("A player with that name is not online.")
		return false
	end

	target:doaddCondition(CONDITION_MUTED)
	target:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have been muted by " .. player:getName() .. ".")
	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You muted " .. target:getName() .. ".")
end
