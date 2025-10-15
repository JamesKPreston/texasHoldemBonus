function scr_flip_card(){
	if(face_up) 
	{
		sprite_index = sprite_array[cardNum];
	}
	else {
		sprite_index = spr_card_back;
	}
}