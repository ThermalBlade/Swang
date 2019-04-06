/// @description Insert description here
// You can write your code in this editor
depth = -10
aatx = inst.x
aaty = inst.y
var xMin = inst.x;
var xMax = aatx + (inst.image_xscale * sprite_get_width(spr_hookable));
var yMin = aaty - (inst.image_yscale * sprite_get_height(spr_hookable) / 2);
var yMax = aaty + (inst.image_yscale * sprite_get_height(spr_hookable) / 2);

if(instance_exists(obj_web))
{
	atx = obj_web.atx
	aty = obj_web.aty
	if(aty < y)
	{
		while(y > aty and y > yMin)
		{
			y -= 1;
		}
	}
	else if(aty > y)
	{
		while(y < aty and y < yMax)
		{
			y += 1;
		}
	}
	
	if(atx > x)
	{
		while(x < atx and x < xMax)
		{
			x += 1;
		}
	}
	else if(atx < x)
	{
		while(x > atx and x > xMin)
		{
			x -= 1;
		}
	}
}
else
{
	atx = obj_player.x
	aty = obj_player.y
	if(aty < y)
	{
		while(y > aty and y > yMin)
		{
			y -= 1;
		}
	}
	else if(aty > y)
	{
		while(y < aty and y < yMax)
		{
			y += 1;
		}
	}
	
	if(atx > x)
	{
		while(x < atx and x < xMax)
		{
			x += 1;
		}
	}
	else if(atx < x)
	{
		while(x > atx and x > xMin)
		{
			x -= 1;
		}
	}
}

if(!instance_exists(obj_web))
{
	image_alpha = 0;
}
else if(place_meeting(obj_web.atx, obj_web.aty, obj_hookable))
{
	image_alpha = 0;
}