/// @description Initialize Player Variables
// You can write your code in this editor
//physics_world_gravity(0,25)
depth = -8;
phy_fixed_rotation = true;

swingPress = vk_space
jumpPress = ord("Z")
if(!instance_exists(obj_qLearning))
{
	sPress = keyboard_check_pressed(swingPress);
	shPress = keyboard_check(swingPress);
}
else
{
	sPress = 0
	shPress = 0
}
restartKey = vk_backspace
momentum = 0;
frameCount = 0;
jumpFrameCount = 0;
firstPress = false;
jumped = false;
canBoost = true;
canJump = true;
canDoubleJump = true;
forceWait = false;
newRopeTimer = 0;
startNoSpamTimer = false;
newRopeTimerMax = 30;
fuel = 80;

image_speed = 1;
fallSpeed = 0.08;
boostSpeed = 5;
jumpSpeed = 5;
boostFuelLoss = 0.25;
jumpFuelLoss = 20;
delay = 0;

framesToBoost = 8;
boosting = false;
running = false;
trueRunning = false;

drawJump = false;
inJumpAnimation = false;
boostAnimation = false;
endBoostAnimation = false;
endingBoostAnimation = false;
boostFrame = 0;
jumpFrame = 0;

delayTime = 90;
hitWallPunish = 1;

whereInSwing = 0;

runningSprites = [spr_playerRunning1, spr_playerRunning2, spr_playerRunning3, spr_playerRunning4];
runningFrames = 0;