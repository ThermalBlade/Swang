/// @description Insert description here
// You can write your code in this editor

if(swapped == true and reDid == false){
	var b = goBackToPoint
	var newXHolder = x + sprite_width + sideWidth + obj_w1randomScroll.roadWidth;
	with(obj_w1randomScroll){xHolder = newXHolder;  x -= b; event_user(0);}
	reDid = true;
	readyForDestroy = true;
}
if(readyForDestroy == true){
	if(obj_player.phy_position_x > 3000){
		instance_destroy();
	}
}

if(obj_player.phy_position_x >= x and swapped == false){
	goBackToPoint = obj_player.phy_position_x - 200;
	a = instance_create_depth(x - goBackToPoint, y, -1, sel);
	a.swapped = true;
	a.goBackToPoint = goBackToPoint;
	with(insta){instance_destroy();}
	with(obj_massBuilding){instance_destroy();}
	obj_player.phy_position_x -= goBackToPoint;
	if(instance_exists(obj_swing)){
		obj_swing.atx -= goBackToPoint;
	}
	if(instance_exists(obj_web)){
		obj_web.atx -= goBackToPoint;
	}
	swapped = true;
	reDid = true;
	ender = true;
}

if(ender == true)
{
	enderCounter += 1;
	if(enderCounter == 2){
		instance_destroy();
	}
}