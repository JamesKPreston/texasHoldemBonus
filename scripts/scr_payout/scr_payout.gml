function scr_payout() {
	var playerHand = [];
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
	with(obj_game) 
	{
		//Did Player Win ?
		if(obj_game.is_player_winner) {
			if(obj_game.player_hand_rank >= 4) {
				ante_payout = ante * 2;
			} else {
				ante_payout = ante;
			}
		
			flop_payout = flop * 2;
			turn_payout = turn * 2;
			river_payout = river * 2;

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
			
			show_debug_message("Ante Payout " + string(ante_payout));
			show_debug_message("Bonus Payout " + string(bonus_payout));
			show_debug_message("FLOP Payout " + string(flop_payout));
			show_debug_message("Turn Payout " + string(turn_payout));
			show_debug_message("River Payout " + string(river_payout));
			
			player_total_bank += ante_payout + bonus_payout + flop_payout + river_payout + turn_payout;
			//ante payout if player hand is straight or better
			//ante is paid out at 1 to 1
	
			//Flop payout is 1 to 1
			//Turn payout is 1 to 1
			//River payout is 1 to 1
	
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