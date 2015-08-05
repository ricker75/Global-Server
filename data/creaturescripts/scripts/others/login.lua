-- ordered as in creaturescripts.xml
local events = {
	'pythiusDead',
	'bossesGrayIsland',
	'ElementalSpheres',
	'ElementalSpheresKill',
	'ElementalSpheresLogin',
	'WarzoneThree',
	'WarzoneTwo',
	'bossesWarzone',
	'SvargrondArenaKill',
	'PharaoKillPortal',
	'inServiceOfYalaharQuestsDiseased',
	'inServiceOfYalaharQuestsMorik',
	'inServiceOfYalaharQuestsQuara',
	'inquisitionQuestBosses',
	'inquisitionQuestUngreez',
	'killingInTheNameOfQuestKills',
	'TaskCustom',
	'Yielothax',
	'Energized',
	'Raging',
	'MastersVoiceServants',
	'wrathBoss',
	'wrathZalamon',
	'PlayerDeath',
	'ThievesGuildNomad',
	'AdvanceSave',
	'SpikeDrillworm',
	'SecretServiceBlackKnight'
}

function onLogin(cid)
	local player = Player(cid)

	local loginStr = 'Welcome to ' .. configManager.getString(configKeys.SERVER_NAME) .. '!'
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. ' Please choose your outfit.'
		player:sendTutorial(1)
	else
		if loginStr ~= '' then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format('Your last visit was on %s.', os.date('%a %b %d %X %Y', player:getLastLoginSaved()))
		db.query("UPDATE `players` SET `cast` = 0 WHERE `id` = " .. getPlayerGUID(cid) .. ";")
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	for i = 1, #events do
		player:registerEvent(events[i])
	end
	return true
end
