draw_self();
if (indicator) {
	if (!audio_is_playing(sd_warning)){
		audio_play_sound(sd_warning,0,0);
	}
    draw_sprite(s_indicator, image_index, x, y-16);    
}