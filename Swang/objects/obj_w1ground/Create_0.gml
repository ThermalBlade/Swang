/// @description Insert description here
// You can write your code in this editor
y = room_height - 1;
x = 0;
depth = 0;
blocks = ds_list_create();

treeXs = ds_list_create();
treeIndexs = ds_list_create();

lampXs = ds_list_create();
lampSep = 220;

postBlock = false;
preBlock = true;

started = true;

foregroundObjectRange = 10;
goBackToPoint = 0;
xStart = 0;