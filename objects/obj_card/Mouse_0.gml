if(mouse_check_button_pressed(mb_left) && x == xPos && y == yPos)
{
	selected = true;
}

if(selected){
	x = mouse_x;
	y = mouse_y;
}