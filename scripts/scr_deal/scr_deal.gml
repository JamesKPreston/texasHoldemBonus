function scr_deal(){
	var num = argument0;
	if(deckCount - num < 0) {return;}
	
	if(obj_player_hand.handCount == MAXHAND) {return;}
	
	for(i = 0; i < num; i ++)
	{
		obj_player_hand.hand[obj_player_hand.handCount++] = deck[--deckCount];
		deck[deckCount] = 0;
	}
}