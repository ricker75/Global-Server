local messageDalay = 60 -- 1 min
local saveLog = true
local options = {
	['y'] = {372111,'YES'},
	['n'] = {372112,'NO'},
}
function sendm(m)
	if getGlobalStorageValue(372199) == 1 then
		doBroadcastMessage(m,21)
		addEvent(sendm,messageDalay*1000,m)
	end
end
function saveLog(var)
	if not saveLog then return end
	local f = io.open('data/logs/quiz.txt','a+')
	if f then
		f:write(var)
		f:close()
	end
end
function onSay(cid, words, param, channel) ---Script by mock the bear
	local k = getGlobalStorageValue(372199)
	if words == '!poll' then
	if k == 1 then
	if getPlayerStorageValue(cid,372188) ~= getGlobalStorageValue(372188) then
	if options[param] then
	setGlobalStorageValue(options[param][1],getGlobalStorageValue(options[param][1])+1)
	doPlayerSendTextMessage(cid,25,'Thank by the vote')
	setPlayerStorageValue(cid,372188,getGlobalStorageValue(372188))
	else
		local op = ''
		for i,b in pairs(options) do
			op = op..i..', '
		end
		if op:sub(op:len()-1,op:len()) == ', ' then
			op = op:sub(1,op:len()-2)
		end
		doPlayerSendTextMessage(cid,25,'The options is: '..op)
	end
	else
		doPlayerSendTextMessage(cid,25,'You already voted.')
	end
	end
	elseif getPlayerGroupId(cid) >= 3 then
		if param == 'r' then
			local op = ''
			for i,b in pairs(options) do
				op = op..'['..getGlobalStorageValue(b[1])..'] votes to '..b[2]..'\n'
			end
			doBroadcastMessage('Result!\n'..op..'Poll #'..getGlobalStorageValue(372188)..'',21)
			setGlobalStorageValue(372199,-1)
			saveLog('Result at '..os.date("%d %B %Y %X ", os.time())..' Poll #'..getGlobalStorageValue(372188)..'\n'..op..'\n----------------------------\n')
		elseif param == 'c' then
			doBroadcastMessage('Poll canceled!')
			saveLog('Poll #'..os.time()..' canceled by '..getCreatureName(cid)..'\n----------------------------\n')
		else
			if getGlobalStorageValue(372199,1) ~= 1 then
				local op = ''
				for i,b in pairs(options) do
					op = op..'!poll '..i..' to '..b[2]..'\n'
					setGlobalStorageValue(b[1],0)
				end
				setGlobalStorageValue(372199,1)
				setGlobalStorageValue(372188,os.time())
				saveLog('Poll #'..os.time()..' stsrted by '..getCreatureName(cid)..' at '..os.date("%d %B %Y %X ", os.time())..'\n'..param..'\n')
				sendm('Poll started!\n'..param..'\nSay:\n'..op..'\nPoll #'..os.time()..'')
			else
				doPlayerSendTextMessage(cid,25,'Already is a poll running. Say [/pmanage r] to results and [/pmanage c] to cancel.')
			end
		end
	end
	return true
end