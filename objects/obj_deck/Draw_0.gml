draw_set_color(c_black);
draw_text(200, 400, string(mouse_x) + " " + string(mouse_y));

	for(i = 0; i < deckCount; i ++) {
		var card_sprite = spr_card_back;
		if(face_up) {
			card_sprite = sprite_array[deck[i]];
		}
		if(deck[i] > 0) {
			draw_sprite(card_sprite, -1, deck_x + deck_buffer_x *i, deck_y - deck_buffer_y *i);
		}
	}
