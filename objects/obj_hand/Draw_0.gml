//648 542

for(i = 0; i < handCount; i++) {
	if(hand[i] > 0) {
		draw_sprite(sprite_array[hand[i]], -1, hand_x +(5 + card_width) * i, hand_y);
	}
}