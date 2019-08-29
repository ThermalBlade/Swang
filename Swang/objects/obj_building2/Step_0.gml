/// @description Insert description here
// You can write your code in this editor
if(obj_player.phy_position_x >= x + 150 and swapped == false){
	a = instance_create_depth(x - 1500, y, -1, obj_building2);
	a.swapped = true;
	/*for(var i = 0; i < instance_number(obj_building); i ++)
	{
		with(instance_find(obj_building, i)){instance_destroy();}
	}*/
	with(obj_massBuilding){instance_destroy();}
	obj_player.phy_position_x -= 1500;
	if(instance_exists(obj_swing)){
		obj_swing.atx -= 1500;
	}
	swapped = true;
	ender = true;
}
if(ender == true)
{
	enderCounter += 1;
	if(enderCounter == 3){
		instance_destroy();
	}
}