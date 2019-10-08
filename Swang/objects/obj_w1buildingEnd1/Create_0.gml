/// @description Insert description here
// You can write your code in this editor

//Unqiue Features
wid = 1100;
sideWidth = 160;
sel = obj_w1buildingEnd1

//Non-unique features
depth = 1;
y = room_height - 5;
insta = instance_create_depth(x, y - (sprite_height / 2), 0, obj_hookable);
insta.image_xscale = sprite_width / 10;
insta.image_yscale = sprite_height / 10;
reDid = false;
swapped = false;
ender = false;
readyForDestroy = false;
enderCounter = 0;

goBackToPoint = 0;
