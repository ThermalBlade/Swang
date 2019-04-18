/// @description Insert description here
// You can write your code in this editor
/*yIterationMax = 1000;
xIterationMax = 1500;
iteration = 100;*/

global._root_list = ds_list_create();

var features = ["(xFromTarget, yFromTarget, yFromCeiling, yFromGround, whereInSwing, whereWillHook, xSpeed, ySpeed), action", "actions = extendHook, swing, no Input"]

global._map = ds_map_create();
ds_list_add(global._root_list, global._map);
ds_list_mark_as_map(global._root_list, ds_list_size(global._root_list) - 1)

/*for(var i = 0; i < xIterationMax; i += iteration)
{
	for(var j = 0; j < yIterationMax; j += iteration)
	{
		ex = string(i)
		ey = string(j)
		s = ex + " " + ey
		ds_map_add(_map, s, 0);
	}
}*/

room_goto(rm_game)
