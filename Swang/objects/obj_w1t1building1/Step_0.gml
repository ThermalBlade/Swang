/// @description Insert description here
// You can write your code in this editor
if(greenSignFloor != 0){
	if(obj_player.phy_position_y + 6 < greenSignFloor.y){
		greenSignFloor.phy_active = true;
	}
	else{
		greenSignFloor.phy_active = false;
	}
	
	if(greenSignFloor.phy_active == true){
		greenSign.phy_active = false;
	}
	else{
		greenSign.phy_active = true;
	}
}