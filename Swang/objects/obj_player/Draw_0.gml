/// @description Insert description here
// You can write your code in this editor

draw_self();

if(boosting){
	endingBoostAnimation = true;
	if(boostAnimation = false){
		boostFrame = 0;
		boostAnimation = true;
	}
	draw_sprite(spr_jetpackBoost, boostFrame, x, y);
	boostFrame += 0.20;
	if(boostFrame >= sprite_get_number(spr_jetpackBoost)){
		boostFrame = 3;
	}
}
else if(endingBoostAnimation == true){
	if(endBoostAnimation == false){
		boostFrame = 3;
		endBoostAnimation = true;
	}
	draw_sprite(spr_jetpackBoost, boostFrame, x, y);
	boostFrame -= 0.20;
	if(boostFrame <= 0){
		endBoostAnimation = false;
		boostAnimation = false;
		endingBoostAnimation = false;
	}
}


if(drawJump || inJumpAnimation){
	if(drawJump){
		jumpFrame = 0;
		inJumpAnimation = true;
		drawJump = false;
	}
	draw_sprite(spr_jetpackJump, jumpFrame, x, y);
	jumpFrame += 0.25;
	if(jumpFrame >= sprite_get_number(spr_jetpackJump)){
		inJumpAnimation = false;
	}
}