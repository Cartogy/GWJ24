extends "../StateMachine/state.gd"

onready var chick = get_owner()

var max_distance_away = 2

var goal = Vector2()
var speed = 10
var direction = Vector2()

func enter():
	pass

func update(delta):
	direction = Vector2(0, 0)
	# Far from duck -> get closer (Needs refactoring)
	if (calculate_goal(chick.get_duck()) - chick.position).length() > max_distance_away:
		goal = calculate_goal(chick.get_duck())
		direction = go_to_goal()
	chick.move_and_slide(direction * chick.speed, Vector2(0,0))

func go_to_goal():
	# Direction for chick to move towards
	var move_pos = (goal - chick.position).normalized()
	
	return move_pos

func calculate_goal(duck):
	# Get coordinate directly behind the duck.
	var point_to_go = -(chick.get_duck().direction) + chick.get_duck().position 
	
	return point_to_go
	
func exit():
	pass
