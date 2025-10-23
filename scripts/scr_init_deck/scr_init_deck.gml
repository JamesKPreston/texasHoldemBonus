function scr_init_deck(){
	scr_init_sprite_array();
	deckPoint = 0;
	deckCount = 52;
	for(i = 0; i < 52; i ++) {
		deck[i] = i;
	}
}