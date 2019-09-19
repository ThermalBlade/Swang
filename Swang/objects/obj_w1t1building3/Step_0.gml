/// @description Insert description here

if(obj_player.y + 6 > theHazardFloor.y){
	theHazardFloor.phy_active = false;
}
else{
	theHazardFloor.phy_active = true;
}

if(theHazardFloor.phy_active == true){
	floorProtectPixel.phy_active = false;
}
else{
	floorProtectPixel.phy_active = true;
}