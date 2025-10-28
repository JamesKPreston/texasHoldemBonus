function CardStructFromIndex(idx) {
    if (idx <= 0 || idx > 52) return undefined;
    var zero_based = idx - 1;
    var suit = floor(zero_based / 13);      // 0..3
    var rank = (zero_based mod 13) + 1;     // 1..13 → map Ace=14 later if needed
    if (rank == 1) rank = 14;               // make Ace high
    return { rank: rank, suit: suit, id: idx };
}


/// scr_card_name_from_index(index)
/// Converts a sprite_array index (1–52) into a readable string like "Jack of Clubs"
function CardNameFromIndex(idx) {
    if (idx <= 0 || idx > 52) return "Card Back";

    // Suits in order of your sprite_array
    var suits = ["Clubs", "Diamonds", "Hearts", "Spades"];
    // Ranks in order Ace..King
    var ranks = ["Ace","2","3","4","5","6","7","8","9","10","Jack","Queen","King"];

    // Subtract 1 because index 1 = first card (Ace of Clubs)
    var zero_based = idx - 1;
    var suit_index = floor(zero_based / 13);
    var rank_index = zero_based mod 13;

    return ranks[rank_index] + " of " + suits[suit_index];
}



function Determine_winner(){
	var playerHand = [];
	var community = [];
	var dealerHand = [];

	with(obj_deck) {
		with(player_hand) {
			for(i =0; i < 2; i ++) 
			{
				playerHand[i] = CardStructFromIndex(hand[i]);
			}
		}
			
		with(dealer_hand) {
			for(i =0; i < 2; i ++) 
			{
				dealerHand[i] = CardStructFromIndex(hand[i]);
			}
		}
			
		with(flop_hand) {
			for(i =0; i < 3; i ++) 
			{
				community[i] = CardStructFromIndex(hand[i]);
			}
		}
			
		with(turn_hand) {
			for(i =0; i < 1; i ++) 
			{
				community[i + 3] = CardStructFromIndex(hand[i]);
			}
		}
			
		with(river_hand) {
			for(i =0; i < 1; i ++) 
			{
				community[i + 4] = CardStructFromIndex(hand[i]);
			}
		}
	}

	// Run showdown
	
	var out = PokerEvaluator.poker_showdown(playerHand, dealerHand, community);
	obj_game.player_hand_rank = out.hero.category;
	show_debug_message(out.message);
	with (obj_game) {
		showWinner(out.message, 10, c_yellow); // 1.5 seconds
	}			 
	if (out.result > 0) {
		obj_game.hand_winner = "PLAYER";
		obj_hand_player.best5 = out.hero.best5;
		obj_hand_flop.best5 = out.hero.best5;
		obj_hand_turn.best5 = out.hero.best5;
		obj_hand_river.best5 = out.hero.best5;
	} else if (out.result < 0) {
		// Dealer wins
		obj_game.hand_winner = "DEALER";
		obj_hand_dealer.best5 = out.dealer.best5;
		obj_hand_flop.best5 = out.dealer.best5;
		obj_hand_turn.best5 = out.dealer.best5;
		obj_hand_river.best5 = out.dealer.best5;
	} else {
		// Split pot
		obj_game.hand_winner = "TIE";
	}
	scr_payout();
	scr_show_winning_hand();
}