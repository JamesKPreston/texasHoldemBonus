// Inherit the parent event
event_inherited();

if( keyboard_check_released(vk_tab)) {
	face_up = true;
	scr_flip_card();
}