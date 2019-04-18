/// @description Insert description here
// You can write your code in this editor

var _root_list = ds_list_create();

if !directory_exists("qLearning")
   {
	   show_debug_message("AAA")
		directory_create("qLearning");
   }

//for all instances create a map
with(obj_massParent)
{
	var _map = ds_map_create();
	ds_list_add(_root_list, _map);
	ds_list_mark_as_map(_root_list, ds_list_size(_root_list) - 1)
	
	var _obj = object_get_name(object_index);
	ds_map_add(_map, "obj", _obj);
	ds_map_add(_map, "x", x);
	ds_map_add(_map, "y", y);
}

//Wrap root list in a map

var _wrapper = ds_map_create();
ds_map_add_list(_wrapper, "ROOT", _root_list);

//Save all of this to string

var _string = json_encode(_wrapper);
//show_debug_message(_string)
scr_saveStringToFile("savegame.txt", _string);

//nuke the data
ds_map_destroy(_wrapper);

//show_debug_message("Game saved!")
instance_destroy();