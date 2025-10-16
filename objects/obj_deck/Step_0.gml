if(keyboard_check_released(vk_up)) 
{
	face_up =1;
	deck_buffer_x = card_width + 5
}
if(keyboard_check_released(vk_down)) {
	deck_buffer_x = .4;
	face_up = 0;
}

if(keyboard_check_released(vk_left) ){
	scr_shuffle_deck();
}

if(keyboard_check_released(vk_tab)) {
	
	switch(++stage) {
		case 1:
			with(flop) { 
				face_up = true;
				scr_flip_card();}
			break;
		case 2:
			with(turn) { face_up = true; scr_flip_card();}
			break;
		case 3:
			with(river) { face_up = true;  scr_flip_card(); }
			break;
		case 4:
			with(dealer) { face_up = true; scr_flip_card(); }
			break;
		case 5:
			// Example 7 cards (ranks 2..14, suits 0..3)
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
			show_debug_message(out.message);

			// If you need to branch on winner:
			//if (out.result > 0) {
			//    // Hero wins
			//} else if (out.result < 0) {
			//    // Dealer wins
			//} else {
			//    // Split pot
			//}

		break;
	}
	
}

if(keyboard_check_released(vk_escape))
{
	game_restart();
}