global.a = keyboard_check(ord("A"));
global.d = keyboard_check(ord("D"));
global.w = keyboard_check(ord("W"));
global.s = keyboard_check(ord("S"));
var _tileSet = ts_texture;
var _lanes = 5;
var _buffer = 96;


if (yy > 0){
    yy -= spd;
}else{
    yy = 15;
}

for (var _i = 0; _i < (room_height/16) + _buffer; _i++){

    for (var _c = 0; _c < (room_width/16) + _buffer; _c++){
        draw_tile(_tileSet,6,0,16 * _c - _buffer,(16 * _i) - yy - _buffer);
    }
    
    for (var _c = 0; _c < _lanes+2; _c++){
        if (_c == 0){ ///Very first tile, railing
            draw_tile(_tileSet,1,0,room_width/2 - (((_lanes+2) * 16)/2) + 16 * _c,(16 * _i) - yy - _buffer);
        }else if (_c == 1){    ////Second tile, outer road
            draw_tile(_tileSet,2,0,room_width/2 - (((_lanes+2) * 16)/2) + 16 * _c,(16 * _i) - yy - _buffer);
        }else if (_c == _lanes+2-2){ ////Second to Last Piece of tiling, outer road
            draw_tile(_tileSet,4,0,room_width/2 - (((_lanes+2) * 16)/2) + 16 * _c,(16 * _i) - yy - _buffer);
        }else if (_c == _lanes+2-1){ ////Last Piece of Tiling
            draw_tile(_tileSet,5,0,room_width/2 - (((_lanes+2) * 16)/2) + 16 * _c,(16 * _i) - yy - _buffer);
        }else{ ////Filler Tiling
            draw_tile(_tileSet,3,0,room_width/2 - (((_lanes+2) * 16)/2) + 16 * _c,(16 * _i) - yy - _buffer);
        }
    }
    
}
if (!instance_exists(o_wall)){
    instance_create_depth(((room_width / 2) - (16 * (_lanes / 2))-24) + 8,0,-1,o_wall,
    {
        image_xscale: 1,
        image_yscale: 32
    });
    instance_create_depth(((room_width / 2) + (16 * (_lanes / 2))-8) + 8,0,-1,o_wall,
    {
        image_xscale: 1,
        image_yscale: 32
    });
}

/////////////////////

distance += spd;
if (distance >= enemySep) {
    var spawnLane = irandom(_lanes - 1);
    var xx = 16 * spawnLane + ((room_width / 2) - (16 * (_lanes / 2))) + 8;
    var chance = random(1) * 100;
    if (chance >= 50) {
		if (instance_place(xx, -1 * sprite_get_height(s_car),o_enemy) = noone){
			var enemy = instance_create_layer(xx, -1 * sprite_get_height(s_car), "Obstacles", o_enemy);
	        enemy.colorVal = choose(c_maroon, c_aqua, c_orange, c_gray, c_red);
	        enemy.spd = random_range(0.3 * trueSpd, 0.6 * trueSpd);
	        enemy.laneNum = spawnLane;
	        enemy.totalLanes = _lanes;
		}
    }
    distance = 0;
}

distance2 += spd;
if (distance2 >= dropSep) {
    var spawnLane = irandom(_lanes - 1);
    var xx = 16 * spawnLane + ((room_width / 2) - (16 * (_lanes / 2))) + 8;
    var chance = random(1) * 100;
    if (chance >= 50) {
        var drop = instance_create_layer(xx, -2 * sprite_get_height(s_drop), "Obstacles", o_drop);
        drop.dropType = irandom(4);
    }
    distance2 = 0;
}

if (!instance_exists(o_cop)) {
    instance_create_layer(o_player.x, o_player.y + sprite_get_height(s_car) + 15,"Obstacles", o_cop);
}

if (promptRetry){
	draw_text(room_width/2,room_height/2,"Try Again?");
	draw_text_transformed(room_width/2,room_height/2-32,"PRESS ENTER TO RETRY",0.5,0.5,0);
	if (keyboard_check_pressed(vk_enter)){
		room_restart();
	}
}