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
		#chick.set_desired_direction_v(velocity)
	chick.move_and_slide(velocity)
	if chick.get_slide_count() > 0:
		var box = chick.get_slide_collision(0).collider as Box
		if box:
			box.apply_force(chick.get_desired_direction_v(), chick.position)
	
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
