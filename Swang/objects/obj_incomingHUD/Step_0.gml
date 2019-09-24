/// @description Insert description here
// You can write your code in this editor
var px = obj_player.x;
var py = obj_player.y;
i = 0;
checks = 0;
var closestWall;
var closex;
var closey;
var pd;

while(checks < 3){
	i += 1;
	closestWall = instance_nth_nearest(px, py, obj_wall, i);
	if(closestWall != noone){
		closex = closestWall.x + (closestWall.sprite_width / 2);
		closey = closestWall.y + (closestWall.sprite_height / 2);
		pd = point_distance(px, py, closex, closey);
	}
	else{
		closex = room_width;
	}
	while(px > closex and i < instance_number(obj_wall) - 1){
		i += 1;
		closestWall = instance_nth_nearest(px, py, obj_wall, i);
		if(closestWall != noone){
			closex = closestWall.x + (closestWall.sprite_width / 2);
			closey = closestWall.y + (closestWall.sprite_height / 2);
			pd = point_distance(px, py, closex, closey);
		}
		else{
			show_debug_message(closestWall)
			closex = room_width;
		}
	}
	//show_debug_message(closestWall);
	if(closestWall != noone)
	{
		var camX = camera_get_view_x(view_camera[0]);
		var camY = camera_get_view_y(view_camera[0]);
		var camW = camera_get_view_width(view_camera[0]);
		var camH = camera_get_view_height(view_camera[0]);
		var bx = camX + camW;
		var maxY = camY + camH;
		var minY = camY;
		var yy = (camY + (camH / 2));
		var rr = (closey - yy)/(closex - px);
		var yOffset = yy - rr * px;
		var yCheck = (rr * bx) + yOffset;
		var dd = point_distance(px, yy, closex, closey);
	
		if(yCheck < maxY and yCheck > minY and  px < closex){
			x = bx;
			y = yCheck;
		}
		else if(yCheck < minY and px < closex){
			x = (minY/rr) - (yOffset/rr);
			y = minY;
		}
		else if(yCheck > maxY and px < closex){
			x = (maxY/rr) - (yOffset/rr);
			y = maxY;
		}
		else{
			x = -999;
			y = -999;
		}
		xs[checks] = x;
		ys[checks] = y;
		ds[checks] = dd;
	}
	else{
		xs[checks] = -999;
		ys[checks] = -999;
		ds[checks] = -999;
	}
	checks += 1;
}