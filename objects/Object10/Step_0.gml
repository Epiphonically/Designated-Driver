global.a = keyboard_check(ord("A"));
global.d = keyboard_check(ord("D"));

//var 
//
//for (var _i = 0; _i < room_height/16; _i++){
//	for (var _c = 0; _c < _lanes; _c++){
//		
//	}
//	for (var _c = 0; _c < _lanes; _c++){
//		if (_c = 0){
//			draw_tile(TileSet1,2,0,room_width/2 - ((_lanes * 16)/2) + 16*_c,16*_i);
//		}else if (_c == _lanes-1){
//			draw_tile(TileSet1,4,0,room_width/2 - ((_lanes * 16)/2) + 16*_c,16*_i);
//		}else{
//			draw_tile(TileSet1,3,0,room_width/2 - ((_lanes * 16)/2) + 16*_c,16*_i);
//		}
//	}
//}

//Generate Grass
for (var i = 0; i < array_length(grassPieces); i++) {
    var dir = oCar.image_angle - 90;
    var xSpd = lengthdir_x(spd, dir);
    var ySpd = lengthdir_y(spd, dir);
    var xx = grassPieces[i][0] + xSpd;
    var yy = grassPieces[i][1] + ySpd;
	draw_tile(_tileSet,6,0,xx,yy);
    //draw_sprite(sGrass, 0, xx, yy);
    grassPieces[i][0] = xx;
    grassPieces[i][1] = yy;
}

if (grassPieces[array_length(grassPieces) - 1][1] > room_height+128) {
    for (var j = array_length(grassPieces) - 1; j >= grassLen; j--) {
        grassPieces[j][0] = grassPieces[j - grassLen][0];
        grassPieces[j][1] = grassPieces[j - grassLen][1];
    }
    for (var j = 0; j < grassLen; j++) {
        grassPieces[j][0] = grassPieces[j + grassLen][0];
        grassPieces[j][1] = grassPieces[j + grassLen][1] - 16;
		
    }
} 

if (grassPieces[array_length(grassPieces) - 1][0] > (camera_get_view_width(view_camera[0])/2) + (room_width/2)) {
    for (var i = grassLen; i > 1; i--) {
        for (var j = 0; j < grassLen; j++) {
            grassPieces[(i + (grassLen * j)) - 1][0] = grassPieces[(i + (grassLen * j)) - 2][0];
            grassPieces[(i + (grassLen * j)) - 1][1] = grassPieces[(i + (grassLen * j)) - 2][1];
        }
    }
    for (var i = 0; i < grassLen; i++) {
        grassPieces[grassLen * i][0] = grassPieces[(grassLen * i) + 1][0] - 16;
        grassPieces[grassLen * i][1] = grassPieces[(grassLen * i) + 1][1];
    }
}

if (grassPieces[0][0] < (room_width/2) - (camera_get_view_width(view_camera[0])/2)) {
    for (var i = 0; i < grassLen - 1; i++) {
        for (var j = 0; j < grassLen; j++) {
            grassPieces[(i + (grassLen * j))][0] = grassPieces[(i + (grassLen * j)) + 1][0];
            grassPieces[(i + (grassLen * j))][1] = grassPieces[(i + (grassLen * j)) + 1][1];
        }
    }
    for (var i = 1; i <= grassLen; i++) {
        grassPieces[(grassLen * i) - 1][0] = grassPieces[(grassLen * i) - 2][0] + 16;
        grassPieces[(grassLen * i) - 1][1] = grassPieces[(grassLen * i) - 2][1];
    }
}
