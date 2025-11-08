image_speed = 0;              // keep static frames
image_index = 0;              // start normal
pressed_inside = false;       // track if press began inside bounds
button_id = "DRAW";
sprite_index = spr_deal_button;
use_gui = false; 
enabled = false;
on_click = function () {
	if(!enabled) { return;}
	
	with(Hand) {
		drawing = true;
	}
	thb_controller.bet();
	instance_change(btn_bet, true);
	with(Chip) {
		disabled = true;
	}
	btn_fold.visible = true;
	btn_check.visible = true;
};
