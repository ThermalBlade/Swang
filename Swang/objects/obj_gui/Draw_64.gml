/// @description Insert description here
// You can write your code in this editor
draw_set_alpha(0.9);
display_set_gui_size(1920, 1080);

currentIndex = floor(((90 - obj_player.fuel) - 0.001) / 10);
if(obj_player.fuel == 0){
	currentIndex = 9;
}
draw_sprite(spr_fuelBar, currentIndex, 960, 10 + trueYOffset);

currentWaitIndex = floor((1 - (obj_player.delay / delayMax)) * 8);
draw_sprite(spr_waitBar, currentWaitIndex, 960, 10 + trueYOffset);

draw_set_alpha(redAlpha);
draw_sprite(spr_damageHUD, 0, 0, 0);

draw_set_alpha(1);