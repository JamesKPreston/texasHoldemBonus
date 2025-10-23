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

player_hand = obj_hand_player;
dealer_hand = obj_hand_dealer;
flop_hand = obj_hand_flop;
turn_hand = obj_hand_turn;
river_hand = obj_hand_river;

stage = 0;


scr_init_deck();





//#macro CARDMAX i

scr_shuffle_deck();