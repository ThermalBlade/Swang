/// @description Insert description here
// You can write your code in this editor
angle = point_direction(obj_player.x, obj_player.y, atx, aty)
xdiff = atx - obj_player.x
ydiff = aty - obj_player.y
len = sqrt(sqr(xdiff) + sqr(ydiff))
if(len > rope and snag == 0) //If Rope Snags
{
	var px = obj_player.x
	var py = obj_player.y
	if(px < atx and py > aty)
	{	
		snag = 1;
		momentum = sqrt(sqr(obj_player.phy_speed_x) + sqr(obj_player.phy_speed_y))
	}
	else if(px >= atx and py > aty)
	{
		snag = 1;
		momentum = obj_player.phy_speed_x;
	}
	else
	{
		instance_destroy();
	}
}
if(snag == 1) //Circular Motion
{
	if(obj_player.x < atx)
	{
		negCos = cos(angle * (pi / 180))
		negSin = sin(angle * (pi / 180))
		obj_player.phy_speed_y = momentum * negCos
		obj_player.phy_speed_x = momentum * negSin
		momentum += negSin * obj_player.fallSpeed
	}
	else if(obj_player.y > aty and momentum > 0)
	{
		negCos = cos(angle * (pi / 180))
		negSin = sin(angle * (pi / 180))
		obj_player.phy_speed_y = momentum * negCos
		obj_player.phy_speed_x = momentum * negSin
		momentum -= negSin * obj_player.fallSpeed
	}
	else
	{
		instance_destroy();
	}
}
else
{
	obj_player.phy_speed_y += obj_player.fallSpeed
}

if(obj_player.jPress)
{
	if(!snag)
	{
		rope -= 2;
	}
	else
	{
		rope -= 2;
		obj_player.phy_position_x += 2 * negCos
		obj_player.phy_position_y -= 2 * negSin
		obj_player.forceWait = true;
	}
}