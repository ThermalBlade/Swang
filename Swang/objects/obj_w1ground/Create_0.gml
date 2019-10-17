/// @description Insert description here
// You can write your code in this editor
y = room_height - 1;
x = 0;
depth = 0;
blocks = ds_list_create();

treeXs = ds_list_create();
treeIndexs = ds_list_create();
treeIndex = sprite_get_number(spr_tree);
groupTreeMin = 10;
groupTreeMax = 30;
howOftenGroupTrees = 55; //In percent
maxTreesInGroup = 6;
treeGroupSep = 16;

lampXs = ds_list_create();
lampSep = 320;

postBlock = false;
preBlock = true;

started = true;

foregroundObjectRange = 10;
goBackToPoint = 0;
xStart = 0;