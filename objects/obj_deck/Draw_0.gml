draw_set_color(c_black);
draw_text(200, 400, string(mouse_x) + " " + string(mouse_y));


for(i = 0; i < deckCount; i ++) {

	if(deck[i] > 0) {
		draw_sprite(sprite_array[0], -1, deck_x - .4*i, deck_y - .4 *i);
	}
}