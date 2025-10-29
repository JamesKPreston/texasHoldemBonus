event_inherited();
button_id = "DRAW";
sprite_index = spr_deal_button;
on_click = function () {
	
	if(obj_game.ante == 0) {return;}
	if(button_id == "DRAW") {
		sprite_index = spr_bet_button_2;
		with (obj_chip) {
			disabled = true;
		}
		with (obj_hand) {
			alarm[0] = 1;
		}
		button_id = "BET";
		obj_game.player_total_bank -= obj_game.player_total_bet;
		button_id = "BET";
		with(obj_check_button) visible = true;
		with(obj_fold_button) visible = true;
	} 
	else {
		bet_button_click();
	}	
};

function bet_button_click(){

	obj_game.scr_game_stage("BET");
		
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
			obj_game.scr_game_stage("BET");
			
		break;
		case "SHOWDOWN":
			//calculate payouts
			//display winner
			//small delay
			//reset
			//scr_reset_hand();
			break;
	}
}

