if(keyboard_check_released(vk_up)) 
{
	player.face_up =1;
	player.deck_buffer_x = card_width + 5
}
if(keyboard_check_released(vk_down)) {
	player.deck_buffer_x = .4;
	player.face_up = 0;
}

if(keyboard_check_released(vk_left) ){
	with(player){scr_shuffle_deck()};
}

if(keyboard_check_released(vk_tab)) {
	
	with(player){ scr_deal(2)};
}

if(keyboard_check_released(vk_shift)) {
	player.hand = [];
	player.handCount = 0;
}