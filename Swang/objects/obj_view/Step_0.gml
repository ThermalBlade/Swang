/// @description Insert description here
// You can write your code in this editor
x = obj_player.x + playerXOffset;
y = obj_player.phy_position_y - playerYOffset + yOffset

if(instance_exists(obj_web) and yOffset > -maxWebCutoff) //Look upward, shooting web
{
	if(yOffset > -shortWebCutoff)
	{
		yOffset -= 2;
	}
	else if(yOffset > -maxWebCutoff)
	{
		yOffset -= 1;
	}
}
else if(obj_player.phy_speed_y > 0 and yOffset < maxFallCutoff and !instance_exists(obj_web))
{
	if(yOffset < shortFallCutoff)
	{
		yOffset += 2;
	}
	else if(yOffset < maxFallCutoff)
	{
		yOffset += 1;
	}
}
else if(yOffset > 0 and obj_player.phy_speed_y <= 0)
{
	if((yOffset % 2) == 1)
	{
		yOffset += 1;
	}
	yOffset -= 2;
}
else if(yOffset < 0 and !instance_exists(obj_web))
{
	if((yOffset % 2) == 1)
	{
		yOffset -= 1;
	}
	yOffset += 2;
}
show_debug_message(yOffset)