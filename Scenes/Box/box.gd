extends KinematicBody2D

class_name Box


func push(velocity: Vector2) -> void:
	move_and_slide(velocity, Vector2(1,0))

func apply_force(motion, force_pos):
	if is_opposite_direction(motion, force_pos) && hor_vert_vector(motion):
		print("Apply Force")
		push(motion.normalized() * 100)
		

func hor_vert_vector(motion: Vector2) -> bool:
	if motion != null:
		if abs(motion.x) + abs(motion.y) > 1:
			return false
		else:
			return true
	else:
		return false

func is_opposite_direction(motion: Vector2, pusher_pos: Vector2) -> bool:
	var against_v = (position - pusher_pos).normalized()	# Vector from pusher_pos to the centre of the box
	var dot_val = against_v.dot(motion)		# determines if the directed force vector is towards the cetner of the box 
	
	if dot_val <= 0:
		return false
	return true
	
