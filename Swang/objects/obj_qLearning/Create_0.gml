/// @description Insert description here
// You can write your code in this editor
/*yIterationMax = 1000;
xIterationMax = 1500;
iteration = 100;*/
selfLearning = false
increment = 10
target = obj_qTarget
player = obj_player
groundLevel = 1000
ceilingLevel = 0

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

features = "(" + string(distFromTarget) + ", " + string(yCeilGround) + ", " + string(swing) + ", " + string(spd) + ")"
if(selfLearning == false)
{
	action = string(player.whereInSwing)
	stateAction = "(" + string(features) + ", " + action + ")"
}
ds_map_add(global._map, stateAction, 0)
newLegalActions = scr_getLegalActions();

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


/*for(var i = 0; i < xIterationMax; i += iteration)
{
	for(var j = 0; j < yIterationMax; j += iteration)
	{
		ex = string(i)
		ey = string(j)
		s = ex + " " + ey
		ds_map_add(_map, s, 0);
	}
}*/
