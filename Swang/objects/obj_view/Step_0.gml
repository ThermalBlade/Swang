/// @description Insert description here
// You can write your code in this editor
trWidth = startingCamWidth + obj_player.phy_speed_x * magnitudeOfChange
if(camWidth < (trWidth - growOutRate))
{
	camWidth += growOutRate;
}
else if(camWidth > (trWidth + growInRate))
{
	camWidth -= growInRate;
}

camera_set_view_size(view_camera[0], camWidth, camWidth * (9/16));

playerXOffset = camWidth - plDistanceFromEdgeofScreen;
maxWebCutoff = floor(camWidth / maxCutoffDem);
shortWebCutoff = floor(camWidth / shortCutoffDem);
maxFallCutoff = floor(camWidth / maxCutoffDem);
shortFallCutoff = floor(camWidth / shortCutoffDem);

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