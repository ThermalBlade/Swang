/// @description Insert description here
// You can write your code in this editor
/*for(var i = 0; i < (room_width / 16); i ++){
	draw_self();
	x += 16;
}
x = 0;*/

randomize();

x = xStart;

if(started){
	//LAMPS
	if(ds_list_size(lampXs) > 0){
		ds_list_sort(lampXs, true);
		for(i = 0; i < ds_list_size(lampXs); i ++){
			ds_list_replace(lampXs, i, ds_list_find_value(lampXs, i) - goBackToPoint);
		}
		for(i = 0; i < ds_list_size(lampXs); i ++){
			if(ds_list_find_value(lampXs, i) < 0){
				ds_list_delete(lampXs, i);
				i -= 1;
			}
			else if(ds_list_find_value(lampXs, i) > obj_player.x + 2000){
				ds_list_delete(lampXs, i);
				i -= 1;
			}
		}
		ds_list_sort(lampXs, true);
		xHolder = ds_list_find_value(lampXs, ds_list_size(lampXs) - 1) + lampSep;
	}
	else{
		xHolder = xStart;
	}
	while(xHolder < ds_list_find_value(blocks, 1)){
		ds_list_add(lampXs, xHolder);
		xHolder += lampSep;
	}
	for(var i = 2; i < ds_list_size(blocks) - 2; i++){
		if(i % 2 != 0 and preBlock == true){ //Start drawing sidewalk
			preBlock = false;
		}
		while(xHolder < ds_list_find_value(blocks, i))
		{
			if(i % 2 != 0){ //Drawing sidewalk
				ds_list_add(lampXs, xHolder);
				xHolder += lampSep;
				postBlock = true;
			}
			else{ //Drawing street
				xHolder += lampSep;
				preBlock = true;
				if(postBlock){ //Strat drawing street
					postBlock = false;
				}
			}
		}
	}
	while(xHolder < room_width){
		ds_list_add(lampXs, xHolder);
		xHolder += lampSep;
	}
	if(!instance_exists(obj_w1trees)){instance_create_depth(0, 0, -500, obj_w1trees);}
	with(obj_w1trees){
		lampXs = obj_w1ground.lampXs;
	}

	//TREES
	if(ds_list_size(treeXs) > 0){
		ds_list_sort(treeXs, true);
		for(i = 0; i < ds_list_size(treeXs); i ++){
			ds_list_replace(treeXs, i, ds_list_find_value(treeXs, i) - goBackToPoint);
		}
		for(i = 0; i < ds_list_size(treeXs); i ++){
			if(ds_list_find_value(treeXs, i) < 0){
				ds_list_delete(treeXs, i);
				ds_list_delete(treeIndexs, i);
				i -= 1;
			}
			else if(ds_list_find_value(treeXs, i) > obj_player.x + 2000){
				ds_list_delete(treeXs, i);
				ds_list_delete(treeIndexs, i);
				i -= 1;
			}
		}
		ds_list_sort(treeXs, true);
		xHolder = ds_list_find_value(treeXs, ds_list_size(treeXs) - 1) + 60;
	}
	else{
		xHolder = xStart;
	}
	var addObject;
	var keepAddObject;
	var treeCount;
	while(xHolder < ds_list_find_value(blocks, 1)){
		addObject = irandom_range(0, foregroundObjectRange);
		if(addObject == 0){
			keepAddObject = 0;
			treeCount = 0;
			while(keepAddObject <= howOftenGroupTrees and treeCount < maxTreesInGroup){
				ds_list_add(treeXs, xHolder);
				ds_list_add(treeIndexs, irandom_range(0, treeIndex));
				treeCount += 1;
				xHolder += irandom_range(groupTreeMin, groupTreeMax);
				keepAddObject = irandom_range(0, 100)
			}
		}
		xHolder += treeGroupSep;
	}

	for(var i = 2; i < ds_list_size(blocks) - 2; i++){
		if(i % 2 != 0 and preBlock == true){ //Start drawing sidewalk
			preBlock = false;
		}
		while(xHolder < ds_list_find_value(blocks, i))
		{
			if(i % 2 != 0){ //Drawing sidewalk
				addObject = irandom_range(0, foregroundObjectRange);
				if(addObject == 0){
					keepAddObject = 0;
					treeCount = 0;
					while(keepAddObject <= howOftenGroupTrees and treeCount < maxTreesInGroup){
						ds_list_add(treeXs, xHolder);
						ds_list_add(treeIndexs, irandom_range(0, treeIndex));
						treeCount += 1;
						xHolder += irandom_range(groupTreeMin, groupTreeMax);
						keepAddObject = irandom_range(0, 100)
					}
				}
				xHolder += treeGroupSep;
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
		addObject = irandom_range(0, foregroundObjectRange);
		if(addObject == 0){
			keepAddObject = 0;
			treeCount = 0;
			while(keepAddObject <= howOftenGroupTrees and treeCount < maxTreesInGroup){
				ds_list_add(treeXs, xHolder);
				ds_list_add(treeIndexs, irandom_range(0, treeIndex));
				treeCount += 1;
				xHolder += irandom_range(groupTreeMin, groupTreeMax);
				keepAddObject = irandom_range(0, 100)
			}
		}
		xHolder += treeGroupSep;
	}
	if(!instance_exists(obj_w1trees)){instance_create_depth(0, 0, -500, obj_w1trees);}
	with(obj_w1trees){
		treeXs = obj_w1ground.treeXs;
		treeIndexs = obj_w1ground.treeIndexs;
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