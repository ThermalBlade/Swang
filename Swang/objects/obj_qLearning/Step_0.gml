/// @description Insert description here
// You can write your code in this editor

var it = 0 //Player X
while(it < player.x)
{
	it += distIncrement
}
it -= distIncrement
px = it

it = 0 //Player Y
while(it < player.y)
{
	it += distIncrement
}
it -= distIncrement
py = it

var it = 0 //Target X
while(it < target.x)
{
	it += distIncrement
}
it -= distIncrement
tx = it

it = 0 //Target Y
while(it < target.y)
{
	it += distIncrement
}
it -= distIncrement
ty = it

xFromTarget = tx - px
yFromTarget = ty - py
xFromTarget = string(xFromTarget)
yFromTarget = string(yFromTarget)
distFromTarget = "(" + xFromTarget + ", " + yFromTarget + ")"

it = ceilingLevel //Y From Ceiling and Ground
while(it < py)
{
	it += distIncrement
}
it -= distIncrement
yFromCeiling = it
var ceilingToGround = groundLevel - ceilingLevel
yFromGround = ceilingToGround - yFromCeiling
yFromCeiling = string(yFromCeiling)
yFromGround = string(yFromGround)
yCeilGround = "(" + yFromCeiling + ", " + yFromGround + ")"

whereInSwing = string(player.whereInSwing) //Where in swing, where hook, rope
if(player.whereInSwing == 0)
{
	whereWillHook = string(-1)
	rope = string(-1)
}
else if(player.whereInSwing == 1)
{
	if(obj_web.length < obj_web.minimumLine)
	{
		whereWillHook = string(-1)
		rope = string(-1)
	}
	else
	{
		with(obj_web)
		{
			if(place_meeting(x, y, obj_hookable))
			{
				obj_qLearning.atx = x;
				obj_qLearning.aty = y;
				obj_qLearning.rope = floor(rope)
			}
			else
			{
				obj_qLearning.atx = inst.x;
				obj_qLearning.aty = inst.y;
				obj_qLearning.rope = floor(rope)		
			}
		}
		if(px < atx)
		{
			it = px 
			while(it < atx)
			{
				it += ropeIncrement
			}
			it -= ropeIncrement
			whereWillHookx = string(it)
		}
		else
		{
			it = atx
			while(it < px)
			{
				it += ropeIncrement
			}
			it -= ropeIncrement
			whereWillHookx = string(it)
		}
		if(py < aty)
		{
			it = py
			while(it < aty)
			{
				it += ropeIncrement
			}
			it -= ropeIncrement
			whereWillHooky = string(it)
		}
		else
		{
			it = aty
			while(it < py)
			{
				it += ropeIncrement
			}
			it -= ropeIncrement
			whereWillHooky = string(it)
		}
		var r = 0;
		while(r < rope)
		{
			r += ropeIncrement
		}
		r -= ropeIncrement
		rope = string(r)
		whereWillHook = "(" + whereWillHookx + ", " + whereWillHooky + ")"
	}
}
swing = "(" + whereWillHook + ", " + rope + ")"

xSpeed = ceil(player.phy_speed_x)
ySpeed = ceil(player.phy_speed_y)
xSpeed = string(xSpeed)
ySpeed = string(ySpeed)
spd = "(" + xSpeed + ", " + ySpeed + ")"

newState = "(" + string(distFromTarget) + ")"


