extends "../StateMachine/state.gd"

onready var chick = get_owner()

var velocity = Vector2.ZERO
var avg_center : Vector2 = Vector2.ZERO

var avg_center_method : bool = true

func enter():
	pass
	
func exit():
	pass
	
func update(delta):
	
	# Apply follow goal method for flock
	if avg_center_method == false:
		if chick.goal_point != null:
			velocity = to_goal(chick.get_global_position(), chick.goal_point, chick.MAX_DISTANCE, chick.speed)
		#chick.set_desired_direction_v(velocity)
	else:	# Apply avg_center method for flock
		var center_v = (avg_center - chick.get_global_position()) * 0.7
		velocity = (chick.get_desired_direction_v() * chick.speed) + center_v
		
		
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
