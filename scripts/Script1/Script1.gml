// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_roomTransition(_room,_animationSprite,_stopMusic,_stopSFX,_spawnPlayer, _playerController,_x,_y){
	if (!instance_exists(o_roomTransitionHandler)){
		var _rm = instance_create_layer(x,y,"Globals",o_roomTransitionHandler);
		with (_rm){
			room_target = _room;
			sprite_index = _animationSprite;
		}
	}
}