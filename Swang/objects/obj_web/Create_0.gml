/// @description Initialize Variables
// You can write your code in this editor
extendSpeed = 4; //How Fast The Line Extends
depth = -5;
length = extendSpeed
minimumLine = 27
swingPress = obj_player.swingPress
inst = instance_nearest(x, y, obj_hookTracker);
extentions = 0;
extentionsMax = 120;
closeSnap = 150;

atx = obj_player.x
aty = obj_player.y

obj_player.whereInSwing = 2;

canSnap = false;