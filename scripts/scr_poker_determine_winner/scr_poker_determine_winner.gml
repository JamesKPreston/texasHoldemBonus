function scr_poker_determine_winner(){
	var playerHand = [];
	var community = [];
	var dealerHand = [];

	with(player_hand) {
		for(i =0; i < 2; i ++) 
		{
			playerHand[i] = scr_card_struct_from_index(hand[i]);
		}
	}
			
	with(dealer_hand) {
		for(i =0; i < 2; i ++) 
		{
			dealerHand[i] = scr_card_struct_from_index(hand[i]);
		}
	}
			
	with(flop_hand) {
		for(i =0; i < 3; i ++) 
		{
			community[i] = scr_card_struct_from_index(hand[i]);
		}
	}
			
	with(turn_hand) {
		for(i =0; i < 1; i ++) 
		{
			community[i + 3] = scr_card_struct_from_index(hand[i]);
		}
	}
			
	with(river_hand) {
		for(i =0; i < 1; i ++) 
		{
			community[i + 4] = scr_card_struct_from_index(hand[i]);
		}
	}
	// Run showdown
	var out = poker_showdown(playerHand, dealerHand, community);
	obj_game.player_hand_rank = out.hero.category;
	show_debug_message(out.message);
	with (obj_game) {
		showWinner(out.message, 10, c_yellow); // 1.5 seconds
	}			 
	if (out.result > 0) {
		obj_game.hand_winner = "PLAYER";
		obj_hand_player.best5 = out.hero.best5;
		obj_hand_flop.best5 = out.hero.best5;
		obj_hand_turn.best5 = out.hero.best5;
		obj_hand_river.best5 = out.hero.best5;
	} else if (out.result < 0) {
		// Dealer wins
		obj_game.hand_winner = "DEALER";
		obj_hand_dealer.best5 = out.dealer.best5;
		obj_hand_flop.best5 = out.dealer.best5;
		obj_hand_turn.best5 = out.dealer.best5;
		obj_hand_river.best5 = out.dealer.best5;
	} else {
		// Split pot
		obj_game.hand_winner = "TIE";
	}
	scr_payout();
	scr_show_winning_hand();
}