

function Determine_winner() {
	var dealerHand = "";
	var playerHand = "";
	var communityHand = "";
	
	with(Hand_2) {
		switch(handType) {
			case "Dealer":
				dealerHand = self;
			break;
			case "Player":
				playerHand = self;
			break;
			case "Community":
				communityHand = self;
			break;
		}
	}
	
	var out = PokerEvaluator_2.poker_showdown(playerHand.Cards, dealerHand.Cards, communityHand.Cards);
	obj_winner_text.text_description  = out.message;
}
