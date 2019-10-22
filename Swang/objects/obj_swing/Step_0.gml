/// @description Insert description here
// You can write your code in this editor
angle = point_direction(obj_player.x, obj_player.y, atx, aty)
xdiff = atx - obj_player.x
ydiff = aty - obj_player.y
len = sqrt(sqr(xdiff) + sqr(ydiff))
obj_player.fuel += swingFuelGain;
if(len > rope and snag == 0 and !goingUp) //If Rope Snags
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
	else if(px >= atx and py < aty)
	{
		instance_destroy();
	}
}
else if(obj_player.trueRunning == true and len > rope and !goingUp)
{
	snag = 0;
	momentum = obj_player.phy_speed_x;
}

if(goingUp){
	if(!obj_player.jPress or obj_player.x > atx ){
		instance_destroy();
	}
	obj_player.phy_speed_x = 10 * xAngle;
	obj_player.phy_speed_y = 10 * yAngle * yjuster;
}
else if(snag == 1) //Circular Motion
{
	if(obj_player.x < atx)
	{
		negCos = cos(angle * (pi / 180))
		negSin = sin(angle * (pi / 180))
		obj_player.phy_speed_y = momentum * negCos;
		if(obj_player.trueRunning == false)
		{
			obj_player.phy_speed_x = momentum * negSin;
			momentum += negSin * obj_player.fallSpeed
		}
		else
		{
			momentum = obj_player.phy_speed_x;
		}
	}
	else if(obj_player.y > aty and momentum > 0)
	{
		negCos = cos(angle * (pi / 180))
		negSin = sin(angle * (pi / 180))
		obj_player.phy_speed_y = momentum * negCos;
		if(obj_player.trueRunning == false)
		{
			obj_player.phy_speed_x = momentum * negSin;
			momentum -= negSin * obj_player.fallSpeed;
		}
		else
		{
			momentum = obj_player.phy_speed_x;
		}
	}
	else
	{
		instance_destroy();
	}
}
else if(!goingUp)
{
	obj_player.phy_speed_y += obj_player.fallSpeed
}

if(obj_player.jPress)
{
	obj_player.forceWait = true;
	var xd = abs(atx - obj_player.x);
	var yd = abs(aty - obj_player.y);
	xAngle = xd/abs(xd + yd);
	yAngle = yd/abs(xd + yd);
	if(obj_player.y > aty){yjuster = -1;}else{yjuster = 1;}
	goingUp = true;
	/*obj_player.forceWait = true;
	obj_player.fuel -= pullFuelLoss;
	if(snag == 0)
	{
		rope -= 2;
	}
	else
	{
		rope -= 2;
		obj_player.phy_position_x += (momentum / 2) * negCos;
		obj_player.phy_position_y -= (momentum / 2) * negSin;
	}*/
}