/// @description Insert description here
// You can write your code in this editor
wid = sprite_width;

depth = 1;
y = room_height - 5;
insta = instance_create_depth(x + 740, y - (sprite_height / 2) + 28, 0, obj_hookable);
insta.image_xscale = 4.7;
insta.image_yscale = (sprite_height / 10) - 5.6;

insta2 = instance_create_depth(x + 94, y - (sprite_height) + 56 + 15.5, 0, obj_hookable);
insta2.image_xscale = 69.3;
insta2.image_yscale = 3.1;

insta3 = instance_create_depth(x + 149, y - (sprite_height) + 250 + 8, 0, obj_hookable);
insta3.image_xscale = 12.4;
insta3.image_yscale = 1.6;

theHazard = instance_create_depth(x + 149, y - sprite_height + 250, -50, obj_w1b3hazard);
theHazardFloor = instance_create_depth(x + 149, y - sprite_height + 250, -50, obj_w1b3hazardFloor);