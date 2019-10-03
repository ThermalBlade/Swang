/// @description Insert description here
// You can write your code in this editor
/*for(var i = 0; i < (room_width / 16); i ++){
	draw_self();
	x += 16;
}
x = 0;*/

randomize();

if(started){
	var xHolder = 0;
	var addObject;
	while(xHolder < ds_list_find_value(blocks, 1)){
		tree = irandom_range(0, foregroundObjectRange);
		if(tree == 0){
			addObject = true;
		}
		else{
			addObject = false;
		}
		ds_list_add(trees, addObject);
		ds_list_add(treeXs, xHolder);
		xHolder += 16;
	}

	for(var i = 2; i < ds_list_size(blocks) - 2; i++){
		if(i % 2 != 0 and preBlock == true){ //Start drawing sidewalk
			preBlock = false;
		}
		while(xHolder < ds_list_find_value(blocks, i))
		{
			if(i % 2 != 0){ //Drawing sidewalk
				tree = irandom_range(0, foregroundObjectRange);
				if(tree == 0){
					addObject = true;
				}
				else{
					addObject = false;
				}
				ds_list_add(trees, addObject);
				ds_list_add(treeXs, xHolder);
				xHolder += 16;
				postBlock = true;
			}
			else{ //Drawing street
				xHolder += 16;
				preBlock = true;
				if(postBlock){ //Strat drawing street
					postBlock = false;
				}
			}
		}
	}
	while(xHolder < room_width){
		tree = irandom_range(0, foregroundObjectRange);
		if(tree == 0){
			addObject = true;
		}
		else{
			addObject = false;
		}
		ds_list_add(trees, addObject);
		ds_list_add(treeXs, xHolder);
		xHolder += 16;
	}
	started = false;
}

while(x < ds_list_find_value(blocks, 1)){
	draw_self();
	x += 16;
}

for(var i = 2; i < ds_list_size(blocks) - 2; i++){
	if(i % 2 != 0 and preBlock == true){ //Start drawing sidewalk
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
		if(i % 2 != 0){ //Drawing sidewalk
			sprite_index = spr_w1sideWalk;
			draw_self();
			x += 16;
			postBlock = true;
			
			if(x 
		}
		else{ //Drawing street
			sprite_index = spr_w1street;
			draw_self();
			x += 16;
			preBlock = true;
			if(postBlock){ //Strat drawing street
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
while(x < room_width){
	draw_self();
	x += 16;
}

x = 0;