
if (instance_number(obj_game) > 1) { // prevent duplicates on room resets
    instance_destroy();
    exit;
}
ante = 0;
bonus = 0;
flop = 0;
turn = 0;
river = 0;
is_rebuilding = false;
is_player_winner = false;
hand_winner  = "";
player_hand_rank = 0;

bonus_payout = 0;
ante_payout = 0;
flop_payout = 0;
turn_payout = 0;
river_payout = 0;

hand_stage = "PREFLOP";
player_total_bet = 0;
player_total_bank = 1000;
ante_chip_count_1s = 0;
ante_chip_count_5s = 0;
ante_chip_count_25s = 0;
ante_chip_count_100s = 0;

/// obj_game: Create
enum ALRM { WINNER = 0 } // reserve alarm[0] for this
show_winner = false;
winner_text = "";
winner_color = c_white;
winner_bg = 0.5;
winner_seconds = 0;

/// helper to start the timer (seconds -> steps)
function showWinner(_text, _seconds, _color) {
	
    winner_text   = _text;
	obj_test.text_description = winner_text;
    winner_color  = is_undefined(_color) ? c_yellow : _color;
    
    winner_seconds = _seconds;
    show_winner   = true;
    var steps_per_second = game_get_speed(gamespeed_fps);
	alarm[ALRM.WINNER] = max(1, round(_seconds * steps_per_second));
}
