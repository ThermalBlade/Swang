/// @description Make the player fall
// You can write your code in this editor
boosting = false;

momentum = sqrt(sqr(obj_player.phy_speed_x) + sqr(obj_player.phy_speed_y))
var is = 3 + (1.2 * momentum)
if(is > 12)
{
	is = 12;
}
image_speed = is;

if(delay == 0)
{
	sPress = keyboard_check_pressed(swingPress);
	shPress = keyboard_check(swingPress);
	jPress = keyboard_check(jumpPress);
}
else{
	sPress = 0;
	shPress = 0;
	jPress = 0;
	delay -= 1;
}

if(sPress and startNoSpamTimer == false) //Create Web
{
	if(!instance_exists(obj_web))
	{
		instance_create_depth(x, y, 0, obj_web);
		startNoSpamTimer = true;
		whereInSwing = 1;
	}
}

if(running == true and delay == 0){
	trueRunning = true;
	var n = 3;
	var m = 0.25;
	var p = 0.1;
	if(phy_speed_x < n)
	{
		phy_speed_x += m;
		if(phy_speed_x >= n)
		{
			phy_speed_x = n;
		}
	}
	else if(phy_speed_x > n)
	{
		phy_speed_x -= p;
		if(phy_speed_x < n)
		{
			phy_speed_x = n;
		}
	}
	if(phy_speed_x > n)
	{
		runningFrames += phy_speed_x;
	}
	else{
		runningFrames += n;
	}
	var incr = 20;
	if(runningFrames < incr){
		sprite_index = runningSprites[0];
	}
	else if(runningFrames < incr * 2){
		sprite_index = runningSprites[1];
	}
	else if(runningFrames < incr * 3){
		sprite_index = runningSprites[2];
	}
	else if(runningFrames < incr * 4){
		sprite_index = runningSprites[3];
	}
	else{
		runningFrames = 0;
	}
}
else if(running == false){
	trueRunning = false;
	if(delay > 0){
		sprite_index = spr_playerHit;
	}
	else if(instance_exists(obj_web)){
		sprite_index = spr_playerAiming;
	}
	else if(instance_exists(obj_swing)){
		if(x < obj_swing.atx){
			sprite_index = spr_playerAiming;
		}
		else{
			sprite_index = spr_playerSwingBack;
		}
	}
	else if(phy_speed_y > 5)
	{
		sprite_index = spr_playerFalling;
	}
	else{
		sprite_index = spr_player;
	}
}

if(!instance_exists(obj_swing) and jPress and frameCount < framesToBoost and !firstPress and !forceWait) //Jumping and Boosting
{
	frameCount += 1;
}
else if(!instance_exists(obj_swing) and frameCount > 0)
{
	if(!firstPress)
	{
		firstPress = true;
	}
	if(frameCount >= framesToBoost and jPress and fuel > 0 and !running)
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
		if(jPress)
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
			drawJump = true;
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
		if(jPress)
		{
			forceWait = true;
		}
	}
}
else
{
	firstPress = false;
}

if(forceWait == true and !jPress) //Force new click for jump/boost
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
running = false;
