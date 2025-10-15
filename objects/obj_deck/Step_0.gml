if(keyboard_check_released(vk_up)) 
{
	face_up =1;
	deck_buffer_x = card_width + 5
}
if(keyboard_check_released(vk_down)) {
	deck_buffer_x = .4;
	face_up = 0;
}

if(keyboard_check_released(vk_left) ){
	scr_shuffle_deck();
}

if(keyboard_check_released(vk_tab)) {
	scr_deal(2);
}

if(keyboard_check_released(vk_shift)) {
	obj_player_hand.hand = [];
	obj_player_hand.handCount = 0;
}