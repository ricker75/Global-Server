function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if player:getStorageValue(8815) < 1 then
		player:addHealth(player:getMaxHealth())
		player:addMana(player:getMaxMana())
		player:addAchievement('Fountain of Life')
		player:say('You feel very refreshed and relaxed.', TALKTYPE_MONSTER_SAY)
		player:setStorageValue(8815, 1)
		end
	return true
end