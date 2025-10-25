function scr_deal_button(){
	with (obj_chip) {
		disabled = true;
	}
	with (obj_hand) {
		alarm[0] = 1;
	}
	button_id = "BET";
	obj_game.player_total_bank -= obj_game.player_total_bet;
}