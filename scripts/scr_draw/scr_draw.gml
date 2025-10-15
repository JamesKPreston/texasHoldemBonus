function scr_draw(){
	var num = argument0;
	if(deckObj.deckCount - num < 0) {return;}
	
	if(handCount == maxHand) {return;}
	
	for(i = 0; i < num; i ++)
	{
		hand[handCount++] = deckObj.deck[--deckObj.deckCount];
		deckObj.deck[deckObj.deckCount] = 0;
		var cardObj = noone;
		switch(handType)
		{
			case "DEALER":
				cardObj = obj_card_dealer;
			break;
			case "PLAYER":
				cardObj = obj_card_player;
			break;
			case "FLOP":
				cardObj = obj_card_flop;
			break;
			case "TURN":
				cardObj = obj_card_turn;
			break;
			case "RIVER":
				cardObj = obj_card_river;
			break;
		}
		
		if(cardObj != noone) {
			handCard[handCount - 1] = instance_create_depth(deckObj.deck_x, deckObj.deck_y, -handCount -2, cardObj);
		}
		
		
		with(handCard[handCount - 1]) {
			card_drawn = true;
			hand_position = player.handCount -1;
			cardNum = player.hand[hand_position];
		}
	}
}