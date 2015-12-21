local condition = {}
for i = 1, 4 do
        table.insert(condition, createConditionObject(CONDITION_FIRE))
        addDamageCondition(condition[i], 1, 0, -(i == 1 and 20 or i==2 and 2 or i == 3 and 10 or i == 4 and 1))
        addDamageCondition(condition[i], isInArray({1,3},i)==TRUE and 7 or 2, 9000, -(isInArray({1,3},i)==TRUE and 10 or 1))
end

local fire = createConditionObject(CONDITION_FIRE) 
setConditionParam(fire, CONDITION_PARAM_DELAYED, 1) 
addDamageCondition(fire, 7, 4000, -10) 

function onStepIn(cid, item, position, fromPosition)
        if isPlayer(cid) == TRUE and getPlayerFlagValue(cid, PlayerFlag_CannotBeAttacked) == FALSE then
                return doRemoveCondition(cid, CONDITION_FIRE), doAddCondition(cid, isInArray({1487,1492},item.itemid) == TRUE and condition[getPlayerSlotItem(cid, CONST_SLOT_FEET).itemid == 9932 and 2 or 1] or condition[getPlayerSlotItem(cid, CONST_SLOT_FEET).itemid == 9932 and 4 or 3])
        elseif isMonster(cid) then
			if isInArray({1487,1492}, item.itemid) then 
				doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -20, -20, CONST_ME_HITBYFIRE) 
			else
				doTargetCombatHealth(0, cid, COMBAT_FIREDAMAGE, -10, -10, CONST_ME_HITBYFIRE) 
			end
			doAddCondition(cid, fire) 
		else
			doSendMagicEffect(position, CONST_ME_POFF)
        end
end