/// @description Insert description hee
// You can write your code in this editor
topColor = make_color_rgb(67, 122, 193);
middleColor2 = make_color_rgb(183, 210, 230);
middleColor = make_color_rgb(255, 236, 110);
bottomColor = make_color_rgb(255, 169, 38);
bottomReach = 1.1;
middleReach = 1.2;
/*vc = view_camera[0];
cx = camera_get_view_x(vc);
cw = camera_get_view_width(vc);
cy = camera_get_view_y(vc);
ch = camera_get_view_height(vc);*/
draw_rectangle_colour(0, (room_height / bottomReach), room_width, room_height, middleColor, middleColor, bottomColor, bottomColor, false);
draw_rectangle_colour(0, (room_height / middleReach), room_width, (room_height / bottomReach), middleColor2, middleColor2, middleColor, middleColor, false);
draw_rectangle_colour(0, 0, room_width, (room_height / middleReach), topColor, topColor, middleColor2, middleColor2, false);