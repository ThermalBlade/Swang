/// @description Insert description here
// You can write your code in this editor
randomize();
blockType = irandom_range(0, 0);
type1 = [obj_w1t1building1, obj_w1t1building2];
type1Widths = [26, 0];
xHolder = 80;

if(blockType == 0){
	for(var i = 0; i < 20; i ++)
	{
		var newBuildingInt = irandom_range(0, array_length_1d(type1) - 1);
		var newBuilding = type1[newBuildingInt];
		var buildingObject = instance_create_depth(xHolder + type1Widths[newBuildingInt], 0, 0, newBuilding);
		xHolder += buildingObject.wid;
	}
}