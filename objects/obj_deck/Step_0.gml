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
	
	switch(++stage) {
		case 1:
			with(flop) { 
				face_up = true;
				scr_flip_card();}
			break;
		case 2:
			with(turn) { face_up = true; scr_flip_card();}
			break;
		case 3:
			with(river) { face_up = true;  scr_flip_card(); }
			break;
		case 4:
			with(dealer) { face_up = true; scr_flip_card(); }
			break;
	}
}

//if(keyboard_check_released(vk_shift)) {
//	player.hand = [];
//	player.handCount = 0;
//	with (obj_card) {
//    instance_destroy();
//}
//}

if(keyboard_check_released(vk_escape))
{
	game_restart();
}