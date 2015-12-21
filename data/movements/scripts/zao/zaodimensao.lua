function onStepIn(cid, item, pos, fromPosition)
	if item.uid == 60093 then
			doSendMagicEffect(getCreaturePosition(cid), 10)
			doTeleportThing(cid, {x=32941,y=31593,z=8}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), 10)
	elseif item.uid == 60094 then
			doSendMagicEffect(getCreaturePosition(cid), 10)
			doTeleportThing(cid, {x=33142,y=31528,z=2}, FALSE)
			doSendMagicEffect(getCreaturePosition(cid), 10)
	end
	return TRUE
end