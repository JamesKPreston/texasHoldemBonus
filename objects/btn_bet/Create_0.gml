image_speed = 0;              // keep static frames
image_index = 0;              // start normal
pressed_inside = false;       // track if press began inside bounds
button_id = "BET";
use_gui = false; 
on_click = function () {
	if(thb_controller.game_stage == eStage.HOLE && thb_controller.player_total_bank - (thb_controller.ante * 2) < 0) {
		return;
	}
	if(thb_controller.game_stage > eStage.HOLE && thb_controller.player_total_bank - thb_controller.ante < 0) {
		return;
	}
	thb_controller.progressGame();
	if(thb_controller.game_stage > eStage.RIVER) {

		return;
	} 
	thb_controller.bet();
};
