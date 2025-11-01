//This will be moved to a game controller
with(Hand_2) {
	var startIndex = 0;
	var endIndex = -1;
	if(handType == "Community") {
		switch(stage) {
			case eStage.HOLE:
				//show the flop
				startIndex = 0;
				endIndex = 2;
				//stage = eStage.FLOP;
				break;
			case eStage.FLOP:
				//show the turn
				startIndex = 3;
				endIndex = 3;
				break;
			case eStage.TURN:
				//show the River
				startIndex = 4;
				endIndex = 4;
				break;
		}
		
		for(i = startIndex; i <= endIndex; i ++) {
			Cards[i].FLIP();
		}
		
	}
	
	if(handType == "Dealer") {
		switch(stage) {
			case eStage.RIVER:
			for(i = 0; i <= 1; i ++) {
				Cards[i].FLIP();
			}
			break;
		}
	}
	
	stage++;

}