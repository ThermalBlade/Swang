/// @description Insert description here
// You can write your code in this editor
if(greenSignFloor != 0)
{
	if(obj_player.y + 5 > greenSignFloor.y){
		greenSignFloor.phy_active = false;
	}
	else{
		greenSignFloor.phy_active = true;
	}
	
	if(greenSignFloor.phy_active == true){
		floorProtectPixel.phy_active = false;
	}
	else{
		with(floorProtectPixel){phy_active = true;}
	}
}