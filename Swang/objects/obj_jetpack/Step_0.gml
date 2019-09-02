/// @description Insert description here
// You can write your code in this editor
phy_position_x = obj_player.phy_position_x;
phy_position_y = obj_player.phy_position_y;

if(jumping == true)
{
	inJumpAnimation = 1;
	image_speed = 10;
	sprite_index = spr_jetpackJump;
	image_index = 0;
	jumping = false;
}

if(inJumpAnimation and image_index >= 6)
{
	sprite_index = spr_jetpack;
	image_speed = 0;
	image_index = 0;
}