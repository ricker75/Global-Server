local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

function creatureSayCallback(cid, type, msg)
	local player = Player(cid)
	if not npcHandler:isFocused(cid) then
		return false
	elseif msgcontains(msg, "mission") then
		if player:getStorageValue(9990) < 1 then
			npcHandler:say('Hmm. You could be of assistance, I presume. I need several body parts. I will reward you adequately. Interested?', cid)
			player:setStorageValue( 9990, 1)
			npcHandler.topic[cid] = 1
		elseif player:getStorageValue(9991) == 1 and player:getStorageValue(9992) < 1 then
			npcHandler:say('Ah hello, young friend! Did you bring me two ghoul snacks as requested?', cid)
			npcHandler.topic[cid] = 2
		elseif player:getStorageValue(9992) == 1 and player:getStorageValue(9993) < 1 then
			npcHandler:say('Ah, young friend, I found a solution! Find me two {demonic skeletal hands}. That should do it. Now run along! Ask me for {mission} when you\'re done.', cid)
			player:setStorageValue(9993, 1)
			player:setStorageValue(92581, 1) -- quest log
		elseif player:getStorageValue(9993) == 1 and player:getStorageValue(9994) < 1 then
			npcHandler:say('Ah hello again! You look as if you could, er, lend me a hand or two? Yes?', cid)
			npcHandler.topic[cid] = 3
		elseif player:getStorageValue(9994) == 1 and player:getStorageValue(9995) < 1 then
			player:setStorageValue(9995, 1)
			player:setStorageValue(92582, 1) -- quest log
			selfSay("I need my heart back. I know where they have hidden it. Too afraid to destroy my beating heart, hah! ...", cid)
			selfSay("It is in a dusty amphora in a sealed mass grave in the downmost cellar of my ancient home. The ruins lie to the north at the beach. ...", cid)
			npcHandler:say("Crash the amphoras to find my heart, and bring it to me.", cid)
		elseif player:getStorageValue(9996) == 1 and player:getStorageValue(9997) < 1 then
			selfSay("Yes? You have it? You what? Not in the amphoras? You picked it off someone else?!? ...", cid)
			npcHandler:say("Well, the important thing is that you have it. Let's see if it's still in good shape. {Give} it to me.", cid)
			npcHandler.topic[cid] = 4
		elseif player:getStorageValue(9997) == 1 and player:getStorageValue(9998) < 1 then
			player:setStorageValue(9998, 1)
			player:setStorageValue(92583, 1) -- quest log
			selfSay("I will need brains - don't laugh! Ahem. I will need a stimulated brain, to be precise. ...", cid) 
			npcHandler:say("Use two half-eaten brains with the Brain Heater Machine in the Necromancer halls and bring me the fused, stimulated brain. Now go!", cid)
		elseif player:getStorageValue(9999) == 1 and player:getStorageValue(9950) < 1 then
			npcHandler:say('Yes, yes, hello. Tell me if you lost something. If not, do you have that stimulated brain with you?', cid)
			npcHandler.topic[cid] = 5
		elseif player:getStorageValue(9950) == 1 and player:getStorageValue(9951) < 1 then
			player:setStorageValue(9951, 1)
			player:setStorageValue(92584, 1) -- quest log
			player:addItem(21402,1)
			selfSay("Now that you have shown you've got the brains, I need you to show initiative. ...", cid) 
			npcHandler:say("I will need something that can be adequately used as intestines. Something alive. Stuff it into this storage flask and return it to me!", cid)
		elseif player:getStorageValue(9952) == 1 and player:getStorageValue(9953) < 1 then
			npcHandler:say('Hello, hello. Let\'s come to the point - did you find me some intestines?', cid)
			npcHandler.topic[cid] = 6
		elseif player:getStorageValue(9953) == 1 and player:getStorageValue(9954) < 1 then
			selfSay("Good. As you may have gathered, the body parts you brought need to be assembled to form a whole body. ...", cid)
			selfSay("This will happen through a necromantic ritual that we - or rather, you - now have to prepare. ...", cid)
			selfSay("In a first step, it will involve retrieving specific artefacts of dark magic and hallowing the altars of the dark powers with them. ...", cid)
			selfSay("After that, you will have to speak an ancient incantation to animate the body and fuse my soul within. ...", cid)
			npcHandler:say("But first things first. Are you ready to {undertake} the hallowing of the five altars?", cid)
			npcHandler.topic[cid] = 7
		elseif player:getStorageValue(9955) == 1 and player:getStorageValue(9956) < 1 then
			npcHandler:say('Ah hello! Well done there, I felt the old powers settling down. Now, {ready} to hallow the next altar?', cid)
			player:setStorageValue(9956, 1)
			player:setStorageValue(92585,2) -- quest log
		elseif player:getStorageValue(9956) == 1 and player:getStorageValue(9957) < 1 then
			selfSay("I expected no less. Next is the Bonemarrow Altar, where the Dark Lord feasts upon the hallowed bones of...err. ...", cid) 
			selfSay("Ahem. Just take a yellowed bone or big bone, and hallow it - you don't know how? ...", cid) 
			selfSay("Huh. To HALLOW a yellowed bone, use it with one of the hallowed bonepiles in the Gardens Of Night. There are always bones around there - or were, in my days. ...", cid)
			npcHandler:say("Then, place the hallowed bone on the firebasin of the Bonemarrow Altar so the Dark Lord can consume it and grants us his power. Return to me after that.", cid)
			player:setStorageValue(9957, 1)
			player:setStorageValue(92586,1) -- quest log
		elseif player:getStorageValue(9957) == 1 and player:getStorageValue(9958) < 1 then
			selfSay("Are you still here? Come on, let's not laze about, go to the Gardens of Night - where? ...", cid)
			selfSay("East of the Necromancer Halls, you can't miss it, just look for a lot of dark and white sand, dried trees, and priestesses! ...", cid) 
			npcHandler:say("Or got a {problem} with finding bones? Hah!", cid)
			npcHandler.topic[cid] = 8
		elseif player:getStorageValue(9960) == 1 and player:getStorageValue(9961) < 1 then
			selfSay("Ah, welcome, welcome! I felt that one! The Dark Lord is pleased with the gift you brought, so now we can proceed with everything as planned. ...", cid)
			npcHandler:say("If it had gone wrong though, he would have had your guts for gart... er... well, here you are, so - ready to get some {blood} flowing?", cid)
			player:setStorageValue(9961, 1)
		elseif player:getStorageValue(9961) == 1 and player:getStorageValue(9962) < 1 then
			selfSay("Yes, I said blood. Important ingredient in necromantic rituals, usually. ...", cid) 
			npcHandler:say("You need to spill some vials of blood tincture for this task. Probably means killing blood priests to get those vials. Ready to do this?", cid)
			player:setStorageValue(9962, 1)
			player:setStorageValue(92586,2) -- quest log
		elseif player:getStorageValue(9965) == 1 and player:getStorageValue(9966) < 1 then
			player:setStorageValue(9966, 1)
			player:setStorageValue(92587,2) -- quest log
			selfSay("Ah, it is invigorating to fell the dark flows, rushing through Drefia, once again! Capital. This has earned you a reward. ...", cid) 
			npcHandler:say("Now, the next mission awaits, {yes}?", cid)
			npcHandler.topic[cid] = 9
		elseif player:getStorageValue(9969) == 1 and player:getStorageValue(9970) < 1 then
			selfSay("Ah, finally. Exceptional! Don't you feel the earth awakening to our call? No? Oh. ...", cid)  
			npcHandler:say("Anyway, you succeeded in hallowing the Fireglass Altar! Only one altar remains to be hallowed! Shall we {proceed}?", cid)
			player:setStorageValue(9970, 1)
			player:setStorageValue(92588,2) -- quest log
		elseif player:getStorageValue(9975) == 1 and player:getStorageValue(9976) < 1 then
			player:setStorageValue(9976, 1)
			player:setStorageValue(92589,2) -- quest log
			selfSay("Yes! YES! I have felt that! The altars are alive again! Well done! ...", cid) 
			npcHandler:say("We are close now. Only one important thing remains: the incantation itself. We need the {scroll} for that.", cid)
		elseif player:getStorageValue(9988) == 1 and player:getStorageValue(9989) < 1 then
			npcHandler:say('Yes? Do you have the scroll piece? ', cid)
			npcHandler.topic[cid] = 11
		elseif player:getStorageValue(9989) == 1 and player:getStorageValue(9920) < 1 then
			selfSay("Hah, developed a taste for it, have you? I believe the next scroll piece was hidden somewhere, my old friend being of a somewhat distrustful nature. ...", cid) 
			selfSay("The scent may not be lost, though - ask a shadow pupil if he can help - but be careful. ...", cid)
			npcHandler:say("Those shadow pupils are - strange. Try to find one who will answer and not kill you!", cid)
			player:setStorageValue(9920, 1)
		elseif player:getStorageValue(9926) == 1 and player:getStorageValue(9927) < 1 then
			npcHandler:say('Ah, hello! I take it you have the next scroll piece for me, {yes}?', cid)
			npcHandler.topic[cid] = 12
		elseif player:getStorageValue(9927) == 1 and player:getStorageValue(9928) < 1 then
			selfSay("Good! As you can imagine, I had a scroll piece, too. I hid it in my old quarters, northwest of the library. ...", cid)
			selfSay("The door is magically sealed. Use this copper key with it to get inside. ...", cid)
			npcHandler:say("Beneath one of the chests is a secret stash, under a loose stone tile. The scroll piece should be inside. Off you go.", cid)
			player:addItem(21489, 1)
			player:setStorageValue(9928, 1)
		elseif player:getStorageValue(9933) == 1 and player:getStorageValue(9934) < 1 then
			npcHandler:say('Hello - what? You have the {scroll} piece, you say?', cid)
			npcHandler.topic[cid] = 13
		elseif player:getStorageValue(9934) == 1 and player:getStorageValue(9935) < 1 then
			player:addItem(21464, 1)
			player:setStorageValue(9935, 1)
			selfSay("Hahah, eager for it, I like that! ...", "One piece stayed in the hands of a beautiful priestess. ...", cid) 
			selfSay("As they never throw anything away that looks like an incantation - you get my drift. Find out where they still keep it! ...", cid) 
			npcHandler:say("Oh, one more thing! They only talk to you when you look like a fellow summoner. It's dangerous to go without a cape. Use this.", cid)
		elseif player:getStorageValue(9944) == 1 then
			npcHandler:say('Hello, young apprentice. Do you have that scroll piece from the priestess?', cid)
			player:addItem(21464, 1)
			npcHandler.topic[cid] = 14
		elseif player:getStorageValue(9941) == 1 and player:getStorageValue(9942) < 1 then
			selfSay("That's the spirit! Speaking of which, you will have to look for a White Shade ...", cid)
			selfSay("That's a ghost, in case you don't know. Goes by name of... Zarifan, if I recall correctly. ...", cid) 
			selfSay("His grave is somewhere to the south, somewhere deeper. And he only reacts to magic words. ...", cid)
			selfSay("Err... it's embarrassing... the magic words are <mumble> <mumble> <ahem> ...", cid) 
			selfSay("'Friendship lives forever.' Silly, really. Untrue, as well. ...", cid)
			npcHandler:say("Anyway, say those three words - don't make me repeat them - and the old softie will tell you where the scroll is. Pathetic.", cid)
			player:addItem(21464, 1)
			player:setStorageValue(9942, 1)
		elseif player:getStorageValue(12903) == 1 then
			npcHandler:say('Welcome, welcome! Finally! The last scroll piece.... you do have it, haven\'t you?', cid)
			npcHandler.topic[cid] = 15
		elseif player:getStorageValue(12905) == 1 then
			npcHandler:say('Don\'t keep me waiting. The last scroll piece - were you able to {restore} it?', cid)
			npcHandler.topic[cid] = 16
		elseif player:getStorageValue(12908) == 1 and player:getStorageValue(12909) < 1 then
			selfSay("It failed! IT FAILED! WHY? What have you done! This must be your fault! ...", cid)  
			selfSay("You... did... that was a recipe for chicken soup! No wonder the scroll failed! Now... all is lost ...", cid)  
			selfSay("<sobs drily> I never want to see you again! You and your dirty gravedigger hands! Take this, you ungrateful, useless, imbecile... human! ...", cid)  
			npcHandler:say("Now... get out! And never, ever, dare come back! You ruined EVERYTHING!", cid) 
			player:setStorageValue(12909, 1)
			player:setStorageValue(92595, 2) -- quest log
			player:addItem(21452, 1)
		end
	elseif msgcontains(msg, "yes") then
		if npcHandler.topic[cid] == 1 and player:getStorageValue(9990) == 1 then
			player:setStorageValue( 9991, 1)
			player:setStorageValue( 92580, 1) -- quest log
			selfSay("Very sensible of you. I will pay you handsomely for your help. ...", cid)  
			selfSay("All you have to do is fetch diverse fresh body parts and then prepare the resurrection ritual. Nothing out of the ordinary. ...", cid)  
			npcHandler:say("First, I need two arms. Ghouls usually carry some as a snack. Two ghoul snacks should not be hard to get! Return when you have them.", cid) 
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 2 and player:getStorageValue(9991) == 1 then
			if player:removeItem(12423, 2) then
				player:setStorageValue( 9992, 1)
				player:setStorageValue( 92580, 2) -- quest log
				npcHandler:say('Splendid! What? They\'re half gnawed! There are no hands! Hrmmm. Let me think of a solution. Ask me for a new {mission}.', cid)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say('You don\'t have two ghoul snacks.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 3 and player:getStorageValue(9993) == 1 then
			if player:removeItem(10564, 2) then
				npcHandler:say('Yes. Those will be adequate. Talk to me again if you want to continue with your next {mission}.', cid)
				player:setStorageValue(9994, 1)
				player:setStorageValue(92581, 2) -- quest log
				npcHandler.topic[cid] = 0
			else
				npcHandler:say('You don\'t have two demonic skeletal hands.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 4 and player:getStorageValue(9996) == 1 then
			if player:removeItem(21394, 1) then
				npcHandler:say('Ah... <sighs> Very good. Just say the word when you are ready for the next {mission}.', cid)
				player:setStorageValue(9997, 1)
				player:setStorageValue(92582, 2) -- quest log
				npcHandler.topic[cid] = 0
			else
				npcHandler:say('You don\'t have my heart.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 5 and player:getStorageValue(9999) == 1 then
			if player:removeItem(21395, 1) then
				npcHandler:say('Ah... <sighs> Very good. Just say the word when you are ready for the next {mission}.', cid)
				player:setStorageValue(9950, 1)
				player:setStorageValue(92583, 2) -- quest log
				npcHandler.topic[cid] = 0
			else
				npcHandler:say('You don\'t have the brain.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 6 and player:getStorageValue(9952) == 1 then
			if player:removeItem(21403, 1) then
				player:setStorageValue(9953, 1)
				player:setStorageValue(92584, 2) -- quest log
				selfSay("Ah... interesting. A snake? Not bad, not bad at all. ...", cid) 
				npcHandler:say("Right. Now, we need to waken the old powers through ritual. Let me know when you are ready for this {mission}.", cid)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say('You don\'t have my intestine.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif player:getStorageValue(9962) == 1 and player:getStorageValue(9963) < 1 then
			selfSay("Ah, I knew you were a sturdy fellow! Necromancer material if ever I saw one! ...", cid)
			selfSay("Well then, the next task is to anoint the Bloodgong Altar. This will animate the dark flows we need for the ritual. ...", cid)
			selfSay("You need to spill a vial of blood tincture on each of the four sacrifical stones of the altar in order to anoint them. ...", cid)
			npcHandler:say("Then, toll the Bloodgong north of the sacrificial stones to set the dark flows going. Return to me after that.", cid)
			player:setStorageValue(9963, 1)
			player:setStorageValue(92587, 1) -- quest log
		elseif npcHandler.topic[cid] == 9 and player:getStorageValue(9966) == 1 and player:getStorageValue(9967) < 1 then
			selfSay("Excellent. To bind the earthly powers, we, I mean you, must worship at the Fireglass Altar. ...", cid)
			selfSay("This means scattering sacred ashes from the Ember Chamber on the sacrificial stones of the Fireglass Altar. ...", cid)
			selfSay("To gather the sacred ashes, you have to use magic chalk with the Shadow Fire in the Ember Chamber. ...", cid) 
			npcHandler:say("Gather the resulting ashes from the Shadow Hearth, and scatter them on the Fireglass Altar's sacrificial stones. Then return here.", cid)
			player:setStorageValue(9967, 1)
			player:setStorageValue(92588, 1) -- quest log
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 10 and player:getStorageValue(9976) == 1 and player:getStorageValue(9977) < 1 then
			player:setStorageValue(9977, 1)
			player:setStorageValue(92590, 1) -- quest log
			selfSay("Superb! You won't regret this. I will reward you beyond your wildest dreams! ...", cid)
			selfSay("I know that one of my former friends joined the blood priests later on. He made it quite high before he was ritually killed. ...", cid) 
			npcHandler:say("Go find a blood priest you can talk to. Ask him, but subtly. And never tell anyone what the scroll does!", cid)
			npcHandler.topic[cid] = 0
		elseif npcHandler.topic[cid] == 11 and player:getStorageValue(9988) == 1 then
			if player:removeItem(21250, 1) then
				npcHandler:say('This is it! This is it! Well done, well done! And now, on to the {next} scroll piece, {yes}? ', cid)
				player:setStorageValue(9989, 1)
				player:setStorageValue(92590, 2) -- quest log
				npcHandler.topic[cid] = 0
			else
				npcHandler:say('You don\'t have my scroll.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif player:getStorageValue(9989) == 1 and player:getStorageValue(9920) < 1 then
			selfSay("Hah, developed a taste for it, have you? I believe the next scroll piece was hidden somewhere, my old friend being of a somewhat distrustful nature. ...", cid) 
			npcHandler:say("The scent may not be lost, though - ask a shadow pupil if he can help - but be careful. ...", "Those shadow pupils are - strange. Try to find one who will answer and not kill you!", cid)
			player:setStorageValue(9920, 1)
			player:setStorageValue(92591, 1) -- quest log
		elseif npcHandler.topic[cid] == 12 and player:getStorageValue(9926) == 1 then
			if player:removeItem(21250, 1) then
				npcHandler:say('Indeed it is! The second scroll piece! Splendid! Here you go - for your trouble. And now, on to the {next} scroll piece, {yes}? ', cid)
				player:setStorageValue(9927, 1)
				player:setStorageValue(92591, 2) -- quest log
				npcHandler.topic[cid] = 0
			else
				npcHandler:say('You don\'t have my scroll.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif player:getStorageValue(9927) == 1 and player:getStorageValue(9928) < 1 then
			selfSay("Good! As you can imagine, I had a scroll piece, too. I hid it in my old quarters, northwest of the library. ...", cid)
			selfSay("The door is magically sealed. Use this copper key with it to get inside. ...", cid)
			npcHandler:say("Beneath one of the chests is a secret stash, under a loose stone tile. The scroll piece should be inside. Off you go.", cid)
			player:addItem(21489, 1)
			player:setStorageValue(9928, 1)
			player:setStorageValue(92592, 1) -- quest log
		elseif npcHandler.topic[cid] == 13 and player:getStorageValue(9933) == 1 and player:getStorageValue(9934) < 1 then
			if player:removeItem(21250, 1) then
				player:setStorageValue(9934, 1)
				player:setStorageValue(92592, 2) -- quest log
				selfSay("Oh, praise the Dark Lord! It is my scroll piece! Give it here! You can have this instead. ...", cid)
				npcHandler:say("Ahh, that feels GOOD. Now, only two pieces left to hunt down! On to the {next} scroll piece, yes?", cid)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say('You don\'t have my scroll.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif player:getStorageValue(9934) == 1 and player:getStorageValue(9935) < 1 then
			player:addItem(21464, 1)
			player:setStorageValue(9935, 1)
			player:setStorageValue(92593, 1) -- quest log
			selfSay("Hahah, eager for it, I like that! ...", "One piece stayed in the hands of a beautiful priestess. ...", cid)
			selfSay("As they never throw anything away that looks like an incantation - you get my drift. Find out where they still keep it! ...", cid)
			npcHandler:say("Oh, one more thing! They only talk to you when you look like a fellow summoner. It's dangerous to go without a cape. Use this.", cid)
		elseif npcHandler.topic[cid] == 14 and player:getStorageValue(9944) == 1 and player:getStorageValue(12900) < 1 then
			if player:removeItem(21250, 1) then
				player:setStorageValue(12900, 1) -- exaust time
				player:setStorageValue(9944, 2) -- exaust time
				player:setStorageValue(92593, 2) -- quest log
				selfSay("Ahhh, capital, capital. Good girl for keeping it for me. I'll take back my cape now, thank you. ...", cid)
				npcHandler:say("Now - the final part of the scroll! Ready to go retrieve it?", cid)
			else
				npcHandler:say('You don\'t have my scroll.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif player:getStorageValue(12900) == 1 and player:getStorageValue(12901) < 1 then
			selfSay("That's the spirit! Speaking of which, you will have to look for a White Shade ...", cid)
			selfSay("That's a ghost, in case you don't know. Goes by name of... Zarifan, if I recall correctly. ...", cid)
			selfSay("His grave is somewhere to the south, somewhere deeper. And he only reacts to magic words. ...", cid)
			selfSay("Err... it's embarrassing... the magic words are <mumble> <mumble> <ahem> ...", cid)
			selfSay("'Friendship lives forever.' Silly, really. Untrue, as well. ...", cid) 
			npcHandler:say("Anyway, say those three words - don't make me repeat them - and the old softie will tell you where the scroll is. Pathetic.", cid)
			player:setStorageValue(92594, 1) -- quest log
			player:setStorageValue(12901, 1)
		elseif npcHandler.topic[cid] == 15 and player:getStorageValue(12903) == 1 and player:getStorageValue(12904) < 1 then
			if player:removeItem(21250, 1) then
				player:setStorageValue(12904, 1)
				player:setStorageValue(12903, 2)
				player:setStorageValue(92594, 2) -- quest log
				selfSay("I am so excited! Finally, we - wait. What is this? That... is not the complete scroll piece. ...", cid) 
				selfSay("I don't care what you say! This is a disaster! We need a complete scr - wait. I have an idea. ...", cid) 
				selfSay("There must be a copy or something in my old library. something to use with the scroll, to find the missing words. ...", cid) 
				npcHandler:say("There must be. Go look there. Next to the fiveserrated room, a small library. Go go go!", cid)
			else
				npcHandler:say('You don\'t have my scroll.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif npcHandler.topic[cid] == 17 and player:getStorageValue(12906) == 1 and player:getStorageValue(12907) < 1 then
			selfSay("Then let's go. Take my skull and the incantation scroll to the working station in the fiveserrated room ...", cid) 
			selfSay("Where the lava flows and the southern legs of the room meet. Place the Skull on the sacrificial stone and use the scroll ...", cid) 
			npcHandler:say("AND I shall be made whole, and YOU shall be RICH!", cid)
			player:setStorageValue(12907, 1)
			player:setStorageValue(92595, 1)
			player:addItem(21251, 1)
			player:addItem(21476, 1)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'demonic skeletal hands') or msgcontains(msg, 'demonic skeletal hand') then
		npcHandler:say('What? Hack some off from a demon skeleton, of course! Now get moving.', cid)
	elseif msgcontains(msg, 'give') and npcHandler.topic[cid] == 4 and player:getStorageValue(9996) == 1 then
		if player:removeItem(21394, 1) then
			npcHandler:say('Ah... <sighs> Very good. Just say the word when you are ready for the next {mission}.', cid)
			player:setStorageValue(9997, 1)
			npcHandler.topic[cid] = 0
		else
			npcHandler:say('You don\'t have my heart.', cid)
			npcHandler.topic[cid] = 0
		end
	elseif msgcontains(msg, 'undertake') and player:getStorageValue(9953) == 1 and npcHandler.topic[cid] == 7  then
		selfSay("Good! Let's not waste time. The first altar you must hallow is the Dragonsoul Altar, at the eastern side of the room. ...", cid) 
		selfSay("To hallow it, dig out three dragon tears and place them on the altar to appease the dark powers. ...", cid) 
		npcHandler:say("What? Oh, you'll find some dragon tears near dragon skulls... where? ...", "In the Dragonbone Cemetery, OBVIOUSLY! Must I explain EVERYTHING to you? Now go!", cid)
		player:setStorageValue( 9954,1)
		player:setStorageValue( 92585,1) -- quest log
		player:addItem(21401,3)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'ready') and player:getStorageValue(9956) == 1 and player:getStorageValue(9957) < 1 then
		selfSay("I expected no less. Next is the Bonemarrow Altar, where the Dark Lord feasts upon the hallowed bones of...err. ...", cid)
		selfSay("Ahem. Just take a yellowed bone or big bone, and hallow it - you don't know how? ...", cid)
		selfSay("Huh. To HALLOW a yellowed bone, use it with one of the hallowed bonepiles in the Gardens Of Night. There are always bones around there - or were, in my days. ...", cid)
		npcHandler:say("Then, place the hallowed bone on the firebasin of the Bonemarrow Altar so the Dark Lord can consume it and grants us his power. Return to me after that.", cid)
		player:setStorageValue(9957, 1)
	elseif msgcontains(msg, 'problem') and player:getStorageValue(9957) == 1 and npcHandler.topic[cid] == 8 then
		npcHandler:say('What? No bones around you say? Hrmmm. Wait. Check the skull heap here - that\'s right - hah! There! Now get to work!', cid)
		player:setStorageValue(9958, 1)
		player:addItem(21407, 3)
		npcHandler.topic[cid] = 0
	elseif msgcontains(msg, 'blood') and player:getStorageValue(9961) == 1 and player:getStorageValue(9962) < 1 then
		selfSay("Yes, I said blood. Important ingredient in necromantic rituals, usually. ...", cid) 
		npcHandler:say("You need to spill some vials of blood tincture for this task. Probably means killing blood priests to get those vials. Ready to do this?", cid)
		player:setStorageValue(9962, 1)
	elseif msgcontains(msg, 'proceed') and player:getStorageValue(9970) == 1 and player:getStorageValue(9971) < 1 then
		player:setStorageValue(9971, 1)
		player:setStorageValue(92589,1) -- quest log
		player:addItem(21448, 1)
		player:addItem(21482, 1)
		selfSay("<reverential> The final altar that remains to be hallowed... the Shadowthrone. ...", cid) 
		selfSay("Only a candle made of human tallow placed before each shadow statue in the right order, will awaken it. ...", cid) 
		selfSay("I say, are you sick? Human tallow candles are a perfectly good tool - don't look at me like that! Be professional about this, will you? ...", cid) 
		selfSay("I have some candles hidden deep down in the lich caves, east of here. Here's the key that opens the trapdoor to the cache. ...", cid) 
		npcHandler:say("And take this parchment. Identify the right candles with it, take three with you and place one in front of the three shadowthrone statues, starting counterclockwise. Now go!", cid)
	elseif msgcontains(msg, 'scroll') then
		if player:getStorageValue(9976) == 1 and player:getStorageValue(9977) < 1 then
			selfSay("Well, it is a rather long story. The short version: I had friends - no need to snigger. ...", cid) 
			selfSay("We were five highly brilliant dark summoners. We joined our forces to find the scroll of Youth and Life Eternal. ...", cid) 
			selfSay("But when we finally found it after years of toiling and danger, we quarreled over who could have it. The scroll tore. ...", cid)
			npcHandler:say("We each retained one piece of the scroll. Well, that was a long time ago. ...", "But I think I have a clue where we can find the first piece of the scroll. Would you go looking?", cid)
			npcHandler.topic[cid] = 10
		elseif player:getStorageValue(9988) == 1 and player:getStorageValue(9989) < 1 then
			npcHandler:say('Yes? Do you have the scroll piece? ', cid)
			npcHandler.topic[cid] = 11
		elseif player:getStorageValue(9926) == 1 and player:getStorageValue(9927) < 1 then
			npcHandler:say('Ah, hello! I take it you have the next scroll piece for me, {yes}?', cid)
			npcHandler.topic[cid] = 12
		elseif npcHandler.topic[cid] == 13 and player:getStorageValue(9933) == 1 and player:getStorageValue(9934) < 1 then
			if player:removeItem(21250, 1) then
				player:setStorageValue(9934, 1)
				selfSay("Oh, praise the Dark Lord! It is my scroll piece! Give it here! You can have this instead. ...", cid) 
				npcHandler:say("Ahh, that feels GOOD. Now, only two pieces left to hunt down! On to the {next} scroll piece, yes?", cid)
				npcHandler.topic[cid] = 0
			else
				npcHandler:say('You don\'t have my scroll.', cid)
				npcHandler.topic[cid] = 0
			end
		elseif player:getStorageValue(9944) == 1 then
			npcHandler:say('Hello, young apprentice. Do you have that scroll piece from the priestess?', cid)
			player:addItem(21464, 1)
			npcHandler.topic[cid] = 14
		elseif player:getStorageValue(9944) == 1 and player:getStorageValue(9945) < 1 then
			npcHandler:say('Welcome, welcome! Finally! The last scroll piece.... you do have it, haven\'t you?', cid)
			npcHandler.topic[cid] = 15
		end
	elseif msgcontains(msg, 'next') then
		if player:getStorageValue(9989) == 1 and player:getStorageValue(9920) < 1 then
			selfSay("Hah, developed a taste for it, have you? I believe the next scroll piece was hidden somewhere, my old friend being of a somewhat distrustful nature. ...", cid) 
			npcHandler:say("The scent may not be lost, though - ask a shadow pupil if he can help - but be careful. ...", "Those shadow pupils are - strange. Try to find one who will answer and not kill you!", cid)
			player:setStorageValue(9920, 1)
		elseif player:getStorageValue(9927) == 1 and player:getStorageValue(9928) < 1 then
			selfSay("Good! As you can imagine, I had a scroll piece, too. I hid it in my old quarters, northwest of the library. ...", cid) 
			npcHandler:say("The door is magically sealed. Use this copper key with it to get inside. ...", "Beneath one of the chests is a secret stash, under a loose stone tile. The scroll piece should be inside. Off you go.", cid)
			player:addItem(21489, 1)
			player:setStorageValue(9928, 1)
		elseif player:getStorageValue(9934) == 1 and player:getStorageValue(9935) < 1 then
			player:addItem(21464, 1)
			player:setStorageValue(9935, 1)
			selfSay("Hahah, eager for it, I like that! ...", cid)
			selfSay("One piece stayed in the hands of a beautiful priestess. ...", cid) 
			selfSay("As they never throw anything away that looks like an incantation - you get my drift. Find out where they still keep it! ...", cid) 
			npcHandler:say("Oh, one more thing! They only talk to you when you look like a fellow summoner. It's dangerous to go without a cape. Use this.", cid)
		end
	elseif msgcontains(msg, 'restore') and player:getStorageValue(12905) == 1 and player:getStorageValue(12906) < 1 and npcHandler.topic[cid] == 16 then
		if player:removeItem(21474, 1) then
			selfSay("I knew it! I knew I had made a copy! Oh, I am so clever! ...", cid)
			selfSay("Now, watch this. <mumbles darkly> THERE. THE COMPLETE INCANTATION SCROLL. ...", cid)
			npcHandler:say("You have done well. Only one thing remains, and you shall be rich beyond your dreams. Ready for the really final task?", cid)
			player:setStorageValue(12906, 1)
			player:setStorageValue(12905, 2)
			player:setStorageValue(92594, 3) -- quest log
			npcHandler.topic[cid] = 17
		else
			npcHandler:say('You don\'t have my scroll.', cid)
			npcHandler.topic[cid] = 0		
		end
	end
	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())  