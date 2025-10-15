//511 270
deck_x = 324;
deck_y = 270;
card_height = 87;
card_width = 60;

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

deckCount = 0;
deckPoint = 0;

for(i = 0; i < 26; i ++) {
	deck[i] = 0;
}

i = 0;

deck[i++] = 1;
deck[i++] = 2;
deck[i++] = 3;
deck[i++] = 4;
deck[i++] = 5;
deck[i++] = 6;
deck[i++] = 7;
deck[i++] = 8;
deck[i++] = 9;
deck[i++] = 10;
deck[i++] = 11;
deck[i++] = 12;
deck[i++] = 13;
deck[i++] = 14;
deck[i++] = 15;
deck[i++] = 16;
deck[i++] = 17;
deck[i++] = 18;
deck[i++] = 19;
deck[i++] = 20;
deck[i++] = 21;
deck[i++] = 22;
deck[i++] = 23;
deck[i++] = 24;
deck[i++] = 25;
deck[i++] = 26;


deckCount = i;

i = 0;


#macro CARDMAX i

scr_shuffle_deck();