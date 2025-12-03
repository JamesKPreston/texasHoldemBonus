ante = 0;
bonus = 0;
flop = 0;
turn = 0;
river = 0;
ante_payout = 0;
bonus_payout = 0;
flop_payout = 0;
turn_payout = 0;
river_payout = 0;
	
game_stage = eStage.HOLE;
with(btn_bet) {
	instance_change(btn_deal, true);
}
btn_deal.enabled = false;
room_restart();
