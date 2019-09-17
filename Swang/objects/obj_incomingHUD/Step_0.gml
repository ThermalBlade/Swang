/// @description Insert description here
// You can write your code in this editor
var px = obj_player.x;
var py = obj_player.y;

for(var i = 1; i < checkers + 1; i ++){
	var closestWall = instance_nth_nearest(px, py, obj_wall, i);
	if(instance_exists(closestWall))
	{
		var closex = closestWall.x + (closestWall.sprite_width / 2);
		var closey = closestWall.y + (closestWall.sprite_height / 2);
		var pd = point_distance(px, py, closex, closey);
		if(pd < maxDistForChecker){
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
			xs[i - 1] = x;
			ys[i - 1] = y;
		}
		else{
			xs[i - 1] = -999;
			ys[i - 1] = -999;
		}
	}
	else{
		xs[i - 1] = -999;
		ys[i - 1] = -999;
	}
}