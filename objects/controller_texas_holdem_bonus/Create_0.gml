

if (instance_number(controller_texas_holdem_bonus) > 1) { // prevent duplicates on room resets
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


player_total_bet = 0;
player_total_bank = 1000;


//function showWinner(_text, _seconds, _color) {
	
//    winner_text   = _text;
//	obj_winner_text.text_description = winner_text;
//    winner_color  = is_undefined(_color) ? c_yellow : _color;
    
//    winner_seconds = _seconds;
//    show_winner   = true;
//    var steps_per_second = game_get_speed(gamespeed_fps);
//	alarm[ALRM.WINNER] = max(1, round(_seconds * steps_per_second));
//}

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
				//stage = eStage.FLOP;
				break;
			case eStage.FLOP:
				//show the turn
				startIndex = 3;
				endIndex = 3;
				break;
			case eStage.TURN:
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
				Poker.Determine_winner();
			break;
		}
	}
	
	stage++;

}

}

//function scr_payout_animation(target,total){
//	var change  = chips_for_amount(total,[100,25,5,1]);
//	var chipIndex = 0;
//	var chip = noone;
//	for(i = 0; i < array_length(change.counts); i ++)
//	{
//		for(j = 0; j < change.counts[i]; j ++)
//		{
//				chip = instance_create_layer(1200,200,"Instances",obj_chip_payout);
//				chip.payout_target = target;
//				chip.xPos = target.x;
//				chip.yPos = target.y;
//				chip.chip_index = chipIndex;
//				chipIndex ++;
//			switch(i) {
//				case 0:	
//					chip.sprite_index = spr_chip_one_hundred;
//					break;
//				case 1:
//					chip.sprite_index = spr_chip_twenty_five;
//					break;
//				case 2:
//					chip.sprite_index = spr_chip_five;
//					break;
//				case 3:
//					chip.sprite_index = spr_chip_one;
//					break;
//			}
//		}
//	}
				
//}
//function scr_payout() {
//	var debug = false;
//	var playerHand = [];
//	var dealerHand = [];
//	with(Deck)
//	{
//		with(player_hand) {
//			for(i =0; i < 2; i ++) 
//			{
//				playerHand[i] = Poker.CardStructFromIndex(hand[i]);
//			}
//		}
			
//		with(dealer_hand) {
//			for(i =0; i < 2; i ++) 
//			{
//				dealerHand[i] = Poker.CardStructFromIndex(hand[i]);
//			}
//		}
	
//	}

//	with(obj_game) 
//	{
//		//Did Player Win ?
//		if(obj_game.hand_winner == "PLAYER" || debug) {
//			if(obj_game.player_hand_rank >= 4 || debug) {
//				ante_payout = ante * 2;
//				scr_payout_animation(obj_ante_payout,ante);
		
//			} else {
//				ante_payout = ante;
//			}
		
//			flop_payout = flop * 2;
//			scr_payout_animation(obj_flop_payout,flop);
//			//scr_rebuild_chips_for_target(obj_flop_payout, "FLOP", flop, [100, 25, 5, 1]);
//			turn_payout = turn * 2;
//			scr_payout_animation(obj_turn_payout,turn);
//			//scr_rebuild_chips_for_target(obj_turn_payout, "TURN", turn, [100, 25, 5, 1]);
//			river_payout = river * 2;
//			//scr_rebuild_chips_for_target(obj_river_payout, "RIVER", river, [100, 25, 5, 1]);
//			scr_payout_animation(obj_river_payout,river);

//		} 
//		if(obj_game.hand_winner == "DEALER") {
//			scr_destroy_chips_on_target(obj_ante,"ANTE");
//			scr_destroy_chips_on_target(obj_flop,"FLOP");
//			scr_destroy_chips_on_target(obj_turn,"TURN");
//			scr_destroy_chips_on_target(obj_river,"RIVER");
//		}
	
//		//the player has a pocket pair
//		if(playerHand[0].rank == playerHand[1].rank) {
//			switch(playerHand[0].rank)
//			{
//				case 14:
//					//check dealers hand
//					if(dealerHand[0].rank == 14 && dealerHand[1].rank == 14) {
//						bonus_payout = bonus * 1001;
//					}
//					else
//					{
//						bonus_payout = bonus * 31;
//					}
//				break;
//				case 13:
//				case 12:
//				case 11:
//					bonus_payout = bonus * 11;
//				break;
//				default:
//					bonus_payout = bonus * 4;
//				break;
					
//			}
//		}
			
//		//players hand is suited
//		if(playerHand[0].suit == playerHand[1].suit) {
//			if(playerHand[0].rank == 14 || playerHand[1].rank == 14) {
//				if(playerHand[0].rank == 13 || playerHand[1].rank == 13) {
//					bonus_payout = bonus * 26;
//				}
//				if((playerHand[0].rank == 12 || playerHand[1].rank == 12) || (playerHand[0].rank == 11 || playerHand[1].rank == 11)) {
//					bonus_payout = bonus * 21;
//				}
//			}
//		} else {
//			if(playerHand[0].rank == 14 || playerHand[1].rank == 14) {
//					if(playerHand[0].rank == 13 || playerHand[1].rank == 13) {
//						bonus_payout = bonus * 16;
//					}
//					if((playerHand[0].rank == 12 || playerHand[1].rank == 12) || (playerHand[0].rank == 11 || playerHand[1].rank == 11)) {
//						bonus_payout = bonus * 6;
//					}
//				}
//		}
//		//scr_rebuild_chips_for_target(obj_bonus_payout, "BONUS", bonus_payout - bonus, [100, 25, 5, 1]);
//		if(bonus_payout > 0) {
//			scr_payout_animation(obj_bonus_payout,bonus_payout - bonus);
//		} else {
//			scr_destroy_chips_on_target(obj_bonus,"BONUS");
//		}
//		player_total_bank += ante_payout + bonus_payout + flop_payout + river_payout + turn_payout;

//		//BONUS PAYOUT:
//		//Hand	Payout
//		//A-A (Player & Dealer)	1000 to 1
//		//A-A (Player Only)	30 to 1
//		//A-K (Suited)	25 to 1
//		//A-Q or A-J (Suited)	20 to 1
//		//A-K (Unsuited)	15 to 1
//		//K-K or Q-Q or J-J	10 to 1
//		//A-Q or A-J (Unsuited)	5 to 1
//		//10-10 through 2-2 (Pairs)	3 to 1
//	}
//}