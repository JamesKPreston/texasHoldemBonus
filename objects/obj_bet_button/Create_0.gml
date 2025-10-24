event_inherited();
button_id = "DRAW";
sprite_index = spr_deal_button;
on_click = function () {
	if(button_id == "DRAW") {
		sprite_index = spr_bet_button_2;
		scr_deal_button();
		button_id = "BET";
		obj_game.player_total_bank -= obj_game.player_total_bet;
	} 
	else {
		scr_bet_button();
	}	
};
