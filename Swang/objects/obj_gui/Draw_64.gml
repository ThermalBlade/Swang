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


/*px = obj_player.x;
py = obj_player.y;
closestWall = instance_nearest(px, py, obj_wall);
if(instance_exists(closestWall))
{
	wx = closestWall.x;
	wy = closestWall.y;

	cx = wx - px;
	cy = wy - py;

	x = px + (cx / 10);
	y = py + (cy / 10);
}
/*camX = camera_get_view_x(view_camera[0]);
camY = camera_get_view_y(view_camera[0]);
camW = camera_get_view_width(view_camera[0]);
camH = camera_get_view_height(view_camera[0]);
x = camX + camW;
y = camY + 200 + obj_view.playerYOffset;

show_debug_message(camY + 200)
show_debug_message(obj_view.y)*/

px = obj_player.x;