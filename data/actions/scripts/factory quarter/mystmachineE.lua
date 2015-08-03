function onUse(cid, item, frompos, item2, topos) 
       if item.actionid == 23701 then 
           queststatus = getPlayerStorageValue(cid,10251) 
           if queststatus == -1 and (getPlayerItemCount(cid,9690) >= 4) then 
               doPlayerSendTextMessage(cid,19,"You have inserted the gear wheels into the relais either to the left or to the right, now are calibrated the teleporter.") 
               doPlayerRemoveItem(cid, 9690, 4)
               setPlayerStorageValue(cid,10251,1) 
		doCreatureSay(cid, "*zzzzzzzzz*", TALKTYPE_ORANGE_1, nil, nil, {x=32869, y=31316, z=10})
		doCreatureSay(cid, "*zzzzzzzzz*", TALKTYPE_ORANGE_1, nil, nil, {x=32869, y=32318, z=10})
		doCreatureSay(cid, "*zzzzzzzzz*", TALKTYPE_ORANGE_1, nil, nil, {x=32869, y=32320, z=10})
		doCreatureSay(cid, "*zzzzzzzzz*", TALKTYPE_ORANGE_1, nil, nil, {x=32869, y=32322, z=10})
           else 
		doCreatureSay(cid, "*zzzzzzzzz*", TALKTYPE_ORANGE_1, nil, nil, {x=32869, y=31316, z=10})
		doCreatureSay(cid, "*zzzzzzzzz*", TALKTYPE_ORANGE_1, nil, nil, {x=32869, y=32318, z=10})
		doCreatureSay(cid, "*zzzzzzzzz*", TALKTYPE_ORANGE_1, nil, nil, {x=32869, y=32320, z=10})
		doCreatureSay(cid, "*zzzzzzzzz*", TALKTYPE_ORANGE_1, nil, nil, {x=32869, y=32322, z=10})
                doPlayerSendTextMessage(cid,19,"Access denied! Please insert 4 gear wheels into the relais either to the left or to the right, to calibrate the teleporter.") 
          	end 
	end
end