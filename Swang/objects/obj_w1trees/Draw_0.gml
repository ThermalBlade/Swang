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
while(x < room_width){
	if(ds_list_find_index(treeXs, x) != -1){
		//image_index = irandom_range(0, 1);
		sprite_index = spr_tree;
		draw_self();
	}
	x += 16;
}

x = 0;