/// @description Draw Line Until Space Held
// You can write your code in this editor
rope = sqrt(2 * sqr(length))
inst = instance_nearest(atx, aty, obj_hookTracker);
if(!obj_player.shPress or length < minimumLine) //Draw Line Until Space Pressed
{
	extentions += 1;
	x = obj_player.x
	y = obj_player.y
	atx = x + length
	aty = y - length
	som  = rope
	it = 0
	if(!place_meeting(atx, aty, obj_hookable) and inst != "noone" and instance_exists(inst))
	{
		inst.image_alpha = 1;
	}
	xdiff = x - atx
	ydiff = y - aty
	while(it <= som)
	{
		x -= xdiff / som
		y -= ydiff / som
		
		x -= 1;
		draw_self();
		x += 1;
		draw_self();
		x += 1;
		draw_self();
		x -= 1;
		y -= 1;
		draw_self();
		y += 1;
		draw_self();
		y += 1;
		draw_self();
		y -= 1;
		
		it += 1
	}
	draw_sprite(spr_target, 0, x, y);
	if(extentions <= extentionsMax){
		length += extendSpeed
	}
}
else //Create Swing Object
{
	if(place_meeting(x, y, obj_hookable))
	{
		instance_create_depth(0, 0, 0, obj_swing);
		obj_swing.atx = x;
		obj_swing.aty = y;
		obj_swing.rope = rope
	}
	else if(inst != "noone" and instance_exists(inst))
	{
		instance_create_depth(0, 0, 0, obj_swing);
		obj_swing.atx = inst.x;
		obj_swing.aty = inst.y;
		obj_swing.rope = rope		
	}
	instance_destroy();
}