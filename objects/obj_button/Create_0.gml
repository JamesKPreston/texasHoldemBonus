/// obj_button: Create
// Config
image_speed = 0;              // keep static frames
image_index = 0;              // start normal
pressed_inside = false;       // track if press began inside bounds
use_gui = false;        
player = obj_card_player;
dealer = obj_card_dealer;
flop = obj_card_flop;
turn = obj_card_turn;
river = obj_card_river;

player_hand = obj_hand_player;
dealer_hand = obj_hand_dealer;
flop_hand = obj_hand_flop;
turn_hand = obj_hand_turn;
river_hand = obj_hand_river;

button_id = "default";

// Optional: assign a callback to run on click
on_click = function () {
    // Replace with your action
    show_debug_message("Button clicked!");
	
	//switch(obj_game.hand_stage) {
	//	case "PREFLOP":
	//		obj_game.hand_stage = "FLOP";
	//		obj_game.flop =  obj_game.ante * 2;
	//		with(flop) { 
	//			face_up = true;
	//			scr_flip_card();
	//		}
	//	break;
	//	case "FLOP":
	//		//obj_game.player_total_bet += obj_game.ante;
	//		obj_game.turn += obj_game.ante;
	//		obj_game.hand_stage = "TURN";
	//		with(turn) { face_up = true; scr_flip_card();}
	//		break;
	//	case "TURN":
	//		//obj_game.player_total_bet += obj_game.ante;
	//		obj_game.river += obj_game.ante;
	//		obj_game.hand_stage = "RIVER";	
	//		with(river) { face_up = true;  scr_flip_card(); }
	//		break;
	//	case "RIVER":
	//		with(dealer) { face_up = true; scr_flip_card(); }
	//				var playerHand = [];
	//		var community = [];
	//		var dealerHand = [];

	//		with(player_hand) {
	//			for(i =0; i < 2; i ++) 
	//			{
	//				playerHand[i] = scr_card_struct_from_index(hand[i]);
	//			}
	//		}
			
	//		with(dealer_hand) {
	//			for(i =0; i < 2; i ++) 
	//			{
	//				dealerHand[i] = scr_card_struct_from_index(hand[i]);
	//			}
	//		}
			
	//		with(flop_hand) {
	//			for(i =0; i < 3; i ++) 
	//			{
	//				community[i] = scr_card_struct_from_index(hand[i]);
	//			}
	//		}
			
	//		with(turn_hand) {
	//			for(i =0; i < 1; i ++) 
	//			{
	//				community[i + 3] = scr_card_struct_from_index(hand[i]);
	//			}
	//		}
			
	//		with(river_hand) {
	//			for(i =0; i < 1; i ++) 
	//			{
	//				community[i + 4] = scr_card_struct_from_index(hand[i]);
	//			}
	//		}
			
	//		// Run showdown
	//		var out = poker_showdown(playerHand, dealerHand, community);
	//		show_debug_message(out.message);

	//		// If you need to branch on winner:
	//		//if (out.result > 0) {
	//		//    // Hero wins
	//		//} else if (out.result < 0) {
	//		//    // Dealer wins
	//		//} else {
	//		//    // Split pot
	//		//}
	//		break;
			
	//}

};
