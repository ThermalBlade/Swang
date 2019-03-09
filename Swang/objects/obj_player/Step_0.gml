/// @description Make the player fall
// You can write your code in this editor

if(keyboard_check_pressed(swingPress)) //Create Web
{
	if(!instance_exists(obj_web))
	{
		instance_create_depth(x, y, 0, obj_web);
	}
}

if(!instance_exists(obj_swing))
{
	show_debug_message(frameCount)
	if(!jumping)
	{
		if(keyboard_check(jumpPress))
		{
			frameCount += 1;
			if(frameCount >= 8 and frameCount < boostLength + 8 and canBoost) //Boosting
			{
				if(momentumSet)
				{
					curMomentum = sqrt(sqr(obj_player.phy_speed_x) + sqr(obj_player.phy_speed_y));
					momentumSet = false;
				}
				phy_speed_y = 0;
				phy_speed_x = curMomentum;
				jumping = false;
			}
		}
		else if(frameCount > 0 and frameCount < 8)
		{
			jumping = true;
			frameCount = 0;
		}
		else if(frameCount >= 8)
		{
			momentumSet = true;
			canBoost = false;
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
				phy_speed_y = -jumpSpeed;
			}
			else
			{
				phy_speed_y -= jumpSpeed;
			}
		}
		frameCount += 1
		if(keyboard_check(jumpPress) and !doubleJumped)
		{
			phy_speed_x = 0;
			phy_speed_y = -doubleJumpSpeed;
			doubleJumped = true;
		}
		else if(frameCount >= 8)
		{
			canJump = false;
			jumping = false;
			doubleJumped = false;
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
	phy_speed_y += 0.1;
}

if(keyboard_check_pressed(restartKey)) //Temporary Restart - Press Backspace
{
	room_goto(rm_game);
}