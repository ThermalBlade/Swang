/// @description Draw Line Until Space Held
// You can write your code in this editor
px = obj_player.x
py = obj_player.y
if(!keyboard_check(swingPress) or length < minimumLine) //Draw Line Until Space Pressed
{
	x = obj_player.x
	y = obj_player.y
	atx = x + length
	aty = y - length
	som  = pixelsInLine
	it = 0
	if(!place_meeting(atx, aty, obj_hookable))
	{
		inst = instance_nearest(atx, aty, obj_hookable);
		aatx = inst.x
		aaty = inst.y
		var xMin = aatx;
		var xMax = inst.image_xscale * sprite_get_width(spr_hookable) + aatx;
		var yMax = inst.image_yscale * sprite_get_height(spr_hookable) + aaty;
		var yMin = aaty;
		newX = atx;
		newY = aty;
		if(atx < xMin and xMin - atx < 50 and aty < yMax and aty > yMin)
		{
			newX = xMin;
			newY = aty;
		}
		xdiff = x - newX
		ydiff = y - newY
		while(it <= som)
		{
			x -= xdiff / som
			y -= ydiff / som
			it += 1
			draw_self();
		}
		draw_sprite(spr_target, 0, x, y)
		length += extendSpeed
	}
	else
	{
		xdiff = x - atx
		ydiff = y - aty
		while(it <= som)
		{
			x -= xdiff / som
			y -= ydiff / som
			it += 1
			draw_self();
		}
		draw_sprite(spr_target, 0, x, y)
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
		rope = sqrt(2 * sqr(length))
		obj_swing.rope = rope
	}
	instance_destroy();
}