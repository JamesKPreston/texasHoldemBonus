event_inherited();
button_id = "DRAW";
sprite_index = spr_deal_button;
on_click = function () {
	
	if(obj_game.ante == 0) {return;}
	if(button_id == "DRAW") {
		sprite_index = spr_bet_button_2;
		scr_deal_button();
		button_id = "BET";
		with(obj_check_button) visible = true;
		with(obj_fold_button) visible = true;
	} 
	else {
		scr_bet_button();
	}	
};
