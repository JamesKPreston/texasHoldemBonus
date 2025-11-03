image_speed = 0;              // keep static frames
image_index = 0;              // start normal
pressed_inside = false;       // track if press began inside bounds
button_id = "BET";
use_gui = false; 
on_click = function () {
	with(thb_controller) {
		ante = 0;
		bonus = 0;
		flop = 0;
		turn = 0;
		river = 0;
		is_rebuilding = false;
		is_player_winner = false;
		hand_winner  = "";
		player_hand_rank = 0;
		game_stage = eStage.HOLE;
		bonus_payout = 0;
		ante_payout = 0;
		flop_payout = 0;
		turn_payout = 0;
		river_payout = 0;
		
	}
	room_restart();
};
