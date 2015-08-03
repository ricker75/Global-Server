function onUse(cid, item, fromPosition, itemEx, toPosition)
	local tapestry = 6434
	local mirror = 1847
	local blue_tapestry_pos_create = { x=32739, y=32392, z=14, stackpos=2}
	local blue_tapestry_pos = { x=32739, y=32393, z=14, stackpos=2}
	local remove_blue_tapestry = getThingfromPos(blue_tapestry_pos)
	if itemEx.actionid == 39511 and itemEx.itemid == tapestry then
		doRemoveItem(remove_blue_tapestry.uid,1)
		doCreateItem(6434,1,blue_tapestry_pos_create)
	end
	local cbtp = { x=32739, y=32393, z=14, stackpos=2}
	local rbtp = { x=32739, y=32392, z=14, stackpos=2}
	local rbt = getThingfromPos(rbtp)
	local pos = {x=32739, y=32392, z=13}
	if itemEx.actionid == 39512 and itemEx.itemid == mirror then
		local ek = doCreateItem(6434,1,cbtp)
		doSetItemActionId(ek, 10088)
		doRemoveItem(rbt.uid,1)
		doTeleportThing(cid, pos)
		doSendMagicEffect(getCreaturePosition(cid),10)
		doCreatureSay(cid, "Beauty has to be rewarded! Muahahaha!", TALKTYPE_ORANGE_1)
	end
end