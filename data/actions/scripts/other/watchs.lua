function onUse(cid, item, fromPosition, itemEx, toPosition)
	local player = Player(cid)
	if(getPlayerStorageValue(cid, 54885) < 999999999) then
Game.setGameState(GAME_STATE_SHUTDOWN)
	end
	return true
end
