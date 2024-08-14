draw_set_font(fn_default);

fx_speed += delta_time/100000;

var statsX = (window_get_width() * 5) / 6;
var statsY = 20;
if (global.w){
	for (var _i = 0; _i < string_length("Score:" + string(points)); _i++){
		var _subtext = string_copy("Score:" + string(points),_i+1,1);
		var _xfx = sin(fx_speed+(0.5+_i))/2;
		var _yfx = cos(fx_speed+(0.5+_i))/2;
		draw_text_ext_transformed_color(statsX + (14 * _i)-42+(_xfx*2),statsY+8+(_yfx*2),_subtext,16,300,2,2,_yfx*8,c_yellow,c_yellow,c_yellow,c_yellow,1);
	}
}else{
	draw_text_transformed(statsX, statsY, string("Score:" + string(points)), 2, 2, 0);
}
draw_text_transformed(25, 20, "HP:", 2, 2, 0);
draw_rectangle(50, 15, 50 + o_player.hp, 19, false);

