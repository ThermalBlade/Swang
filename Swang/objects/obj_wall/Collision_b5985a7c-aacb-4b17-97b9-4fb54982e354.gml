/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_web)){
	with(obj_web){instance_destroy();}
}
if(instance_exists(obj_swing)){
	with(obj_swing){instance_destroy();}
}

//var dd = ceil((abs(obj_player.phy_speed_x) + abs(obj_player.phy_speed_y)) * 30);
obj_player.delay = wallPunish;
obj_gui.delayMax = wallPunish;
if(obj_player.phy_speed_x > obj_player.hitWallPunish){
	obj_player.phy_speed_x = obj_player.hitWallPunish;
}

obj_gui.redAlpha = 0.75;