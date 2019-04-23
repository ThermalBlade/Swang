/// @description Insert description here
// You can write your code in this editor

var it = 0 //Player X
while(it < player.x)
{
	it += increment
}
it -= increment
px = it

it = 0 //Player Y
while(it < player.y)
{
	it += increment
}
it -= increment
py = it

var it = 0 //Target X
while(it < target.x)
{
	it += increment
}
it -= increment
tx = it

it = 0 //Target Y
while(it < target.y)
{
	it += increment
}
it -= increment
ty = it

xFromTarget = tx - px
yFromTarget = ty - py
xFromTarget = string(xFromTarget)
yFromTarget = string(yFromTarget)
distFromTarget = "(" + xFromTarget + ", " + yFromTarget + ")"

it = ceilingLevel //Y From Ceiling and Ground
while(it < py)
{
	it += increment
}
it -= increment
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
else if(player.whereInSwing = 1)
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
				obj_qLearning.rope = rope
			}
			else
			{
				obj_qLearning.atx = inst.x;
				obj_qLearning.aty = inst.y;
				obj_qLearning.rope = rope		
			}
		}
		if(px < atx)
		{
			it = px 
			while(it < atx)
			{
				it += increment
			}
			it -= increment
			whereWillHookx = string(it)
		}
		else
		{
			it = atx
			while(it < px)
			{
				it += increment
			}
			it -= increment
			whereWillHookx = string(it)
		}
		if(py < aty)
		{
			it = py
			while(it < aty)
			{
				it += increment
			}
			it -= increment
			whereWillHooky = string(it)
		}
		else
		{
			it = aty
			while(it < py)
			{
				it += increment
			}
			it -= increment
			whereWillHooky = string(it)
		}
		whereWillHook = "(" + whereWillHookx + ", " + whereWillHooky + ")"
		rope = string(rope)
	}
}
swing = "(" + whereInSwing + ", " + whereWillHook + ", " + rope + ")"

xSpeed = ceil(player.phy_speed_x)
ySpeed = ceil(player.phy_speed_y)
xSpeed = string(xSpeed)
ySpeed = string(ySpeed)
spd = "(" + xSpeed + ", " + ySpeed + ")"

newState = "(" + string(distFromTarget) + ", " + string(yCeilGround) + ", " + string(swing) + ", " + string(spd) + ")"
if(selfLearning == false)
{
	action = string(player.whereInSwing)
	if(oldState != newState)
	{
		var oldStateAction = string("(" + oldState + ", " + action + ")")
		ds_map_add(global._map, oldStateAction, 0)
		newLegalActions = scr_getLegalActions();
		var newStateAction = string("(" + newState + ", " + newLegalActions[0] + ")")
		var maxQValue = ds_map_find_value(global._map, newStateAction);
		if(!is_undefined(maxQValue))
		{
			for(var i = 0; i < array_length_1d(newLegalActions); i ++;)
			{
				var newStateAction = string("(" + newState + ", " + newLegalActions[i] + ")")
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
			
		show_debug_message(newStateAction)
		oldStateAction = newStateAction
	}
}

/*
if (state, action) not in self.Q:
	self.Q[(state, action)] = 0
newLegalActions = self.getLegalActions(nextState)
if newLegalActions != ():
	maxQValue = self.getQValue(nextState, newLegalActions[0])
	for newAction in newLegalActions:
		newQValue = self.getQValue(nextState, newAction)
		if newQValue > maxQValue:
			maxQValue = newQValue
else:
	maxQValue = 0
print(state, action)
self.Q[(state, action)] = ((1 - self.alpha) * self.Q[(state, action)]) + self.alpha * (reward + (self.discount * maxQValue))
*/

var actions = ["actions = extendHook, swing, no Input"]