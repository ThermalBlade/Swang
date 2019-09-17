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

	x = px + (cx / 10);
	y = py + (cy / 10);
}