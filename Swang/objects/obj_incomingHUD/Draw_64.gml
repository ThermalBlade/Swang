/// @description Insert description here
// You can write your code in this editor
display_set_gui_size(1920, 1080);
for(var i = 0; i < checkers; i ++){
	var objX = xs[i];
	var objY = ys[i];
	if(objX != -999){
		var camX = camera_get_view_x(view_camera[0]);
		var camY = camera_get_view_y(view_camera[0]);
		var camW = camera_get_view_width(view_camera[0]);
		var camH = camera_get_view_height(view_camera[0]);
		var xGui = ((objX - camX) / camW) * 1920;
		var yGui = ((objY - camY) / camH) * 1080;
		draw_sprite(spr_incomingRedHUD, 0, xGui, yGui);
	}
}