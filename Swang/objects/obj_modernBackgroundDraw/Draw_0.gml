/// @description Insert description hee
// You can write your code in this editor
topColor = make_color_rgb(31, 35, 141);
middleColor2 = make_color_rgb(53, 56, 144);
middleColor = make_color_rgb(133, 92, 238); //Light purple
bottomColor = make_color_rgb(251, 230, 58); //Yellow
bottomReach = 1.5;
middleReach = 3;
/*vc = view_camera[0];
cx = camera_get_view_x(vc);
cw = camera_get_view_width(vc);
cy = camera_get_view_y(vc);
ch = camera_get_view_height(vc);*/
draw_rectangle_colour(0, (room_height / bottomReach), room_width, room_height, middleColor, middleColor, bottomColor, bottomColor, false);
draw_rectangle_colour(0, (room_height / middleReach), room_width, (room_height / bottomReach), middleColor2, middleColor2, middleColor, middleColor, false);
draw_rectangle_colour(0, 0, room_width, (room_height / middleReach), topColor, topColor, middleColor2, middleColor2, false);