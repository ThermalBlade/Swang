/// @description Initialize Player Variables
// You can write your code in this editor
//physics_world_gravity(0,25)
swingPress = vk_space
jumpPress = ord("Z")
restartKey = vk_backspace
frameCount = 0
jumping = false
canJump = true;
canBoost = true;
momentumSet = true;
doubleJumped = false;
curMomentum = 0;

boostLength = 60;
boostSpeed = 5;
jumpSpeed = 4;
doubleJumpSpeed = 3;