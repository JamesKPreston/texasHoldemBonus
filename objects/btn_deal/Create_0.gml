image_speed = 0;              // keep static frames
image_index = 0;              // start normal
pressed_inside = false;       // track if press began inside bounds
button_id = "DRAW";
sprite_index = spr_deal_button;
use_gui = false; 
on_click = function () {
	with(Hand) {
		drawing = true;
	}
	instance_change(btn_bet, true);

};
