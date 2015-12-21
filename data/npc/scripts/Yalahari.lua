local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

 
function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	
	
	local player = Player(cid)
	if msgcontains(msg, "mission") then
		if player:getStorageValue( 30) == 17 then
			selfSay("With all the coming and going of strangers here, it would be quite tedious to explain everything again and again. So we have written a manifesto. ...", cid)
			npcHandler:say("Grab a copy from the room behind me. Let's talk about your further career in our ranks once you've read it.", cid)
			player:setStorageValue( 30, 18)
			player:setStorageValue(12014, 3) -- StorageValue for Questlog "Mission 03: Death to the Deathbringer"
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 650) == 1 and player:getStorageValue( 30) == 18 then
			selfSay("I'm mildly impressed by your previous deeds in our service. So I'm willing to grant you some more important {missions}. ...", cid)
			selfSay("If you please us, a life of luxury as an important person in our city is ensured. If you fail, you will be replaced by someone more capable than you. ...", cid)
			npcHandler:say("So if you are up for a challenge, ask me for a {mission}.", cid)
			player:setStorageValue( 30, 19)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 30) == 19 then
			selfSay("The former alchemist quarter was struck by even more disasters than the rest of the city. Fires, explosions, poisonous fumes - all sorts of catastrophes. ...", cid)
			selfSay("The worst plague, however, are unknown diseases that have spread in this quarter and eradicated any human population. We must stop it before other quarters areafflicted. We already identified certain carriers responsible for spreading the plague. ...", cid)
			selfSay("It will be your task to eliminate them. This spell will protect you from becoming infected yourself. Enter the alchemist quarter and kill the three plague carriers, and atbest anything else you might find there. ...", cid)
			selfSay("Even more important, retrieve the last research notes that the local alchemists made before the plague killed them. They might be the key for a cure or something else. ...", cid)
			selfSay("At least we have to make sure that these scientists did not die in vain, and honour their researches. So please bring us these research notes. ...", cid)
			npcHandler:say("Also, I will inform the guards that you are allowed to pass the centre gate to the alchemist quarter. Just use the gate mechanism to pass.", cid)
			player:setStorageValue( 30, 20)
			player:setStorageValue(12014, 4) -- StorageValue for Questlog "Mission 03: Death to the Deathbringer"
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 30) == 21 and player:getStorageValue( 651) == 1 then
			npcHandler:say("So you have killed the plague carriers. Have you also retrieved the research papers? ", player)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue( 30) == 22 then
			selfSay("We surely cannot allow some underworld kingpin to rule a significant part of the city. Although, I have to admit that his firm grip on the former trade quarter might be useful....", cid)
			selfSay("I expect you to fight your way through his minions and to show him that we are determined and powerful enough to retake the quarter, if necessary by force. Talk to himafter killing some of his henchmen. ...", cid)
			selfSay("I'm sure he'll understand that he will succumb to a greater power. That's how his little empire has worked after all. ...", cid)
			npcHandler:say("Also, I will inform the guards that you are allowed to pass the centre gate to the trade quarter now. Just use the gate mechanism to pass.", cid)
			player:setStorageValue( 30, 23)
			player:setStorageValue(12015, 1) -- StorageValue for Questlog "Mission 04: Good to be Kingpin"
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 30) == 26 then
			selfSay("So he has been too uncooperative for you? Well, you weren't the first we have sent and you won't be the last. ...", cid)
			npcHandler:say("However, if you cannot even serve us as a bully, we might have to rethink if you are the right person for us. That was a bad job and we don't tolerate many of them.", cid)
			player:setStorageValue( 30, 27)
			player:setStorageValue(12015, 6) -- StorageValue for Questlog "Mission 04: Good to be Kingpin"
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 30) == 25 and player:getStorageValue( 18) == 2 then
			selfSay("I hope you gave this criminal a real scare! I'm sure he'll remember what he has to expect if he arouses our anger again. ...", cid)
			selfSay("You have proven yourself as quite valuable with this mission! That was just the first step on your rise through the ranks of our helpers. ...", cid)
			npcHandler:say("Just ask me for more missions and we will see what you are capable of!", cid)
			player:setStorageValue( 20, player:getStorageValue( 20) >= 0 and player:getStorageValue( 20) + 1 or 0) -- Side Storage
			player:setStorageValue( 30, 27)
			player:setStorageValue(12015, 6) -- StorageValue for Questlog "Mission 04: Good to be Kingpin"
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 30) == 27 then
			selfSay("As you probably noticed, once our city had a park and a zoo around a grand arena. It was a favourite pastime of our citizens to visit this quarter in their spare time. ...", cid)
			selfSay("Nowadays, the quarter is lost. The animals are on the loose, and an attempt to revitalise the city with new arena games resulted in a revolt of the foreign gladiators. ...", cid)
			selfSay("Now all kinds of beasts roam the park, and gladiators challenge them and visitors to test their skills. One of the residents is an ancient druid that rather cares foranimals than for people. ...", cid)
			selfSay("It is said that he is able to use magic to breed animals with changed abilities and appearances. Such skills are of course quite useful for us. ...", cid)
			selfSay("We lack the manpower to retake all quarters, or just to defend ourselves adequately. If he bred us some guards and warbeasts, we could strengthen our positionconsiderably. ...", cid)
			npcHandler:say("Travel to the arena quarter and gain his assistance for us. I will inform the guards that you are allowed to pass the centre gate to the arena quarter now. Just use thegate mechanism to pass.", cid)
			player:setStorageValue( 30, 28)
			player:setStorageValue(12016, 1) -- StorageValue for Questlog "Mission 05: Food or Fight"
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 30) == 33 then
			selfSay("This druid dares to affront us? We will look into this when we have enough time. But there are other things that needs to be settled. ...", cid)
			npcHandler:say("Although, we probably should not do so after your last failure, we are willing to grant you another mission.", cid)
			player:setStorageValue( 30, 34)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 30) == 32 and player:getStorageValue( 16) == 2 then
			selfSay("So have you won us a new ally? Excellent. I knew you would not dare to ruin this mission. Soon we might be able to strengthen our defences and even relocate some of our guards. ...", cid)
			npcHandler:say("Perhaps some day soon, you lead your own unit of men. However, there are more missions that need to be accomplished. Let's talk about them.", cid)
			player:setStorageValue( 20, player:getStorageValue( 20) >= 0 and player:getStorageValue( 20) + 1 or 0) -- Side Storage
			player:setStorageValue( 30, 34)
			player:setStorageValue(12016, 8) -- StorageValue for Questlog "Mission 05: Food or Fight"
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 30) == 34 then
			selfSay("The old cemetery of the city has been abandoned decades ago when the activity of the various undead there became unbearable. The reason for their appearance was never found out or researched. ...", cid)
			selfSay("However, those undead could be useful, at least some of them. Particular ghosts consist of a substance that is very similar to the energy source that powered some of our devices. ...", cid)
			selfSay("Since we lack most of the original sources, some substitute might come in handy. Take this ghost charm and place it on the strange carving in the cemetery. ...", cid)
			selfSay("Use it to attract ghosts and slay them. Then use the residues of the ghosts on the charm to capture the essence. ...", cid)
			npcHandler:say("Once it is filled, ghosts will not be attracted any longer. Then return the charm to me. I will inform the guards that you are allowed to pass the centre gate to the cemetery quarter now. Just use the gate mechanism to pass.", cid)
			player:setStorageValue( 30, 35)
			player:setStorageValue(12017, 1) -- StorageValue for Questlog "Mission 06: Frightening Fuel"
			doPlayerAddItem(cid, 9737, 1)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 30) == 38 then
			selfSay("Destroyed you say? That's impossible! I'm not sure if I can trust you in this matter? One might assume, you fled from the ghosts in terror and left the charm there. ...", cid)
			npcHandler:say("You will have to work twice as hard on your next missions to restore the trust you have lost.", cid)
			player:setStorageValue( 30, 39)
			player:setStorageValue(12017, 5) -- StorageValue for Questlog "Mission 06: Frightening Fuel"
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 30) == 37 then
			if player:getItemCount(9742) >= 1 then
				player:removeItem( 9742, 1)
				selfSay("Ah, what an unexpected sight. I can almost feel the energy of the charm. It will help to recover some of the past wealth. ...", cid)
				npcHandler:say("You did quite an impressive job. I'm considering to introduce you to my ma.. to my direct superior one day. But there are still other missions to fulfil.", cid)
				player:setStorageValue( 30, 39)
				player:setStorageValue(12017, 5) -- StorageValue for Questlog "Mission 06: Frightening Fuel"
				player:setStorageValue( 14, 2)
				player:setStorageValue( 20, player:getStorageValue( 20) >= 0 and player:getStorageValue( 20) + 1 or 0) -- Side Storage
				npcHandler.topic[cid] = 0
			end
		elseif player:getStorageValue( 30) == 39 then
			selfSay("Recently, our fishermen have been attacked by a maritime race called the quara. They live in the sunken quarter and are a significant threat to our people. I ask you to enter the sunken quarter and slay all their leaders. ...", cid)
			npcHandler:say("We believe that there are three leaders in this area. Your task is simple enough, so you better don't fail! ...","I will inform the guards that you are allowed to pass the centre gate to the sunken quarter now. Just use the gate mechanism to pass.", cid)
			player:setStorageValue( 30, 40)
			player:setStorageValue(12018, 1) -- StorageValue for Questlog "Mission 07: A Fishy Mission"
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 30) == 41 and player:getStorageValue( 11) == 1 and player:getStorageValue( 12) == 1 and player:getStorageValue( 13) == 1 and player:getStorageValue( 14) == 2 then
			npcHandler:say("This will teach these fishmen who is the ruler of that area. You have earned yourself a special privilege. But we will talk about that when we speak about your next mission. ", player)
			player:setStorageValue( 30, 43)
			player:setStorageValue(12018, 5) -- StorageValue for Questlog "Mission 07: A Fishy Mission"
			player:setStorageValue( 20, player:getStorageValue( 20) >= 0 and player:getStorageValue( 20) + 1 or 0) -- Side Storage
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 30) == 43 then
			selfSay("In the past, we had many magical factories providing the citizens with everything they needed. Now that most of these factories are shut down, we have trouble getting enough supplies. ...", cid)
			selfSay("We need you to enter one of the lesser damaged factories. Go to the factory district and look for a pattern crystal used for weapon production. Use it on the factory controller. ...", cid)
			selfSay("It will ensure that the factory will provide us with a suitable amount of weapons which we dearly need to reclaim and secure the most dangerous parts of the city. ...", cid)
			npcHandler:say("I will inform the guards that you are allowed to pass the centre gate to the factory quarter now. Just use the gate mechanism to pass.", cid)
			player:setStorageValue( 30, 44)
			player:setStorageValue(12019, 1) -- StorageValue for Questlog "Mission 08: Dangerous Machinations"
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 30) == 46 then
			if player:getStorageValue( 9) == 1 then
				npcHandler:say("Your failure is an outrage! I think we have to talk about the missions you have accomplished so far. ", player)
				player:setStorageValue( 21, player:getStorageValue( 21) >= 0 and player:getStorageValue( 21) + 1 or 0) -- Side Storage
			elseif player:getStorageValue( 9) == 2 then
				npcHandler:say("Now we will have power we truly deserve!...", player)
				player:setStorageValue( 20, player:getStorageValue( 20) >= 0 and player:getStorageValue( 20) + 1 or 0) -- Side Storage
			end
			player:setStorageValue( 30, 47)
			player:setStorageValue(12019, 4) -- StorageValue for Questlog "Mission 08: Dangerous Machinations"
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 30) == 47 then
			selfSay("I'm impressed by your support for our cause. Still, I'm aware that this scheming Palimuth tried to influence you. Think about who are your real friends and who can assist you in your career. ...", cid)
			npcHandler:say("Come back if you have decided to which side you want to belong.", cid)
			player:setStorageValue( 30, 48)
			player:setStorageValue(12020, 1) -- StorageValue for Questlog "Mission 09: Decision"
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 30) == 49 or player:getStorageValue( 30) == 48 then
			npcHandler:say("So do you want to side with me " .. player:getName() .. "? ", player)
			npcHandler.topic[cid] = 2
		elseif player:getStorageValue( 30) == 50 and player:getStorageValue( 8) == 2 then
			selfSay("For your noble deeds, we would like to invite you to a special celebration ceremony. ...", cid)
			selfSay("Only the most prominent Yalahari are allowed to join the festivities. I assume you can imagine what honour it is that you'vebeen invited to join us. Meet us in the inner city's centre. ...", cid)
			selfSay("As our most trusted ally, you may pass all doors to reach the festivity hall. There you will receive your reward for the achievements you have gained so far. ...", cid)
			npcHandler:say("I'm convinced your reward will be beyond your wildest dreams. And that is just the beginning!", cid)
			player:setStorageValue( 30, 51)
			player:setStorageValue(12021, 1) -- StorageValue for Questlog "Mission 10: The Final Battle"
			player:setStorageValue(12021, 2) -- StorageValue for Questlog "Mission 10: The Final Battle"
			player:setStorageValue( 1015, 2)
			npcHandler.topic[cid] = 0
		elseif player:getStorageValue( 30) == 52 and player:getStorageValue( 1015) == 2 then
			npcHandler:say("Great work, take this outfit and you are able to open the door to the reward room.", player)
			player:setStorageValue( 30, 53)
			player:setStorageValue(12021, 4) -- StorageValue for Questlog "Mission 10: The Final Battle"
			player:addOutfit(player:getSex() == 0 and 324 or 325, 0)
			player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 then
			if player:getItemCount(9733) >= 1 then
				player:removeItem( 9733, 1)
				player:setStorageValue( 20, 1)
				player:setStorageValue( 30, 22)
				player:setStorageValue(12014, 6) -- StorageValue for Questlog "Mission 03: Death to the Deathbringer"
				npcHandler:say("Impressive indeed! Someone with your skills will quickly raise in our ranks of helpers. You have great potential, and if you are upfor further missions, just ask for them. ", player)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 2 then
			player:setStorageValue( 30, 50)
			player:setStorageValue( 8, 2)
			player:setStorageValue(12020, 2) -- StorageValue for Questlog "Mission 09: Decision"
			npcHandler:say("I knew that you were smart enough to make the right decision! Your next mission will be a special one! ", player)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, "no") then
		if npcHandler.topic[cid] == 1 then
			player:setStorageValue( 21, 1)
			player:setStorageValue( 30, 22)
			player:setStorageValue(12014, 6) -- StorageValue for Questlog "Mission 03: Death to the Deathbringer"
			selfSay("Hm, no sign of any notes you say? That's odd - odd and a bit suspicious. I doubt you have tried hard enough. ...", cid)
			npcHandler:say("There are only a few chances to impress us. For those who please us great rewards are in store. If you fail though, you might lose more than you can imagine.", cid)
			npcHandler.topic[cid] = 0
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())