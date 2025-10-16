function scr_flip_card(){
	if(face_up) 
	{
		sprite_index = sprite_array[cardNum];
	}
	else {
		sprite_index = spr_card_back;
	}
	var spr_w = sprite_get_width(sprite_index);
	var spr_h = sprite_get_height(sprite_index);
	image_xscale = card_width / spr_w;
	image_yscale = card_height / spr_h;
}