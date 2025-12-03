

if (instance_number(thb_controller) > 1) { // prevent duplicates on room resets
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
game_stage = eStage.HOLE;
bonus_payout = 0;
ante_payout = 0;
flop_payout = 0;
turn_payout = 0;
river_payout = 0;


player_total_bet = 0;
player_total_bank = 500;

function bet() {
	

	var denoms = [100, 25, 5, 1];
	switch(game_stage)
	{
		case eStage.HOLE:
			player_total_bank -= ante + bonus;
			break;
		case eStage.FLOP:
			flop =  ante * 2;

			player_total_bank -= flop;
			if (!is_rebuilding)
			{
				scr_rebuild_chips_for_target(inst_flop, "FLOP", flop, denoms);
			}
		break;
		case eStage.TURN:
			turn =  ante;

			player_total_bank -= turn;
			if (!is_rebuilding)
			{
				scr_rebuild_chips_for_target(inst_turn, "TURN", turn, denoms);
			}
		break;
		case eStage.RIVER:
			river =  ante;

			player_total_bank -= river;
			if (!is_rebuilding)
			{
				scr_rebuild_chips_for_target(inst_river, "RIVER", river, denoms);
			}
		break;
		
	}
	player_total_bet = ante + bonus + flop + turn + river;
	obj_chip_bank.text_value = player_total_bet;
	obj_chip_bank.text_description = string(player_total_bet);
}

function progressGame() {
	with(Hand) {
	var startIndex = 0;
	var endIndex = -1;
	if(handType == "Community") {
		switch(stage) {
			case eStage.HOLE:
				//show the flop
				startIndex = 0;
				endIndex = 2;
				thb_controller.game_stage = eStage.FLOP;
				break;
			case eStage.FLOP:
				thb_controller.game_stage = eStage.TURN
				//show the turn
				startIndex = 3;
				endIndex = 3;
				break;
			case eStage.TURN:
				thb_controller.game_stage = eStage.RIVER
				thb_controller.alarm[1] = 30;
				//show the River
				startIndex = 4;
				endIndex = 4;
				break;
		}
		
		if(endIndex != -1) {
			for(i = startIndex; i <= endIndex; i ++) {
				Cards[i].Flip();
			}
		}
		
	}
	
	if(handType == "Dealer") {
		switch(stage) {
				case eStage.RIVER:
				for(i = 0; i <= 1; i ++) {
					Cards[i].Flip();
				}
				var out  = Poker.Determine_winner();
				obj_winner_text.text_description  = out.message;
				if(out.result > 0) {
					thb_controller.hand_winner = "PLAYER";
					thb_controller.player_hand_rank = out.hero.category;
					inst_player.best5 = out.hero.best5;
					inst_community.best5 = out.hero.best5;
				} else if (out.result < 0) {
					thb_controller.hand_winner = "DEALER";
					inst_dealer.best5 = out.dealer.best5;
					inst_community.best5 = out.dealer.best5;
				} else {
					thb_controller.hand_winner = "TIE";
				}
				with(thb_controller)
				{ 
					payout();
					alarm[0] = 150;
				}
				
			break;
		}
	}
	
	stage++;

}

}

function scr_payout_animation(target,total){
	var change  = chips_for_amount(total,[10000,5000,1000,500,100,25,5,1]);
	var chipIndex = 0;
	var chip = noone;
	for(i = 0; i < array_length(change.counts); i ++)
	{
		for(j = 0; j < change.counts[i]; j ++)
		{
				chip = instance_create_layer(1200,200,"Instances",obj_chip_payout);
				chip.payout_target = target;
				chip.xPos = target.x;
				chip.yPos = target.y;
				chip.chip_index = chipIndex;
				chipIndex ++;
			switch(i) {
				case 0:
					chip.sprite_index = spr_chip_ten_thousand;
					break;
				case 1:
					chip.sprite_index = spr_chip_five_thousand;
				break;
				case 2:
					chip.sprite_index = spr_chip_one_thousand;
					break;
				case 3:
					chip.sprite_index = spr_chip_five_hundred;
					break;
				case 4:	
					chip.sprite_index = spr_chip_one_hundred;
					break;
				case 5:
					chip.sprite_index = spr_chip_twenty_five;
					break;
				case 6:
					chip.sprite_index = spr_chip_five;
					break;
				case 7:
					chip.sprite_index = spr_chip_one;
					break;
			}
		}
	}
				
}

function payout() {
	//Did Player Win ?
	if(hand_winner == "PLAYER" ) {
		if(player_hand_rank >= 4) {
			ante_payout = ante * 2;
			scr_payout_animation(inst_ante_payout, ante);
		
		} else {
			ante_payout = ante;
		}
		
		flop_payout = flop * 2;
		scr_payout_animation(inst_flop_payout,flop);
		turn_payout = turn * 2;
		scr_payout_animation(inst_turn_payout,turn);
		river_payout = river * 2;
		scr_payout_animation(inst_river_payout,river);

	} 
	if(hand_winner == "DEALER") {
		scr_destroy_chips_on_target(inst_ante,"ANTE");
		scr_destroy_chips_on_target(inst_flop,"FLOP");
		scr_destroy_chips_on_target(inst_turn,"TURN");
		scr_destroy_chips_on_target(inst_river,"RIVER");
		ante_payout = 0;
		flop_payout = 0;
		river_payout = 0;
		turn_payout = 0;
	}
	if(hand_winner == "TIE") {
		player_total_bank += ante  + flop + river + turn;
	}
	
	//the player has a pocket pair
	if(inst_player.Cards[0].Rank == inst_player.Cards[1].Rank) {
		switch(inst_player.Cards[0].Rank)
		{
			case 12:
				//check dealers hand
				if(inst_dealer.Cards[0].Rank == 12 && inst_dealer.Cards[1].Rank == 12) {
					bonus_payout = bonus * 1001;
				}
				else
				{
					bonus_payout = bonus * 31;
				}
			break;
			case 11:
			case 10:
			case 9:
				bonus_payout = bonus * 11;
			break;
			default:
				bonus_payout = bonus * 4;
			break;
					
		}
	}
			
	//players hand is suited
	if(inst_player.Cards[0].Suit == inst_player.Cards[1].Suit) {
		if(inst_player.Cards[0].Rank == 12 || inst_player.Cards[1].Rank == 12) {
			if(inst_player.Cards[0].Rank == 11 || inst_player.Cards[1].Rank == 11) {
				bonus_payout = bonus * 26;
			}
			if((inst_player.Cards[0].Rank == 10 || inst_player.Cards[1].Rank == 10) || (inst_player.Cards[0].Rank == 9 || inst_player.Cards[1].Rank == 9)) {
				bonus_payout = bonus * 21;
			}
		}
	} else {
		if(inst_player.Cards[0].Rank == 12 || inst_player.Cards[1].Rank == 12) {
				if(inst_player.Cards[0].Rank == 11 || inst_player.Cards[1].Rank == 11) {
					bonus_payout = bonus * 16;
				}
				if((inst_player.Cards[0].Rank == 10 || inst_player.Cards[1].Rank == 10) || (inst_player.Cards[0].Rank == 9 || inst_player.Cards[1].Rank == 9)) {
					bonus_payout = bonus * 6;
				}
			}
	}
	if(bonus_payout > 0) {
		scr_payout_animation(inst_bonus_payout,bonus_payout - bonus);
		
	} else {
		scr_destroy_chips_on_target(inst_bonus,"BONUS");
	}
	player_total_bank += ante_payout + bonus_payout + flop_payout + river_payout + turn_payout;
	

	//BONUS PAYOUT:
	//Hand	Payout
	//A-A (Player & Dealer)	1000 to 1
	//A-A (Player Only)	30 to 1
	//A-K (Suited)	25 to 1
	//A-Q or A-J (Suited)	20 to 1
	//A-K (Unsuited)	15 to 1
	//K-K or Q-Q or J-J	10 to 1
	//A-Q or A-J (Unsuited)	5 to 1
	//10-10 through 2-2 (Pairs)	3 to 1
	
}