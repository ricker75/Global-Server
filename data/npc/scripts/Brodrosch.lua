local keywordHandler = KeywordHandler:new()
        local npcHandler = NpcHandler:new(keywordHandler)
	
        NpcSystem.parseParameters(npcHandler)
        
        
        
        -- OTServ event handling functions start
        function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
        function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
        function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
        function onThink() 						npcHandler:onThink() end
        -- OTServ event handling functions end
        
        
        -- Don't forget npcHandler = npcHandler in the parameters. It is required for all StdModule functions!
        local travelNode = keywordHandler:addKeyword({'cormaya'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Cormaya for 160 gold coins?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost =160, destination = {x=33311, y=31989, z=15} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})
			
		local travelNode = keywordHandler:addKeyword({'farmine'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = 'Do you seek a ride to Farmine for 210 gold coins?'})
        	travelNode:addChildKeyword({'yes'}, StdModule.travel, {npcHandler = npcHandler, premium = true, level = 0, cost =210, destination = {x=33025, y=31553, z=10} })
        	travelNode:addChildKeyword({'no'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, reset = true, text = 'You shouldn\'t miss the experience.'})



function creatureSayCallback(cid, type, msg)
        if(not npcHandler:isFocused(cid)) then
                return false
        end
        
    
	-- WAGON TICKET
	if(msgcontains(msg, "ticket")) then
		if(getPlayerStorageValue(cid, 1131) < os.time()) then
			npcHandler:say("Do you want to purchase a weekly wagon ticket for 250 gold?", cid)
			npcHandler.topic[cid] = 1
		end
	elseif(msgcontains(msg, "yes")) then
		if(npcHandler.topic[cid] == 1) then
			if(getPlayerMoney(cid) >= 250) then
				doPlayerRemoveMoney(cid, 250)
				setPlayerStorageValue(cid, 1131, os.time() + 7 * 24 * 60 * 60 * 1000)
				npcHandler:say("Thank you for purchasing a wagon ticket.", cid)
			else
				npcHandler:say("You don't have enought money.", cid)
			end
			npcHandler.topic[cid] = 0
		end
	elseif(npcHandler.topic[cid] == 1) then 
		if(msgcontains(msg, "no")) then 
			npcHandler:say("No then.", cid)	
			npcHandler.topic[cid] = 0
		end
	-- WAGON TICKET
	end
        return true
end
       

  
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())