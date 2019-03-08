/// @description Draw The Line Until Not Swinging
// You can write your code in this editor
if(keyboard_check(swingPress)) //While Holding Space, Draw Line
{
	x = obj_player.x
	y = obj_player.y
	som  = 60
	it = 0
	xdiff = x - atx
	ydiff = y - aty
	while(it <= som)
	{
		x -= xdiff / som
		y -= ydiff / som
		it += 1
		draw_self();
	}
}
else
{
	obj_player.canJump = true;
	instance_destroy();
}
x = atx
y = aty
draw_sprite(spr_target, 0, x, y)