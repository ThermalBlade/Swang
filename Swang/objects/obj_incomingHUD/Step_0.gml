/// @description Insert description here
// You can write your code in this editor
px = obj_player.x;
py = obj_player.y;
closestWall = instance_nearest(px, py, obj_wall);
if(instance_exists(closestWall))
{
	wx = closestWall.x;
	wy = closestWall.y;

	cx = wx - px;
	cy = wy - py;

	//x = px + (cx / 10);
	//y = py + (cy / 10);
}
camX = camera_get_view_x(view_camera[0]);
camY = camera_get_view_y(view_camera[0]);
camW = camera_get_view_width(view_camera[0]);
camH = camera_get_view_height(view_camera[0]);
x = camX + obj_view.camWidth;
y = camY - (obj_view.camWidth * (9/16));

