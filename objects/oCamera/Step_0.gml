camera_set_view_size(view_camera[0], width, height);
if (instance_exists(o_player)) {
    camera_set_view_pos(view_camera[0], o_player.x - (width / 2), o_player.y - (height / 2) - 32);
}
camera_set_view_angle(view_camera[0], lerp(camera_get_view_angle(view_camera[0]), (o_player.image_angle*2) * -1 + boost, 0.1));
if (boost != 0) {
    timer--;
}
if (timer == 0) {
    boost = 0;    
}