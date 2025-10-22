// Inherit the parent event
event_inherited();
button_id = "BET";
// Optional: assign a callback to run on click
on_click = function () {
    // Replace with your action
    show_debug_message("BET Button clicked!");
	scr_game_stage();
	
	
	obj_game.player_total_bet = obj_game.ante + obj_game.bonus + obj_game.flop + obj_game.turn + obj_game.river;
	obj_chip_bank.text_value = obj_game.player_total_bet;
	obj_chip_bank.text_description = string(obj_game.player_total_bet);
	
	var denomsAnte = [100,25,5,1]
	var change = chips_for_amount(obj_game.ante, denomsAnte);
	
show_debug_message("chip counts:" + string (change.counts));
show_debug_message("chip denoms:" + string (change.denoms));
	 //change.denoms  = [100,25,5,1]
	 //change.counts  = [0, 3, 1, 0]   // 3×25 + 1×5
	 //change.remaining = 0
	 //change.total_chips = 4

	
	show_debug_message("Chip Counts 1s : " + string(obj_game.ante_chip_count_1s));
	show_debug_message("Chip Counts 5s : " + string(obj_game.ante_chip_count_5s));
	show_debug_message("Chip Counts 25s : " + string(obj_game.ante_chip_count_25s));
	show_debug_message("Chip Counts 100s : " + string(obj_game.ante_chip_count_100s));
	show_debug_message("Current Total Bet " + string(obj_game.player_total_bet) );
	show_debug_message( string(obj_game.ante) + " " + string(obj_game.bonus) + " " + string(obj_game.flop) + " " + string(obj_game.turn) + " " + string(obj_game.river));
	//There will be a game object which will be tracking the Ante and Bonus Bet amounts
	//Check the object to determine how much 2x the ante is for the Flop Bet or 1x if the bet is for the turn or river
	var denoms = [100, 25, 5, 1];
	switch(obj_game.hand_stage) {
		case "FLOP":
			if (!obj_game.is_rebuilding)
		    {
		        scr_rebuild_chips_for_target(obj_flop, "FLOP", obj_game.flop, denoms);
		    }
		break;
		case "TURN":
		if (!obj_game.is_rebuilding)
		    {
		        scr_rebuild_chips_for_target(obj_turn, "TURN", obj_game.turn, denoms);
		    }
		break;
		case "RIVER":
		if (!obj_game.is_rebuilding)
		    {
		        scr_rebuild_chips_for_target(obj_river, "RIVER", obj_game.river, denoms);
		    }
		break;
	}
			
};



//ante = 10;
//bonus = 10;
//flop = 0;
//turn = 0;
//river = 0;


//bonus_payout = 0;
//ante_payout = 0;
//flop_payout = 0;
//turn_payout = 0;
//river_payout = 0;

//hand_stage = "PREFLOP";
//player_total_bet = 20;
//player_total_bank = 100;