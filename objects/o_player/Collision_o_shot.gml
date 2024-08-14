if (hsp = 0 && hit = false){
	hp = clamp(hp - 20, 0, maxhp);
	audio_play_sound(sd_hurt,0,0);
	wobble = 0.5;
	hit = true;
}