/// @description Insert description here
// You can write your code in this editor
if(obj_player.phy_position_x >= x + 150 and swapped == false){
	var goBackToPoint = obj_player.phy_position_x - 200;
	a = instance_create_depth(x - goBackToPoint, y, -1, obj_building2);
	a.swapped = true;
	with(insta){instance_destroy();}
	/*for(var i = 0; i < instance_number(obj_building); i ++)
	{
		with(instance_find(obj_building, i)){instance_destroy();}
	}*/
	with(obj_massBuilding){instance_destroy();}
	obj_player.phy_position_x -= goBackToPoint;
	if(instance_exists(obj_swing)){
		obj_swing.atx -= goBackToPoint;
	}
	if(instance_exists(obj_web)){
		obj_web.atx -= goBackToPoint;
	}
	swapped = true;
	ender = true;
}
if(ender == true)
{
	enderCounter += 1;
	if(enderCounter == 2){
		instance_destroy();
	}
}