///Everything above is defining state, all below is qLearning
if(selfLearning == false)
{
	action = string(player.whereInSwing)
	if(oldState != newState)
	{
		if(py > 1000 or py < 0 or px > tx + distIncrement)
		{
			reward = -1;
		}
		else if(px == tx and py == ty)
		{
			reward = 1;
		}
		var oldStateAction = "(" + oldState + ", " + action + ")"
			//show_debug_message(oldStateAction)
		ds_map_add(global._map, oldStateAction, 0)
		newLegalActions = scr_getLegalActions();
		for(var i = 0; i < array_length_1d(newLegalActions); i ++;)
		{
			var newStateAction = "(" + newState + ", " + string(newLegalActions[i]) + ")"
			var newQValue = ds_map_find_value(global._map, newStateAction);
			if(!is_undefined(newQValue))
			{
				break;
			}
		}
		var maxQValue = ds_map_find_value(global._map, newStateAction);
		if(!is_undefined(maxQValue))
		{
			for(var i = 0; i < array_length_1d(newLegalActions); i ++;)
			{
				var newStateAction = "(" + newState + ", " + string(newLegalActions[i]) + ")"
				var newQValue = ds_map_find_value(global._map, newStateAction);
				if(newQValue > maxQValue)
				{
					maxQValue = newQValue;
				}
			}
		}
		else
		{
			maxQValue = 0;
		}
		ds_map_replace(global._map, oldStateAction, ((1 - alpha) * ds_map_find_value(global._map, oldStateAction) + alpha * (reward + (discount * maxQValue))))
		oldState = newState
		if(reward == 1 or reward == -1)
		{
			room_goto(rm_game);
		}
	}
}
else
{
	legalActions = scr_getLegalActions();
		//show_debug_message(legalActions[0])
	if(global.tries mod 250 != 0)
	{
		room_speed = 60*300
		action = "0"
		if(random(1) < epsilon)
		{
			action = legalActions[irandom_range(0, array_length_1d(legalActions) - 1)]
		}
		else
		{
			var newStateAction = "(" + newState + ", " + string(legalActions[0]) + ")"
			var maxQValue = ds_map_find_value(global._map, newStateAction);
			for(var i = 0; i < array_length_1d(legalActions); i ++;)
			{
				var newStateAction = "(" + newState + ", " + string(legalActions[i]) + ")"
				var newQValue = ds_map_find_value(global._map, newStateAction);
				if(newQValue > maxQValue)
				{
					maxQValue = newQValue;
					action = legalActions[i];
				}
			}
		}
	}
	else
	{
		room_speed = 60
		var newStateAction = "(" + newState + ", " + string(legalActions[0]) + ")"
		var maxQValue = ds_map_find_value(global._map, newStateAction);
		action = "0"
		for(var i = 0; i < array_length_1d(legalActions); i ++;)
		{
			var newStateAction = "(" + newState + ", " + string(legalActions[i]) + ")"
			var newQValue = ds_map_find_value(global._map, newStateAction);
			if(newQValue > maxQValue)
			{
				maxQValue = newQValue;
				action = legalActions[i];
			}
		}
	}
	if(action == "0")
	{
		player.sPress = false;
		player.shPress = false;
	}
	else if(action == "1")
	{
		player.sPress = true;
	}
	else if(action == "2")
	{
		player.shPress = true;
	}
	if(oldState != newState)
	{
		if(py > 1000 or py < 0 or px > tx + distIncrement)
		{
			reward = -100;
		}
		else if(px == tx and py == ty)
		{
			reward = 100;
		}
		else if(px > tx - 10*distIncrement and py > ty - 5*distIncrement and py < ty + 5*distIncrement)
		{
			reward = (20 / (tx - px + 1)) + abs(20 / (ty - py + 1))
		}
		var oldStateAction = "(" + oldState + ", " + action + ")"
			//show_debug_message(oldStateAction)
		ds_map_add(global._map, oldStateAction, 0)
		newLegalActions = scr_getLegalActions();
		for(var i = 0; i < array_length_1d(newLegalActions); i ++;)
		{
			var newStateAction = "(" + newState + ", " + string(newLegalActions[i]) + ")"
			var newQValue = ds_map_find_value(global._map, newStateAction);
			if(!is_undefined(newQValue))
			{
				break;
			}
		}
		var maxQValue = ds_map_find_value(global._map, newStateAction);
		if(!is_undefined(maxQValue))
		{
			for(var i = 0; i < array_length_1d(newLegalActions); i ++;)
			{
				var newStateAction = "(" + newState + ", " + string(newLegalActions[i]) + ")"
				var newQValue = ds_map_find_value(global._map, newStateAction);
				if(newQValue > maxQValue)
				{
					maxQValue = newQValue;
				}
			}
		}
		else
		{
			maxQValue = 0;
		}
		ds_map_replace(global._map, oldStateAction, ((1 - alpha) * ds_map_find_value(global._map, oldStateAction) + alpha * (reward + (discount * maxQValue))))
		oldState = newState
		if(reward == 100 or reward == -100)
		{
			global.tries += 1
			room_goto(rm_game);
		}
	}
}

/*
legalActions = self.getLegalActions(state)
action = None
"*** YOUR CODE HERE ***"
if legalActions == ():
	return(None)
if util.flipCoin(self.epsilon):
	return(random.choice(legalActions))
else:
	return(computeActionFromQValues(state))
*/