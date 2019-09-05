/// @description Insert description here
// You can write your code in this editor
randomize();
depth = 1;
y = room_height - 4;

//Unique Features
wid = sprite_get_width(spr_w11b12);
coinFlip = irandom_range(0, 1);
if(coinFlip == 0)
{
	greenSign = instance_create_depth(x + 15, y - 437, -50, obj_w1greenHotelSign);
	greenSignFloor = instance_create_depth(x + 15, y - 437, -50, obj_w1greenHotelSign1Floor);
	floorProtectPixel = instance_create_depth(x + 15, y - 436, -50, obj_wall1pixel);
}
else{
	greenSign = 0;
	greenSignFloor = 0;
	floorProtectPixel = 0;
}

//Non-unique Features
insta = instance_create_depth(x, y - (sprite_height / 2), 0, obj_hookable);
insta.image_xscale = sprite_width / 10;
insta.image_yscale = sprite_height / 10;