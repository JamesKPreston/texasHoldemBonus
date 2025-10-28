for(i = 0; i < deckCount; i ++) {
	var card_sprite = spr_card_back;
	if(face_up) {
		card_sprite = sprite_array[deck[i]];
	}
		
	if(deck[i] > 0) {
		var spr_w = sprite_get_width(card_sprite);
		var spr_h = sprite_get_height(card_sprite);
		var scale_x = card_width / spr_w;
		var scale_y = card_height / spr_h;

		draw_sprite_ext(card_sprite, -1,  deck_x + deck_buffer_x *i, deck_y - deck_buffer_y *i, scale_x, scale_y, image_angle, image_blend, image_alpha);
	}
}

