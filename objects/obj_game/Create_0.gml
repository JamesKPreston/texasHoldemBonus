
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