deck_x = 324;
deck_y = 270;
card_width = 90;
card_height = 129;
deck = [];
face_up = 0;
deck_buffer_x = .4;
deck_buffer_y = .4;
scr_init_sprite_array();
deckPoint = 0;
deckCount = 52;
for(i = 0; i < 52; i ++) {
	deck[i] = i;
}
player = obj_card_player;
dealer = obj_card_dealer;
flop = obj_card_flop;
turn = obj_card_turn;
river = obj_card_river;

player_hand = obj_hand_player;
dealer_hand = obj_hand_dealer;
flop_hand = obj_hand_flop;
turn_hand = obj_hand_turn;
river_hand = obj_hand_river;

stage = 0;


Shuffle();

function Draw(){
	var num = argument0;
	var _hand = argument1;
	if(deckCount - num < 0) {return;}
	
	if(_hand.handCount == _hand.maxHand) {return;}
	
	for(i = 0; i < num; i ++)
	{
		_hand.hand[_hand.handCount++] = deck[--deckCount];
		deck[deckCount] = 0;
		var cardObj = noone;
		switch(_hand.handType)
		{
			case "DEALER":
				cardObj = obj_card_dealer;
			break;
			case "PLAYER":
				cardObj = obj_card_player;
			break;
			case "FLOP":
				cardObj = obj_card_flop;
			break;
			case "TURN":
				cardObj = obj_card_turn;
			break;
			case "RIVER":
				cardObj = obj_card_river;
			break;
		}
		
		if(cardObj != noone) {
			_hand.handCard[_hand.handCount - 1] = instance_create_depth(deck_x, deck_y, -_hand.handCount -2, cardObj);

		}
		
		
		with(_hand.handCard[_hand.handCount - 1]) {
			card_drawn = true;
			hand_position = player.handCount -1;
			cardNum = player.hand[hand_position];
		}
	}
}
	
	
function Shuffle(){
	randomize();
	var numShuffle = 100;
	
	if(deckCount == 0) {
		return;
	}
	
	for(var i = 0 ; i < numShuffle; i ++) {
		for(var c = 0; c < deckCount; c ++) {
			var temp_1 = irandom_range(0, deckCount - 1);
			if(deck[c] > 0 &&  deck[temp_1] > 0) {
				var temp_2 = deck[c];
				deck[c] = deck[temp_1];
				deck[temp_1] = temp_2;
			}
		}
	}
}