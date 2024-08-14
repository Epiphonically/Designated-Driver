draw_sprite_ext(Sprite7,image_index,0,0,room_width/8,room_height/8,0,c_white,1);

draw_set_font(fn_default);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

if (keyboard_check_pressed(vk_up)){
	audio_play_sound(sd_gui_0,0,0);
	menu_selected--;
}
if (keyboard_check_pressed(vk_down)){
	audio_play_sound(sd_gui_0,0,0);
	menu_selected++;
}

if menu_selected > array_length(menu_options[menu_level])-1 menu_selected = 0; if menu_selected < 0 menu_selected = array_length(menu_options[menu_level])-1;

menu_selected_smooth = lerp(menu_selected_smooth,menu_selected,0.25);
menu_non_selected_smooth = lerp(menu_non_selected_smooth,menu_selected,0.15);
fx_speed += delta_time/100000;

for (var i = 0; i < array_length(menu_options[menu_level]); i++){
	if (menu_selected == i){
		for (var _i = 0; _i < string_length(menu_options[menu_level,i]); _i++){
			var _subtext = string_copy(menu_options[menu_level,i],_i+1,1);
			var _xfx = sin(fx_speed+(0.5+_i))/2;
			var _yfx = cos(fx_speed+(0.5+_i))/2;
			draw_text_ext_transformed_color(room_width/2 + (7 * _i) - (((string_length(menu_options[menu_level,i])-1) * 7)/2) +_xfx,room_height/2 + (16*i) + 4 - (menu_selected_smooth * 16) +_yfx,_subtext,16,300,1,1,_yfx*8,c_yellow,c_yellow,c_yellow,c_yellow,1);
		}
	}else{
		draw_text(room_width/2,room_height/2 + (16*i) - (menu_non_selected_smooth * 16),menu_options[menu_level,i]);
	}
}

if (keyboard_check_pressed(vk_enter)){
	audio_play_sound(sd_gui_1,0,0);
	switch(menu_level){
		case 0:
			switch(menu_selected){
				case 0:
					audio_stop_sound(sd_menu_song);
					scr_roomTransition(rm_game,Sprite6);
				break;
				case 1:
					menu_selected = 0;
					menu_level = 1;
				break;
				case 2:
					game_end();
				break;
			}
		break;
		case 1:
			switch(menu_selected){
				case 0:
					
				break;
				case 1:
					switch(window_get_fullscreen()){
						case true:
							window_set_fullscreen(false);
						break;
						case false:
							window_set_fullscreen(true);
						break;
					}
				break;
				case 2:
					menu_selected = 0;
					menu_level = 0;
				break;
			}
		break;
	}
}