//511 270
deck_x = 324;
deck_y = 270;
card_width = 90;
card_height = 129;

face_up = 0;
deck_buffer_x = .4;
deck_buffer_y = .4;

player = obj_card_player;
dealer = obj_card_dealer;
flop = obj_card_flop;
turn = obj_card_turn;
river = obj_card_river;

stage = 0;


scr_init_sprite_array();

deckPoint = 0;
deckCount = 52;
for(i = 0; i < 52; i ++) {
	deck[i] = i;
}







//#macro CARDMAX i

scr_shuffle_deck();