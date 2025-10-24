function scr_shuffle_deck(){
	randomize();
	var numShuffle = 100;
	
	if(deckCount == 0) {
		return;
	}
	
	for(var i = 0 ; i < numShuffle; i ++) {
		for(var c = 0; c < deckCount; c ++) {
			var temp_1 = irandom_range(0, deckCount - 1);
			if(deck[c] > 0 &&  deck[temp_1] > 0) {
				var temp_2 = deck[c];
				deck[c] = deck[temp_1];
				deck[temp_1] = temp_2;
			}
		}
	}
}