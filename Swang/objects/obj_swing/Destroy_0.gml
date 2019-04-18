/// @description Insert description here
// You can write your code in this editor
obj_player.whereInSwing = 0
if(snag == 1)
{
	with(obj_player)
	{
		canJump = true;
		canDoubleJump = true;
		canBoost = true;
		jumped = 0;
	}
}