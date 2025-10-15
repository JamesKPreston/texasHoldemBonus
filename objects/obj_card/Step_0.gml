if(card_drawn) {
	if(alarm[0] == -1) {
		alarm[0] = 1;
	}
}
if(card_in_hand) {
	xPos = room_width/2 - player.handCount/2*(card_width + 3) + card_width / 2 +(3 + card_width) * hand_position;
	if(point_distance(x,y,xPos,yPos) > 10) {
		move_towards_point(xPos,yPos, 10);
	}
	else {
		x = xPos;
		y = yPos;
		speed = 0;
	}
}