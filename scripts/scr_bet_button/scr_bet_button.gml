function scr_bet_button(){
	scr_game_stage();
		
	obj_game.player_total_bet = obj_game.ante + obj_game.bonus + obj_game.flop + obj_game.turn + obj_game.river;
	obj_chip_bank.text_value = obj_game.player_total_bet;
	obj_chip_bank.text_description = string(obj_game.player_total_bet);
	
	var denoms = [100, 25, 5, 1];
	switch(obj_game.hand_stage) {
		case "FLOP":
		obj_game.player_total_bank -= obj_game.flop;
			if (!obj_game.is_rebuilding)
			{
			    scr_rebuild_chips_for_target(obj_flop, "FLOP", obj_game.flop, denoms);
			}
		break;
		case "TURN":
		obj_game.player_total_bank -= obj_game.turn;
		if (!obj_game.is_rebuilding)
			{
			    scr_rebuild_chips_for_target(obj_turn, "TURN", obj_game.turn, denoms);
			}
		break;
		case "RIVER":
		obj_game.player_total_bank -= obj_game.river;
		if (!obj_game.is_rebuilding)
			{
			    scr_rebuild_chips_for_target(obj_river, "RIVER", obj_game.river, denoms);
			}
		break;
		case "SHOWDOWN":
			//calculate payouts
			//display winner
			//small delay
			//reset
			scr_reset_hand();
			break;
	}
}

