/// @description Insert description here
// You can write your code in this editor
trueYOffset += 0.2 * cos(yOffset * (pi / 180))
yOffset += 3;
if(yOffset >= 360){
	yOffset = 0;
}

if(redAlpha > 0){
	redAlpha -= 0.025;
}