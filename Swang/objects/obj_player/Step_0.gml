/// @description Make the player fall
// You can write your code in this editor

if(keyboard_check_pressed(swingPress)) //Create Web
{
	if(!instance_exists(obj_web))
	{
		instance_create_depth(x, y, 0, obj_web);
	}
}

show_debug_message(canJump)
if(!instance_exists(obj_swing) and canJump)
{
	if(!jumping)
	{
		if(keyboard_check(jumpPress))
		{
			frameCount += 1
			if(frameCount >= 8 and frameCount < boostLength + 8)
			{
				var momentum = sqrt(sqr(obj_player.phy_speed_x) + sqr(obj_player.phy_speed_y))
				phy_speed_y = 0
				phy_speed_x = boostSpeed
				canJump = false;
				jumping = false;
			}
		}
		else if(frameCount > 0)
		{
			jumping = true;
			frameCount = 0;
		}
		else
		{
			frameCount = 0
		}
	}
	else if(canJump)
	{
		if(frameCount == 0)
		{
			if(phy_speed_y > 0)
			{
				phy_speed_y = -10;
			}
			else
			{
				phy_speed_y -= 10;
			}
		}
		frameCount += 1
		if(keyboard_check(jumpPress))
		{
			phy_speed_x = 0;
			phy_speed_y = -5;
			canJump = false;
			jumping = false;
			frameCount = 0;
		}
		else if(frameCount >= 8)
		{
			canJump = false;
			jumping = false;
			frameCount = 0;
		}
	}
}
else
{
	canJump = false;
	jumping = false;
	frameCount = 0
}

if(!instance_exists(obj_swing)) //Fall and adjust camera
{
	phy_speed_y += 0.2
}

if(keyboard_check_pressed(restartKey)) //Temporary Restart - Press Backspace
{
	room_goto(rm_game);
}