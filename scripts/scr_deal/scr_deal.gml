function scr_deal(){
	var num = argument0;
	if(deckCount - num < 0) {return;}
	
	if(handCount == MAXHAND) {return;}
	
	for(i = 0; i < num; i ++)
	{
		hand[handCount++] = deck[--deckCount];
		deck[deckCount] = 0;
		
		handCard[handCount - 1] = instance_create_depth(deck_x, deck_y, -handCount -2, obj_card);
		with(handCard[handCount - 1]) {
			card_drawn = true;
			hand_position = player.handCount -1;
			cardNum = player.hand[hand_position];
		}
	}
}