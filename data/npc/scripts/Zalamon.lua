local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)		npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()				npcHandler:onThink()					end

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end

	local player = Player(cid)
	
	if msgcontains(msg, "mission") then
		-- CHILDREN OF REVOLUTION QUEST
		if player:getStorageValue(1050) < 1 then
			selfSay("Zzo you are offering your help to a lizzard? Hmm, unuzzual. I don't know if I can fully truzzt you yet. ...", cid)
			selfSay("You'll have to work to earn my truzzt. Are you zzure you want to offer me your help?", cid)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(1050) == 2 then
			selfSay("What newzz do you bring? Did you find any cluezz about zzeir whereaboutzz? ", cid)
			npcHandler.topic[cid] = 3
		elseif player:getStorageValue(1050) == 3 then
			selfSay("Zzurely you have zzeen zze black pondzz and puddlezz all over zze mountain pazz, palezzkin. It izz zze corruption zzat pervadezz zze landzz. It would be wizze not to drink or tazzte from zzem. ... ", cid)
			selfSay("It zzoakzz zze land, itzz people and even zze air itzzelf. But zzere are zztill zzpotzz not tainted by zze darknezz. ... ", cid)
			selfSay("A temple, norzzwezzt of zze barricaded outpozzt wizztood zze evil influenzze. However, I lozzt contact to itzz inhabitantzz when zze lizzardzz tightened zzeir grip. ... ", cid)
			selfSay("No one made it zzrough zze mountainzz for quite zzome time now - exzzept you. Maybe you can find out what happened zzere? ", cid)
			npcHandler.topic[cid] = 5
		elseif player:getStorageValue(1050) == 5 then
			selfSay("Zzo you found zze temple... lozzt you zzay. It wazz our lazzt remaining bazztion of hope for help from wizzin zze plainzz. ... ", cid)
			selfSay("Zzat meanzz zze plainzz are now in zze handzz of zze emperor and hizz army. I'm afraid zzat even zze great gate izz zzealed and zze landzz beyond it tainted azz well. ... ", cid)
			selfSay("Dark timezz, and I fear we know nozzing about our enemy yet. ", cid)
			player:setStorageValue(1050, 6)
			player:setStorageValue(15331, 3) -- storage quest log
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(1050) == 6 then
			selfSay("Large partzz of zze empire are tainted. I zzee now zzat zzere izz almozzt nozzing left of our onzze zzo zztrong zzivilizzation. But I zztill don't know which danger our enemy really pozzezz. ... ", cid)
			selfSay("Zzere uzzed to be a remote and quiet zzettlement in zze middle of zze valley. If it hazz not been dezztroyed by zze corruption, I'm zzure zze army of zze emperor will have confizzcated it to gazzer rezzourzzezz. ... ", cid)
			selfSay("If you can get inzzide zze village, find out anyzzing you can about zzeir zzituation. Zze clever hawk hidezz itzz clawzz. ... ", cid)
			selfSay("I'm mozzt interezzted in zzeir weaponzz, food and zze zztrengzz of zzeir forzzezz. ... ", cid)
			selfSay("Are you prepared for zzizz mizzion?", cid)
			npcHandler.topic[cid] = 6
		elseif player:getStorageValue(1050) == 7 and player:getStorageValue(1055) == 1 and player:getStorageValue(1056) == 1 and player:getStorageValue(1057) == 1 then
			selfSay("Zzizz izz mozzt unfortunate. Zzo many warriorzz? Large amountzz of food? And how many weaponzz did you zzay? I zzee, hmm. ... ", cid)
			selfSay("Direct confrontation izz futile. We'll have to find ozzer wayzz to approach zze emperor and hizz army. ", cid)
			player:setStorageValue(1050, 8)
			player:setStorageValue(15332, 2) -- storage quest log
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(1050) == 8 then
			selfSay("Your lazzt excurzzion revealed a terrifying truzz. Zze enemy'zz forzzezz are overwhelming, zzeir zztrengzz probably unrivaled. We cannot attack an army of zzizz zzize unlezz - unlezz we zzin out zzeir rankzz a little. ... ", cid)
			selfSay("A zzingle individual can be azz zztrong azz an army if he zztrikezz zze army azz a whole. ... ", cid)
			selfSay("Are you ready for your nexzzt tazzk?", cid)
			npcHandler.topic[cid] = 7
		elseif player:getStorageValue(1050) == 11 then
			selfSay("You accomplished an important tazzk in breaking zze defenzze of zze emperor. Not everyzzing might be lozzt yet. ... ", cid)
			selfSay("I've got anozzer mizzion for you which will be even more dangerouzz zzan zze lazzt one. Return to me when you're ready. ", cid)
			player:setStorageValue(1050, 12)
			player:setStorageValue(15333, 3) -- storage quest log
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue(1050) == 12 then
			selfSay("Wizz zze enemy'zz forzzezz weakened like zzizz, we will be able to zzneak pazzt zze defenzze and furzzer inzzpect zze norzz. You should travel to zze mountain range furzzer eazzt of zze village. ... ", cid)
			selfSay("Zze old route to zze gate hazz been taken by darknezz. You'll have to find ozzer wayzz. Are you up to zzizz, palezzkin? ", cid)
			npcHandler.topic[cid] = 10
		elseif player:getStorageValue(1050) == 17 then
			selfSay("You have zzolved zze riddle? Imprezzive, palezzkin. Zze humming you hear in zze chamber mozzt zzertainly comezz from a magic portal zzomewhere in zze temple. ...", cid)
			selfSay("Have you zzearched zze ozzer chamberzz for any magical devizzezz or portalzz?", cid)
			npcHandler.topic[cid] = 12
		elseif player:getStorageValue(1050) == 18 then
			selfSay("If I'm correct, zze portal in zze chamber beyond zze mechanizzm will lead you to zze great gate. It izz perfectly pozzible, however, zzat you will not be tranzzported directly into zze area. ...", cid)
			selfSay("You will razzer be brought to a plazze clozze by your goal. Where exzzactly, I cannot zzay. ...", cid)
			selfSay("Take all your courage and walk zze pazz zzrough zze portal. At leazzt TRY it - after all, I didn't make you my pupil for nozzing, Kohei. Are you prepared?", cid)
			npcHandler.topic[cid] = 13
		elseif player:getStorageValue(1050) == 20 then
			selfSay("Too clozze, far too clozze. I felt a huge impact not long after you left. Zze war machinery of zze emperor muzzt finally have been zztarted. ...", cid)
			selfSay("I focuzzed and could only hope zzat I would reach you before everyzzing wazz too late. If I hadn't been able to tranzzport you here, our cauzze would have been lozzt. ...", cid)
			selfSay("I'm afraid we cannot continue zzizz fight here today. Zze rezzizztanzze izz zztill fragile. I'm afraid, zzere izz zztill much left to do. We'll have to prepare for war. ...", cid)
			selfSay("You've helped uzz a great deal during zzezze dark hourzz, I've got zzomezzing for you my friend. Pleazze, take zzizz zzerpent crezzt azz a zzign of my deep rezzpect. ...", cid)
			selfSay("Rezzt for now, you will need it - you have earned it.", cid)
			player:setStorageValue(1050, 21)
			player:setStorageValue(15335, 3) -- storage quest log
			player:setStorageValue(15340, 1) -- storage quest log emperor
			player:addItem(11116, 1)
			player:addExperience(10000, true)
			npcHandler.topic[cid] = 0
		end
	-- CHILDREN OF REVOLUTION QUEST
	elseif msgcontains(msg, "symbols") then
		if player:getStorageValue(1050) == 14 then
			selfSay("Mh, zze zzymbolzz of zze chamber you dezzcribe are very common in our culture, palezzkin. You should have come accrozz zzem in many a plazze already. ...", cid)
			selfSay("Zze zzymbolzz zzeem to be arranged in zzome way you zzay? Were zzere any notizzeable devizzezz? Zzwitchezz or leverzz?", cid)
			npcHandler.topic[cid] = 11
		end
	-- CHILDREN OF REVOLUTION QUEST
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			selfSay("Zzen indeed, I have a tazzk for you. Lizzten carefully and you might even learn zzomezzing. A wizze being hearzz one zzing and underzztandzz ten. ...", cid)
			selfSay("Zze mountainzz to zze norzz are overrun by corrupted lizzardzz. ...", cid)
			selfSay("Beyond zzem, you'll find a lush valley, zze Muggy Plainzz. Find out about zzeir planzz, zzeir tacticzz. Zze lizzardzz' art of war izz characterizzed by dizzguizze and zzecrezzy. ...", cid)
			selfSay("A traveller told me about a barricaded zzettlement zzey ezztablished. It'zz a weak and in all zzeir arroganzze, poorly guarded outpozzt beyond zze mountainzz. ...", cid)
			selfSay("If you can find any documentzz about zzeir zztrategiezz, zze rezzizztanzze will be very grateful. ...", cid)
			selfSay("Are you interezzted, palezzkin?", cid)
			npcHandler.topic[cid] = 2
		elseif npcHandler.topic[cid] == 2 then
			selfSay("Be warned. Zze mountain pazzezz have been dezzerted for zzeveral weekzz now. No one made it acrozz and I fear you won't meet a zzingle friendly zzoul up zzere.", cid)
			player:setStorageValue(1050, 1)
			player:setStorageValue(15330, 1) -- storage quest log
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 3 then
			selfSay("Exzztraordinary. We are mozzt fortunate to have zzezze documentzz in our handzz now. Zzizz would zzertainly help me to build an effective rezzizztanzze. Will you give zzem to me? ", cid)
			npcHandler.topic[cid] = 4
		elseif npcHandler.topic[cid] == 4 then
			if player:removeItem(11101, 1) then
				selfSay("Aaah, zzezze look zzertainly interezzting. Zzezze manuzzcriptzz show uzz zzeveral locationzz of zze enemy troopzz. ... ", cid)
				selfSay("I'm imprezzed, zzoftzzkin. Maybe you can be of zzome more help. ", cid)
				player:setStorageValue(1050, 3)
				player:setStorageValue(15330, 3) -- storage quest log
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 5 then
			selfSay("I've marked itzz location on your map. Go and find out what happened zzere. In zze pazzt it wazz known azz zze Temple of Equilibrium. ", cid)
			player:setStorageValue(1050, 4)
			player:setStorageValue(15331, 1) -- storage quest log
			player:addMapMark({x = 33177, y = 31193, z = 7}, 5, "Temple of Equilibrium")
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 6 then
			selfSay("I'll mark zze entranzze to Chaochai on your map. ... ", cid)
			selfSay("Conzzentrate on one location at a time. Zze one who chazzezz after two harezz, won't catch even one. ", cid)
			player:setStorageValue(1050, 7)
			player:setStorageValue(15332, 1) -- storage quest log
			player:addMapMark({x = 33235, y = 31177, z = 7}, 4, "entrance of the camp")
			player:addMapMark({x = 33257, y = 31172, z = 7}, 3, "building 1 which you have to spy")
			player:addMapMark({x = 33227, y = 31163, z = 7}, 3, "building 2 which you have to spy")
			player:addMapMark({x = 33230, y = 31156, z = 7}, 3, "building 3 which you have to spy")
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 7 then
			selfSay("Not far to zze eazzt of zze village, you'll find rizze fieldzz. Zzey uzze zzem to rezztore zzeir food suppliezz. ... ", cid)
			selfSay("In zze zztorage accrozz zzizz room, you'll find a zzpecial poizzon which will zzignificantly weaken zzem if uzzed on zze water and zzoil zze rizze growzz in. ... ", cid)
			selfSay("Are you fully prepared for zzizz?", cid)
			npcHandler.topic[cid] = 8
		elseif npcHandler.topic[cid] == 8 then
			selfSay("Good. Zze fieldzz should be not far from Xiachai in zze eazzt. Go to zze top terrazze and mix zze poizzon wizz zze water. ... ", cid)
			selfSay("Poizzon izz often uzzed by cowardzz, yet it grantzz great power to zze opprezzed. ", cid)
			player:setStorageValue(1050, 9)
			player:setStorageValue(15333, 1) -- storage quest log
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 10 then
			selfSay("Perhapzz you can find a way to enter zze norzz of zze valley and find a pazzage to zze great gate itzzelf. Zzearch any templezz or zzettlementzz you come accrozz for hidden pazzagezz. ... ", cid)
			selfSay("I wish for a zzafe return wizz good newzz. ", cid)
			player:setStorageValue(15334, 1) -- storage quest log
			player:setStorageValue(1050, 13)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 11 then
			selfSay("Interezzting. It'zz a riddle, zzoftzzkin. Zzuch gamezz are very popular in our culture. I believe zze leverzz will alter zze arrangement. ... ", cid)
			selfSay("Not too far from zze lever, zzere muzzt be a hint of zzome zzort. An image of how zze zzymbolzz muzzt be arranged. Zzurely zze mechanizzm will trigger a zzecret pazzage, maybe a moving wall or a portal. ... ", cid)
			selfSay("Zzizz should be our pazz to zze great gate. Head to zze zztorage onzze again. Zzere should be zzome extra greazzy oil which should work wizz zzuch a large mechanizzm. Zze leverzz should zzen be movable again. ", cid)
			player:setStorageValue(15334, 3) -- storage quest log
			player:setStorageValue(1050, 15)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 12 then
			selfSay("Zzen zzizz izz zze way which will lead you to zze great gate. ...", cid)
			selfSay("Hmmm, before I forget it - zzinzze you are zzkilled in zzolving riddlezz, maybe you can make uzze of zzizz old tome I've found? It containzz ancient knowledge and truly izz a tezztament of our culture, treat it wizz care. ... ", cid)
			selfSay("I may alzzo have anozzer mizzion for you if you are interezzted.", cid)
			player:setStorageValue(15334, 4) -- storage quest log
			player:setStorageValue(1050, 18)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 13 then
			selfSay("You did well on your quezzt zzo far. I hope you will reach zze great gate in time. If we are lucky, it will zztill be open. ... ", cid)
			selfSay("If not, it will already be overrun by enemy zzoldierzz. Direct confrontation will be inevitable in zzat cazze, palezzkin. Now clear your mind and approach zze portal.", cid)
			player:setStorageValue(1050, 19)
			player:setStorageValue(15335, 1) -- storage quest log
			npcHandler.topic[cid] = 0
		-- CHILDREN OF REVOLUTION QUEST	
		end	
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())