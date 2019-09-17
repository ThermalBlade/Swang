/// @description Insert description here
// You can write your code in this editor
var px = obj_player.x;
var py = obj_player.y;
closestWall = instance_nearest(px, py, obj_wall);
if(instance_exists(closestWall))
{
	var closex = closestWall.x + (closestWall.sprite_width / 2);
	var closey = closestWall.y + (closestWall.sprite_height / 2);
	var camX = camera_get_view_x(view_camera[0]);
	var camY = camera_get_view_y(view_camera[0]);
	var camW = camera_get_view_width(view_camera[0]);
	var camH = camera_get_view_height(view_camera[0]);
	var bx = camX + camW;
	var maxY = camY + camH;
	var minY = camY;
	var rr = ((closey - py)/(closex - px));
	var yCheck = (rr * bx) + py;
	
	if(yCheck < maxY and yCheck > minY and  px < closex){
		x = bx - 10;
		y = yCheck;
	}
	else if(yCheck < minY and px < closex){
		x = (minY/rr) - (py/rr);
		y = minY + 10;
	}
	else if(yCheck > maxY and px < closex){
		x = (minY/rr) - (py/rr);
		y = maxY - 10;
	}
	else{
		x  = px;
		y = py + 12;
	}
}