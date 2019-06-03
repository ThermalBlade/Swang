/// @description Initialize Player Variables
// You can write your code in this editor
//physics_world_gravity(0,25)
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
doubleJumped = false;
canBoost = true;
canJump = true;
canDoubleJump = true;
forceWait = false;

image_speed = 3;
fallSpeed = 0.08;
boostSpeed = 5;
jumpSpeed = 5;
doubleJumpSpeed= 4;

framesToBoost = 8;
framesToDoubleJump = 10;
boostTime = 60;

whereInSwing = 0