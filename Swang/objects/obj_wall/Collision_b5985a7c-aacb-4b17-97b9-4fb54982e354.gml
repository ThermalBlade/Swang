/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_web)){
	with(obj_web){instance_destroy();}
}
if(instance_exists(obj_swing)){
	with(obj_swing){instance_destroy();}
}
obj_player.delay = obj_player.delayTime;
if(obj_player.phy_speed_x > obj_player.hitWallPunish){
	obj_player.phy_speed_x = obj_player.hitWallPunish;
}