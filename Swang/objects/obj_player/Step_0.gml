/// @description Make the player fall
// You can write your code in this editor

momentum = sqrt(sqr(obj_player.phy_speed_x) + sqr(obj_player.phy_speed_y))
var is = 3 + (1.2 * momentum)
if(is > 12)
{
	is = 12;
}
image_speed = is;

sPress = keyboard_check_pressed(swingPress);
shPress = keyboard_check(swingPress);
jPress = keyboard_check(jumpPress);
	
if(sPress and startNoSpamTimer == false) //Create Web
{
	if(!instance_exists(obj_web))
	{
		instance_create_depth(x, y, 0, obj_web);
		startNoSpamTimer = true;
		whereInSwing = 1;
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
	}
	boosting = false;
	if(frameCount >= framesToBoost and keyboard_check(jumpPress) and fuel > 0)
	{
		if(momentum > boostSpeed)
		{
			phy_speed_x = momentum;
		}
		else
		{
			phy_speed_x = boostSpeed;
		}
		boosting = true;
		fuel -= boostFuelLoss;
		phy_speed_y = 0;
		frameCount += 1;
	}
	else if(frameCount >= framesToBoost)
	{
		frameCount = 0;
		firstPress = false;
		if(keyboard_check(jumpPress))
		{
			forceWait = true;
		}
	}
	else if(jumpFrameCount < 1)
	{
		if(canJump and forceWait == false and fuel >= 20)
		{
			if(phy_speed_y < 0)
			{
				phy_speed_y -= jumpSpeed;
			}
			else
			{
				phy_speed_y = -jumpSpeed;
			}
			forceWait = true;
			fuel -= jumpFuelLoss;
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
else
{
	firstPress = false;
}

if(forceWait == true and !keyboard_check(jumpPress)) //Force new click for jump/boost
{
	forceWait = false;
}

if(!instance_exists(obj_swing) and boosting == false) //Fall
{
	phy_speed_y += fallSpeed;
}

if(keyboard_check_pressed(restartKey)) //Temporary Restart - Press Backspace
{
	room_goto(rm_game);
}

if(fuel < 0){
	fuel = 0;
}
else if(fuel > 80){
	fuel = 80;
}

if(startNoSpamTimer == true){
	newRopeTimer += 1;
	if(newRopeTimer > newRopeTimerMax){
		startNoSpamTimer = false;
		newRopeTimer = 0;
	}
}