local config = {
	['Dragonling'] = {mountId = 31, tameMessage = 'The wild dragonling will accompany you as a friend from now on.', sound = 'FI?'},
	['Draptor'] = {mountId = 6, tameMessage = 'You have tamed the wild draptor.', sound = 'Screeeeeeeeech'},
	['Enraged White Deer'] = {mountId = 18, mountName = 'kingly deer', tameMessage = 'You have tamed the deer.', sound = '*bell*'},
	['Ironblight'] = {mountId = 29, tameMessage = 'You tamed the ironblight.', sound = 'Plinngggg'},
	['Magma Crawler'] = {mountId = 30, tameMessage = 'The magma crawler will accompany you as a friend from now on.', sound = 'ZzzZzzZzzzZz'},
	['Midnight Panther'] = {mountId = 5, tameMessage = 'You have tamed the wild panther.', sound = 'Purrrrrrr'},
	['Wailing Widow'] = {mountId = 1, mountName = 'widow queen', tameMessage = 'You have tamed the wailing widow.', sound = 'Sssssssss'},
	['Wild Horse'] = {mountId = 17, mountName = 'war horse', tameMessage = 'The horse eats the sugar oat and accepts you as its new master.', sound = '*snort*'},
	['Panda'] = {mountId = 19, tameMessage = 'You have tamed the panda.', sound = 'Rrrrr...'}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local targetMonster = Monster(itemEx.uid)
	if not targetMonster or targetMonster:getMaster() then
		return false
	end

	local targetName = targetMonster:getName():lower()
	local monsterConfig = config[targetName]
	if not monsterConfig then
		return true
	end

	local player = Player(cid)
	if player:hasMount(monsterConfig.mountId) then
		player:say('You already tamed a ' .. (monsterConfig.mountName or targetName) .. '.', TALKTYPE_MONSTER_SAY)
		return true
	end

	player:addAchievement('Natural Born Cowboy')
	player:addMount(monsterConfig.mountId)
	player:say(monsterConfig.tameMessage, TALKTYPE_MONSTER_SAY)
	toPosition:sendMagicEffect(CONST_ME_SOUND_RED)

	targetMonster:say(monsterConfig.sound, TALKTYPE_MONSTER_SAY)
	targetMonster:remove()

	Item(item.uid):remove()
	return true
end