/// @description Insert description here
// You can write your code in this editor

with(obj_massParent){instance_destroy();}

if(file_exists("savegame.sav"))
{
	var _wrapper = scr_loadJSONfromFile("savegame.sav");
	var _list = _wrapper[? "ROOT"];
	
	for(var i = 0; i < ds_list_size(_list); i ++)
	{
		var _map = _list[| i];
		var _obj = _map[? "obj"];
		with(instance_create_layer(x, y, 0, asset_get_index(_obj)))
		{
			x = _map[? "x"];
			y = _map[? "y"];
		}
	}
	ds_map_destroy(_wrapper);
	show_debug_message("Game loaded!")
}
else
{
	show_debug_message("No file to load!")
}

instance_destroy();