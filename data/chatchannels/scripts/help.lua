local CHANNEL_HELP = 7

local muted = createConditionObject(CONDITION_CHANNELMUTEDTICKS)
setConditionParam(muted, CONDITION_PARAM_SUBID, CHANNEL_HELP)
setConditionParam(muted, CONDITION_PARAM_TICKS, 30000)

local exhausted = createConditionObject(CONDITION_CHANNELMUTEDTICKS)
setConditionParam(exhausted, CONDITION_PARAM_SUBID, CHANNEL_HELP)
setConditionParam(exhausted, CONDITION_PARAM_TICKS, 30000)

function onSpeak(cid, type, message)
        local playerAccountType = Player(cid):getAccountType()
        if(Player(cid):getLevel() == 1 and playerAccountType == ACCOUNT_TYPE_NORMAL) then
                Player(cid):sendCancelMessage("You may not speak into channels as long as you are on level 1.")
                return false
        end

        if(getCreatureCondition(cid, CONDITION_CHANNELMUTEDTICKS, CHANNEL_HELP)) then
                Player(cid):sendCancelMessage("You may only ask a question once every 30 seconds.")
                return false
        end
       
        if(playerAccountType < ACCOUNT_TYPE_TUTOR) then   
        doAddCondition(cid, exhausted)
        end

        if(type == TALKTYPE_CHANNEL_Y) then
                if(playerAccountType >= ACCOUNT_TYPE_TUTOR or getPlayerFlagValue(cid, PlayerFlag_TalkOrangeHelpChannel)) then
                        type = TALKTYPE_CHANNEL_O
                end
        elseif(type == TALKTYPE_CHANNEL_O) then
                if(playerAccountType < ACCOUNT_TYPE_TUTOR and not getPlayerFlagValue(cid, PlayerFlag_TalkOrangeHelpChannel)) then
                        type = TALKTYPE_CHANNEL_Y
                end
        elseif(type == TALKTYPE_CHANNEL_R1) then
                if(playerAccountType < ACCOUNT_TYPE_GAMEMASTER and not getPlayerFlagValue(cid, PlayerFlag_CanTalkRedChannel)) then
                        if(playerAccountType >= ACCOUNT_TYPE_TUTOR or getPlayerFlagValue(cid, PlayerFlag_TalkOrangeHelpChannel)) then
                                type = TALKTYPE_CHANNEL_O
                        else
                                type = TALKTYPE_CHANNEL_Y
                        end
                end
        end
        return type
end