/// @description Insert description here
// You can write your code in this editor
depth = 10;
if(x - obj_player.x < 1000 and created == false)
{
	insta = instance_create_depth(x, y, -10, obj_hookTracker);
	insta.inst = self;
	created = true
}
else if(x - obj_player.x < -500 and created == true)
{
	with(insta){instance_destroy();}
}