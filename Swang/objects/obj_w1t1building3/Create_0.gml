/// @description Insert description here
// You can write your code in this editor
wid = sprite_width;

depth = 1;
y = room_height - 5;
insta = instance_create_depth(x + 740, y - (sprite_height / 2) + 28, 0, obj_hookable);
insta.image_xscale = 4.7;
insta.image_yscale = (sprite_height / 10) - 5.6;

insta2 = instance_create_depth(x + 94, y - (sprite_height / 2) + 28, 0, obj_hookable);
insta2.image_xscale = 69.3;
insta2.image_yscale = .5;