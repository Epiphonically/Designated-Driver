if (hp <= 0) {
    global.gameOver = true;    
}
var enemy = instance_place(x, y - 1, o_enemy)
if (enemy != noone && !global.gameOver) {
	repeat(30){
		instance_create_layer(x,y,"Obstacles",o_particle);
	}
    enemy.spd = o_game.spd;
    randomize();
    enemy.targetAngle = irandom_range(-90, 90);
    enemy.stop = true;
    global.gameOver = true;
}else if (!global.gameOver) {
	counter += 0.5;
    if (keyboard_check(ord("A"))){
        image_index = 2;
        image_angle = lerp(image_angle,20,0.1);

        instance_create_depth(x,y,-1,Object5,{
			image_angle: o_player.image_angle
		});


        if (image_angle > 15){
            image_index = 0;
        }
        hsp = lerp(hsp,-player_spd,0.25);
    }else if (keyboard_check(ord("D"))){
        image_index = 1;
        image_angle = lerp(image_angle,-20,0.1);
    
        instance_create_depth(x,y,-1,Object5,{
			image_angle: o_player.image_angle
		});
		
        if (image_angle < -15){
            image_index = 0;
        }
        hsp = lerp(hsp,player_spd,0.25);
    }else{
        hsp = lerp(hsp,0,0.15);
        image_index = 0;
        image_angle = lerp(image_angle,0,0.25);
    }
    if (place_meeting(x+hsp,y,o_wall)){
		var enemy = instance_place(x + hsp, y, o_enemy) {
		            if (enemy != noone) {
		                if (x > enemy.x) {
		                    if (enemy.laneNum > 0 && instance_place(enemy.x - 16, enemy.y, o_enemy) == noone && !enemy.swapping) {
		                        enemy.swapping = true;
		                        enemy.target = enemy.x - 16;
		                        enemy.laneNum--;    
		                    }
		                } else if (x < enemy.x) {
		                    if (enemy.laneNum < enemy.totalLanes-1 && instance_place(enemy.x + 16, enemy.y, o_enemy) == noone && !enemy.swapping) {
		                        enemy.swapping = true;
		                        enemy.target = enemy.x + 16;
		                        enemy.laneNum++;    
		                    }
		                }
		            }
		        }
        image_angle = 0;
        hsp = -(hsp*1.25);
		audio_play_sound(sd_hurt,0,0);
        hp -= 20;
		repeat(30){
			instance_create_layer(x,y,"Obstacles",o_particle);
		}
		
        wobble = 2;
        if (sign(hsp) == -1) {
            counter = pi;    
        } else {
            counter = 0;    
        }
    }

    if (skid_fx_timer > 0){
        skid_fx_timer--;
    }
    if (wobble > 0) {
        wobble = lerp(wobble, 0, 0.1);    
        x += wobble * sin(counter);
        image_angle = lerp(image_angle, 20 * sign(sin(counter)), 0.1);
    }
    x += hsp;

    direction = image_angle;

    if (o_game.spd > 2){
		if (image_angle > 0) {
            instance_create_depth(x-4,y+16,-1,Object4);
            instance_create_depth(x+4,y+16 + abs(image_angle),-1,Object4);
        } else {
            instance_create_depth(x-4,y+16 + abs(image_angle),-1,Object4);
            instance_create_depth(x+4,y+16,-1,Object4);
        }
    }
}else if (global.gameOver){
	instance_create_depth(x,y,-1,Object5,{
		image_angle: o_player.image_angle
	});
}