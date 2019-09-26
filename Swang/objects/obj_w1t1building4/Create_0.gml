/// @description Insert description here
// You can write your code in this editor
image_speed = 0;
image_index = 0;

depth = 1;
y = room_height - 4;

//Unique Features
wid = sprite_width + 100;

//Non-unique Features
insta = instance_create_depth(x, y - (sprite_height / 2), 0, obj_hookable);
insta.image_xscale = sprite_width / 10;
insta.image_yscale = sprite_height / 10;