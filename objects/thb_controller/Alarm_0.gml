ante = 0;
bonus = 0;
flop = 0;
turn = 0;
river = 0;
	
game_stage = eStage.HOLE;
with(btn_bet) {
	instance_change(btn_deal, true);
}
btn_deal.enabled = false;
room_restart();
