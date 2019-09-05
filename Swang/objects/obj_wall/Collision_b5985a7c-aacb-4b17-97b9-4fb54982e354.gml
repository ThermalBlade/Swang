/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_web)){
	with(obj_web){instance_destroy();}
}
if(instance_exists(obj_swing)){
	with(obj_swing){instance_destroy();}
}

var dd = ceil(obj_player.momentum * 16);
obj_player.delay = dd;
obj_gui.delayMax = dd;
if(obj_player.phy_speed_x > obj_player.hitWallPunish){
	obj_player.phy_speed_x = obj_player.hitWallPunish;
}

obj_gui.redAlpha = 0.75;