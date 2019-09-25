/// @description Insert description here

if(obj_player.y + 6 > theHazardFloor.y){
	theHazardFloor.phy_active = false;
}
else{
	theHazardFloor.phy_active = true;
}

if(theHazardFloor.phy_active == true){
	theHazard.phy_active = false;
}
else{
	theHazard.phy_active = true;
}