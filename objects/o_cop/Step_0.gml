x = lerp(x, o_player.x, 0.1);

y = lerp(y, o_player.y + sprite_get_height(s_car) + 15, 0.1);


image_angle = lerp(image_angle, o_player.image_angle, 0.1);
spd = o_game.spd;


if (aiming > 0) {
    aiming--;    
    if (aiming > 30) {
        shootDir = point_direction(x, y, o_player.x, o_player.y) + 90;
    } else {
        indicator = true;    
    }
} else {
    aiming = 200;
    indicator = false;
    var shot = instance_create_layer(x, y, "Obstacles", o_shot);
    shot.image_angle = shootDir;
}