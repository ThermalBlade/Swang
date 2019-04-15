/// @description Make the player fall
// You can write your code in this editor
if(!instance_exists(obj_qLearning))
{
	sPress = keyboard_check_pressed(swingPress);
	shPress = keyboard_check(swingPress);
}
if(sPress) //Create Web
{
	if(!instance_exists(obj_web))
	{
		instance_create_depth(x, y, 0, obj_web);
	}
}

if(!instance_exists(obj_swing) and keyboard_check(jumpPress) and frameCount < framesToBoost and !firstPress and !forceWait) //Jumping and Boosting
{
	frameCount += 1;
}
else if(!instance_exists(obj_swing) and frameCount > 0)
{
	if(!firstPress)
	{
		firstPress = true;
		momentum = sqrt(sqr(obj_player.phy_speed_x) + sqr(obj_player.phy_speed_y))
	}
	if(frameCount >= framesToBoost and frameCount < boostTime and keyboard_check(jumpPress) and canBoost)
	{
		if(momentum > boostSpeed)
		{
			phy_speed_x = boostSpeed + (momentum / 3);
		}
		else
		{
			phy_speed_x = boostSpeed
		}
		phy_speed_y = 0;
		frameCount += 1;
	}
	else if(frameCount >= framesToBoost)
	{
		frameCount = 0;
		firstPress = false;
		canBoost = false;
		if(keyboard_check(jumpPress))
		{
			forceWait = true;
		}
	}
	else if(jumpFrameCount < 1)
	{
		if(jumped < 2 and canJump and forceWait == false)
		{
			if(phy_speed_y < 0)
			{
				phy_speed_y -= jumpSpeed;
			}
			else
			{
				phy_speed_y = -jumpSpeed;
			}
			jumped += 1;
			forceWait = true;
			if(jumped == 2)
			{
				canJump = false;
			}
		}
		jumpFrameCount += 1;
	}
	else
	{
		firstPress = false;
		frameCount = 0;
		jumpFrameCount = 0;
		if(keyboard_check(jumpPress))
		{
			forceWait = true;
		}
	}
}

if(forceWait = true and !keyboard_check(jumpPress)) //Force new click for jump/boost
{
	forceWait = false;
}

if(!instance_exists(obj_swing)) //Fall and adjust camera
{
	phy_speed_y += fallSpeed;
}

if(keyboard_check_pressed(restartKey)) //Temporary Restart - Press Backspace
{
	room_goto(rm_game);
}