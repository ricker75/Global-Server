function onSay(cid, words, param)
	vipsystem_info = {
		name = "Entera's VIP system.",
		author = "Zbizu",
		version = "1.0",
	}

	vip_config = {
		log_opearations = true, -- logs date, IP integer and player name to make sure explainations of its user are truth if something go wrong, ignores players commands
		log_file = "vip_log.txt"
	}

	local daycounter = (math.floor((getVipByAccount(getPlayerAccount(cid))-os.time())/86400, 0) + 1)
	if getPlayerAccess(cid) > 0 then
		adm_info = "\nYou have special access which allows you to manage players viptime.\n\nAvailable params: see, add, reset\nsee - views player's viptime\nadd - adds player's viptime\nreset - makes player's viptime expired immediately\n\nUsage: "..words.." \"param, playername, time, reason"
	else
		adm_info = ""
		adm_info = ""
	end

	if param == "" or getPlayerAccess(cid) == 0 then
		if (daycounter)*(-1) == 1 then s = "" else s = "s" end
		local ret_ = getPlayerVip(cid)
		if ret_ == 0 then
			doPlayerPopupFYI(cid,"You don't have any vip time."..adm_info)
			return false
		else
			if getPlayerVipTime(cid) == 0 then
				if (daycounter)*(-1) == 0 then
					doPlayerPopupFYI(cid, "You don't have any vip time.\nYour vip expired in " .. os.date("%d %B %Y %X ",ret_) .. "(today)."..adm_info)
					return false
				else
					doPlayerPopupFYI(cid, "You don't have any vip time.\nYour vip expired in " .. os.date("%d %B %Y %X ",ret_) .. "(" .. (daycounter)*(-1) .. " day".. s .." ago)."..adm_info)
					return false
				end
			else
				doPlayerPopupFYI(cid, "Your vip status ends in " .. os.date("%d %B %Y %X",ret_) .. ".\nYou have: " .. math.floor((getPlayerVipTime(cid)/(60*60*24))+0.5) .. " days left."..adm_info)
				return false
			end
		end
	else
		if vip_config.log_opearations then
			file = io.open(vip_config.log_file, "a+")
			file:write(os.date("[%x %X]", os.time()).."[IP: "..getPlayerIp(cid).."]["..getPlayerName(cid).."]: ".. words .." \"".. param .."\n")
			file:close()
		end
		local t = param:split(",")
		t[2] = t[2]:gsub("^%s*(.-)$", "%1")
		t[3] = t[3]:gsub("^%s*(.-)$", "%1")
		t[4] = t[4]:gsub("^%s*(.-)$", "%1")
		local actions = {["see"] = 1, ["add"] = 2, ["reset"] = 3}
		local gen = {[0] = "She", [1] = "He", [2] = "This user"}
		if actions[t[1]] == nil then
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Incorrect action specified.")
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "To see usage manual type "..words.." without params.")
			return false
		else
			local pid = getPlayerByName(t[2])
			reason_text = t[4]
			if reason_text ~= nil then
				if(t[5] ~= nil) then
					for j = 5, #t do
						reason_text = reason_text .. ", " .. t[j]
					end
				end
			else
				reason_text = ""
			end
			if reason_text == "" then vip_comment = "" else vip_comment = "Reason: "..reason_text end
			if pid then
				if actions[t[1]] == 1 then
					if getPlayerVip(pid) == 0 then
						doPlayerPopupFYI(cid, getPlayerName(pid).."'s account never had any vip time.")
					else
						doPlayerPopupFYI(cid, getPlayerName(pid).."'s vip time expiration date:\n" .. os.date("%d %B %Y %X",getPlayerVip(pid)) .. "\n".. gen[getPlayerSex(pid)] .. " has ".. (getPlayerVipTime(pid)) .. " left.")
					end
					return false
				elseif actions[t[1]] == 2 then
					if tonumber(t[3]) ~= nil then
						if tonumber(t[3]) == 0 then
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, getPlayerName(pid).."'s vip time wasn't changed.")
							return false
						else
							if tonumber(t[3]) > 0 then
								vip_action = "added to"
								vip_formula = tonumber(t[3])
							else
								vip_action = "removed from"
								vip_formula = tonumber(t[3]*(-1))
							end
							if vip_config.log_opearations then
								file = io.open(vip_config.log_file, "a+")
								file:write(os.date("Player had "..(getPlayerVipTime(pid)).." left\n"))
								file:close()
							end
							doPlayerAddVip(pid,tonumber(t[3]))
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, (vip_formula).." "..vip_action.." "..getPlayerName(pid).."'s account.")
							doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, gen[getPlayerSex(pid)] .. " has ".. (getPlayerVipTime(pid)) .. " now.")
							if vip_comment ~= "" then doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, vip_comment) end
							doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, (vip_formula).." "..vip_action.." your account.")
							doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "You have ".. (getPlayerVipTime(pid)) .. " now.")
							if vip_comment ~= "" then doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, vip_comment) end
							return false
						end
					else
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Time must be a number.")
						doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "To see usage manual type "..words.." without params.")
					end
					return false
				elseif actions[t[1]] == 3 then
					if vip_config.log_opearations then
						file = io.open(vip_config.log_file, "a+")
						file:write(os.date("Player had "..(getPlayerVipTime(pid)).." left\n"))
						file:close()
					end
					doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, getPlayerName(pid).."'s vip status removed. ".. gen[getPlayerSex(pid)] .. " had "..(getPlayerVipTime(pid)).." left.")
					if vip_comment ~= "" then doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, vip_comment) end
					doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, "Your vip status has been removed.")
					if vip_comment ~= "" then doPlayerSendTextMessage(pid, MESSAGE_STATUS_CONSOLE_BLUE, vip_comment) end
					setPlayerVip(pid,0)
					return false
				end
			else
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Player not found.")
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "To see usage manual type "..words.." without params.")
				return false
			end
		end
	end
	return true
end