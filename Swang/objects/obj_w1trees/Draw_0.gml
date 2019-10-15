/// @description Insert description here
// You can write your code in this editor
/*for(var i = 0; i < (room_width / 16); i ++){
	draw_self();
	x += 16;
}
x = 0;*/

randomize();

if(reset == 1)
{
	
}
for(i = 0; i < ds_list_size(treeXs); i ++){
	x = ds_list_find_value(treeXs, i);
	sprite_index = spr_tree;
	draw_self();
}

x = 0;