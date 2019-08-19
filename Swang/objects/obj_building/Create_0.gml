/// @description Insert description here
// You can write your code in this editor
depth = 1;
y = room_height;
insta = instance_create_depth(x, y - (sprite_height / 2), 0, obj_hookable);
insta.image_xscale = sprite_width / 10;
insta.image_yscale = sprite_height / 10;
instance_create_depth(x + 15, y - 437, -50, obj_w1greenHotelSign);