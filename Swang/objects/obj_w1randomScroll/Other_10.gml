/// @description Insert description here
// You can write your code in this editor
with(obj_w1ground){ds_list_clear(blocks);}
randomize();
blockType = irandom_range(0, 0);
type1 = [obj_w1t1building1, obj_w1t1building2, obj_w1t1building3, obj_w1t1building4];
type1Widths = [26, 0, 0, 50];
type1Ender = obj_w1buildingEnd1;
type1EnderWidth = 160;

if(blockType == 0){
	amountOfBlocks = irandom_range(3, 6);
	for(var i = 0; i < amountOfBlocks; i ++){
		var totalWidth = 0;
		with(obj_w1ground){ds_list_add(blocks, obj_w1randomScroll.xHolder);}
		while(totalWidth < blockWidth)
		{
			var alleyWay = irandom_range(0, 1);
			if(alleyWay == 0){xHolder += 70; totalWidth += 70;}
			var newBuildingInt = irandom_range(0, array_length_1d(type1) - 1);
			var newBuilding = type1[newBuildingInt];
			var buildingObject = instance_create_depth(xHolder + type1Widths[newBuildingInt], 0, 0, newBuilding);
			xHolder += buildingObject.wid;
			totalWidth += buildingObject.wid;
		}
		with(obj_w1ground){ds_list_add(blocks, obj_w1randomScroll.xHolder);}
		xHolder += roadWidth;
	}
	var newBuilding = type1Ender;
	var buildingObject = instance_create_depth(xHolder + type1EnderWidth, 0, 0, newBuilding);
	xHolder += buildingObject.wid;
	with(obj_w1ground){ds_list_add(blocks, obj_w1randomScroll.xHolder);}
	with(obj_w1ground){ds_list_add(blocks,room_width);}
}