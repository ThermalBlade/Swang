/// @description Insert description here
// You can write your code in this editor
if(timer == 0)
{
	x = obj_player.x
	y = obj_player.y;
	px = obj_player.x;
	py = obj_player.y;
	closestWall = instance_nearest(px, py, obj_wall);
	wx = closestWall.x;
	wy = closestWall.y;
	direction = point_direction(x, y, wx, wy);
	speed = 5;
}
timer += 1;
if(timer == 20){
	timer = 0;
}
	direction = point_direction(x, y, wx, wy);
	speed = 5;