function scr_game_stage(){
	
	switch(obj_game.hand_stage) {
			case "PREFLOP":
				obj_game.hand_stage = "FLOP";
				if(button_id == "BET")
				{
					obj_game.flop =  obj_game.ante * 2;
				}
				with(flop) { 
					face_up = true;
					scr_flip_card();
				}
			break;
			case "FLOP":
				if(button_id == "BET")
				{
					obj_game.turn += obj_game.ante;
				}
				
				obj_game.hand_stage = "TURN";
				with(turn) { face_up = true; scr_flip_card();}
				break;
			case "TURN":
				//obj_game.player_total_bet += obj_game.ante;
				if(button_id == "BET")
				{
					obj_game.river += obj_game.ante;
				}
			
				obj_game.hand_stage = "RIVER";	
				with(river) { face_up = true;  scr_flip_card(); }
				break;
			case "RIVER":
				obj_game.hand_stage = "SHOWDOWN";	
				with(dealer) { face_up = true; scr_flip_card(); }
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
				 
				if (out.result > 0) {
				    obj_game.is_player_winner = true;
				} else if (out.result < 0) {
				    // Dealer wins
					obj_game.is_player_winner = false;
				} else {
				    // Split pot
				}
				  scr_payout();
				break;
			 
		}


}