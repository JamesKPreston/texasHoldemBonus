function scr_chip_counts(){
	switch(chip_value) {
		case 1:
			obj_game.ante_chip_count_1s ++;
		break;
		case 5:
			obj_game.ante_chip_count_5s ++;
		break;
		case 25:
			obj_game.ante_chip_count_25s ++;
		break;
		case 100:
			obj_game.ante_chip_count_100s ++;
		break;
	}
}