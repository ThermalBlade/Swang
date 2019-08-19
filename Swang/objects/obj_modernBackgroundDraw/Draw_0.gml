/// @description Insert description here
// You can write your code in this editor
topColor = make_color_rgb(72, 169, 255);
middleColor = make_color_rgb(245, 223, 174);
bottomColor = make_color_rgb(232, 189, 97);
bottomReach = 1.1;
/*vc = view_camera[0];
cx = camera_get_view_x(vc);
cw = camera_get_view_width(vc);
cy = camera_get_view_y(vc);
ch = camera_get_view_height(vc);*/
draw_rectangle_colour(0, (room_height / bottomReach), room_width, room_height, middleColor, middleColor, bottomColor, bottomColor, false);
draw_rectangle_colour(0, 0, room_width, (room_height / bottomReach), topColor, topColor, middleColor, middleColor, false);