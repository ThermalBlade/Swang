/// @description Insert description here
// You can write your code in this editor
wid = sprite_width;

depth = 1;
y = room_height - 5;
insta = instance_create_depth(x, y - (sprite_height / 2), 0, obj_hookable);
insta.image_xscale = sprite_width / 10;
insta.image_yscale = sprite_height / 10;