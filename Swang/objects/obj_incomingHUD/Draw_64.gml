/// @description Insert description here
// You can write your code in this editor
display_set_gui_size(1920, 1080);
for(var i = 0; i < checkers; i ++){
	var objX = xs[i];
	var objY = ys[i];
	var tDistance = abs(ds[i]);
	var obj = objs[i]
	if(objX != -999){
		var camX = camera_get_view_x(view_camera[0]);
		var camY = camera_get_view_y(view_camera[0]);
		var camW = camera_get_view_width(view_camera[0]);
		var camH = camera_get_view_height(view_camera[0]);
		var yy = (camY + (camH / 2))
		var xGui = ((objX - camX) / camW) * 1920;
		var yGui = ((objY - camY) / camH) * 1080;
		
		var pd2 = abs(point_distance(obj_player.x, yy, objX, objY));
		var dos = tDistance - pd2;
		var cutOff = 1250;
		var rnr = rectangle_in_rectangle(obj.x, obj.y, obj.x + obj.sprite_width, obj.y + obj.sprite_height, camX, camY, camX + camW, camY + camH);
		if(dos <= cutOff and dos > 0 and rnr == 0){
			draw_set_alpha(1 - (dos * (1/cutOff)))
		}
		else{
			draw_set_alpha(0)
		}
		show_debug_message(dos)
		draw_sprite(spr_incomingRedHUD, 0, xGui, yGui);
		draw_set_alpha(1);
	}
}