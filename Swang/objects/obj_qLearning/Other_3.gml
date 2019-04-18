//Wrap root list in a map

var _wrapper = ds_map_create();
ds_map_add_list(_wrapper, "ROOT", global._root_list);

//Save all of this to string

var _string = json_encode(_wrapper);
//show_debug_message(_string)
scr_saveStringToFile("qLearning.txt", _string);

//nuke the data
ds_map_destroy(_wrapper);

//show_debug_message("Game saved!")