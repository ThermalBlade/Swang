/// @description Insert description here
// You can write your code in this editor
/*for(var i = 0; i < (room_width / 16); i ++){
	draw_self();
	x += 16;
}
x = 0;*/

while(x < ds_list_find_value(blocks, 1)){
	draw_self();
	x += 16;
}

for(var i = 2; i < ds_list_size(blocks); i++){
	while(x < ds_list_find_value(blocks, i))
	{
		if(i % 2 != 0){
			draw_self();
			x += 16;
		}
		else{
			x += 16;
		}
	}
}

x = 0;