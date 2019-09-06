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
	if(i % 2 != 0 and preBlock == true){
		sprite_index = spr_w1sideWalkEndRight;
		x -= 32;
		draw_self();
		sprite_index = spr_w1sideWalk;
		x += 16;
		draw_self();
		x += 16;
		preBlock = false;
	}
	while(x < ds_list_find_value(blocks, i))
	{
		if(i % 2 != 0){
			sprite_index = spr_w1sideWalk;
			draw_self();
			x += 16;
			postBlock = true;
		}
		else{
			sprite_index = spr_w1street;
			draw_self();
			x += 16;
			preBlock = true;
			if(postBlock){
				sprite_index = spr_w1sideWalk;
				x -= 16;
				draw_self();
				x += 16;
				sprite_index = spr_w1street;
				draw_self();
				sprite_index = spr_w1sideWalkEndLeft;
				draw_self();
				x += 16;
				postBlock = false;
			}
		}
	}
}

x = 0;