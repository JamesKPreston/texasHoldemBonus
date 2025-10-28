function scr_payout() {
	var debug = false;
	var playerHand = [];
	var dealerHand = [];
	with(obj_deck)
	{
		with(player_hand) {
			for(i =0; i < 2; i ++) 
			{
				playerHand[i] = Poker.CardStructFromIndex(hand[i]);
			}
		}
			
		with(dealer_hand) {
			for(i =0; i < 2; i ++) 
			{
				dealerHand[i] = Poker.CardStructFromIndex(hand[i]);
			}
		}
	
	}

	with(obj_game) 
	{
		//Did Player Win ?
		if(obj_game.hand_winner == "PLAYER" || debug) {
			if(obj_game.player_hand_rank >= 4 || debug) {
				ante_payout = ante * 2;
				scr_payout_animation(obj_ante_payout,ante);
		
			} else {
				ante_payout = ante;
			}
		
			flop_payout = flop * 2;
			scr_payout_animation(obj_flop_payout,flop);
			//scr_rebuild_chips_for_target(obj_flop_payout, "FLOP", flop, [100, 25, 5, 1]);
			turn_payout = turn * 2;
			scr_payout_animation(obj_turn_payout,turn);
			//scr_rebuild_chips_for_target(obj_turn_payout, "TURN", turn, [100, 25, 5, 1]);
			river_payout = river * 2;
			//scr_rebuild_chips_for_target(obj_river_payout, "RIVER", river, [100, 25, 5, 1]);
			scr_payout_animation(obj_river_payout,river);

		} 
		if(obj_game.hand_winner == "DEALER") {
			scr_destroy_chips_on_target(obj_ante,"ANTE");
			scr_destroy_chips_on_target(obj_flop,"FLOP");
			scr_destroy_chips_on_target(obj_turn,"TURN");
			scr_destroy_chips_on_target(obj_river,"RIVER");
		}
	
		//the player has a pocket pair
		if(playerHand[0].rank == playerHand[1].rank) {
			switch(playerHand[0].rank)
			{
				case 14:
					//check dealers hand
					if(dealerHand[0].rank == 14 && dealerHand[1].rank == 14) {
						bonus_payout = bonus * 1001;
					}
					else
					{
						bonus_payout = bonus * 31;
					}
				break;
				case 13:
				case 12:
				case 11:
					bonus_payout = bonus * 11;
				break;
				default:
					bonus_payout = bonus * 4;
				break;
					
			}
		}
			
		//players hand is suited
		if(playerHand[0].suit == playerHand[1].suit) {
			if(playerHand[0].rank == 14 || playerHand[1].rank == 14) {
				if(playerHand[0].rank == 13 || playerHand[1].rank == 13) {
					bonus_payout = bonus * 26;
				}
				if((playerHand[0].rank == 12 || playerHand[1].rank == 12) || (playerHand[0].rank == 11 || playerHand[1].rank == 11)) {
					bonus_payout = bonus * 21;
				}
			}
		} else {
			if(playerHand[0].rank == 14 || playerHand[1].rank == 14) {
					if(playerHand[0].rank == 13 || playerHand[1].rank == 13) {
						bonus_payout = bonus * 16;
					}
					if((playerHand[0].rank == 12 || playerHand[1].rank == 12) || (playerHand[0].rank == 11 || playerHand[1].rank == 11)) {
						bonus_payout = bonus * 6;
					}
				}
		}
		//scr_rebuild_chips_for_target(obj_bonus_payout, "BONUS", bonus_payout - bonus, [100, 25, 5, 1]);
		if(bonus_payout > 0) {
			scr_payout_animation(obj_bonus_payout,bonus_payout - bonus);
		} else {
			scr_destroy_chips_on_target(obj_bonus,"BONUS");
		}
		player_total_bank += ante_payout + bonus_payout + flop_payout + river_payout + turn_payout;

		//BONUS PAYOUT:
		//Hand	Payout
		//A-A (Player & Dealer)	1000 to 1
		//A-A (Player Only)	30 to 1
		//A-K (Suited)	25 to 1
		//A-Q or A-J (Suited)	20 to 1
		//A-K (Unsuited)	15 to 1
		//K-K or Q-Q or J-J	10 to 1
		//A-Q or A-J (Unsuited)	5 to 1
		//10-10 through 2-2 (Pairs)	3 to 1
	}
}