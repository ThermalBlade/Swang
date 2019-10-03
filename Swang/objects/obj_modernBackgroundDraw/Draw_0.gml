/// @description Insert description hee
// You can write your code in this editor
var m = 1000;
var adjuster = (abs((camera_get_view_width(view_camera[0]) - 420)) * 2);
var madjuster = min(m, adjuster);
show_debug_message(madjuster)
bottom = room_height;
top = 0 - m + madjuster;

topColor = make_color_rgb(31, 35, 141);
middleColor2 = make_color_rgb(53, 56, 144);
middleColor = make_color_rgb(133, 92, 238); //Light purple
bottomColor = make_color_rgb(251, 230, 58); //Yellow
bottomReach = 1.5 + (0.0006 * madjuster);
middleReach = 3 + (0.0006 * madjuster);
/*vc = view_camera[0];
cx = camera_get_view_x(vc);
cw = camera_get_view_width(vc);
cy = camera_get_view_y(vc);
ch = camera_get_view_height(vc);*/
draw_rectangle_colour(0, (bottom / bottomReach), room_width, bottom, middleColor, middleColor, bottomColor, bottomColor, false);
draw_rectangle_colour(0, (bottom / middleReach), room_width, (bottom / bottomReach), middleColor2, middleColor2, middleColor, middleColor, false);
draw_rectangle_colour(0, top, room_width, (bottom / middleReach), topColor, topColor, middleColor2, middleColor2, false);