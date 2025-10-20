// Inherit the parent event
event_inherited();

// Optional: assign a callback to run on click
on_click = function () {
    // Replace with your action
    show_debug_message("BET Button clicked!");
	
	switch(obj_game.hand_stage) {
		case "PREFLOP":
			obj_game.hand_stage = "FLOP";
			obj_game.flop =  obj_game.ante * 2;
		break;
		case "FLOP":
			//obj_game.player_total_bet += obj_game.ante;
			obj_game.turn += obj_game.ante;
			obj_game.hand_stage = "TURN";
			break;
		case "TURN":
			//obj_game.player_total_bet += obj_game.ante;
			obj_game.river += obj_game.ante;
			obj_game.hand_stage = "RIVER";
		case "River":
			//	obj_game.player_total_bet += obj_game.ante;
			//obj_game.hand_stage = "FLOP";
			break;
			
	}

	obj_game.player_total_bet = obj_game.ante + obj_game.bonus + obj_game.flop + obj_game.turn + obj_game.river;
	show_debug_message("Current Total Bet " + string(obj_game.player_total_bet) );
	show_debug_message( string(obj_game.ante) + " " + string(obj_game.bonus) + " " + string(obj_game.flop) + " " + string(obj_game.turn) + " " + string(obj_game.river));
	//There will be a game object which will be tracking the Ante and Bonus Bet amounts
	//Check the object to determine how much 2x the ante is for the Flop Bet or 1x if the bet is for the turn or river
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