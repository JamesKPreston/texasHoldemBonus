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
				scr_poker_determine_winner();
				break;
			case "SHOWDOWN":
				
			break;
		}
}