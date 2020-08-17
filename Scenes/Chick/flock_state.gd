extends "../StateMachine/state.gd"

onready var chick = get_owner()

var velocity = Vector2.ZERO

func enter():
	pass
	
func exit():
	pass
	
func update(delta):
	if chick.goal_point != null:
		velocity = to_goal(chick.get_global_position(), chick.goal_point, chick.MAX_DISTANCE, chick.speed)

	chick.move_and_slide(velocity)
	
func input_handler():
	pass
	
func to_goal(cur_pos, goal_pos, MAX_DISTANCE, speed) -> Vector2:
	var v = (goal_pos - cur_pos)
	
	var dir_v
	# Move towards goal if far away
	if v.length() > MAX_DISTANCE:
		v = v.normalized()
		dir_v = v * speed
	else:
		dir_v = Vector2.ZERO
	
	return dir_v
