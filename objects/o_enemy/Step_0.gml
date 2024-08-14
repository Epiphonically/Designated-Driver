randomize();

y += o_game.spd - spd;
if (stop) {
    spd = lerp(spd, 0, 0.05);
    image_angle = lerp(image_angle, targetAngle, 0.1);
} else if (flying) {
    sprite_index = noone;
    x += dir * 3;
    spd = 5;
    image_xscale = sin(counter);
    image_angle += 4;
    counter += 0.25;
} else {
    if (swapping == false) {
        image_angle = lerp(image_angle,0,0.25);
        var neighbor = instance_place(x, y - sight, o_enemy);
        if (neighbor != noone) {

            if (laneNum == totalLanes - 1 && instance_place(x - 16, y, o_enemy) == noone) {
                swapping = true;
                target = x - 16;
                laneNum--;
            } else if (laneNum == 0 && instance_place(x + 16, y, o_enemy) == noone) {
                swapping = true;
                target = x + 16;
                laneNum++;
            } else if (laneNum != 0 && laneNum != totalLanes -1 && instance_place(x + 16, y, o_enemy) == noone && instance_place(x - 16, y, o_enemy) == noone) {
                swapping = true;
                var choice = choose(-1, 1);
                laneNum += choice;
                target = x + (16 * choice);
            } else if (neighbor.id != o_cop.id) {
                spd = neighbor.spd;
            }
        } 
    } else {
        if (target < x) {
            x -= 1;
            image_angle = lerp(image_angle,20,0.1);
        } else if (target > x) {
            x += 1;
            image_angle = lerp(image_angle,-20,0.1);
        } else if (x == target) {
            swapping = false;
        }
    }
    if (y > room_height + sprite_get_height(s_car)) {
        instance_destroy();    
    }
}