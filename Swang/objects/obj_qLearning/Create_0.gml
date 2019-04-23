/// @description Insert description here
// You can write your code in this editor
/*yIterationMax = 1000;
xIterationMax = 1500;
iteration = 100;*/
selfLearning = false

oldState = "";
newState = "";

update = false
target = obj_qTarget
player = obj_player

increment = 5
groundLevel = 1000
ceilingLevel = 0

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
