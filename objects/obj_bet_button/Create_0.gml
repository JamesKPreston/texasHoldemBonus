event_inherited();
button_id = "DRAW";
sprite_index = spr_deal_button;
on_click = function () {
	
	if(obj_game.ante == 0) {return;}
	if(button_id == "DRAW") {
		sprite_index = spr_bet_button_2;
		scr_deal_button();
		button_id = "BET";
	} 
	else {
		scr_bet_button();
	}	
};
