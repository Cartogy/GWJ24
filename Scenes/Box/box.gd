extends KinematicBody2D

class_name Box

var pushers = []
var avg_force_pos = Vector2.ZERO

func _physics_process(delta):
	if pushers.empty() == false:
		avg_force_pos = avg_global_pos(pushers)
		var vector_sum_direction = get_vector_sum(pushers)
		print(vector_sum_direction)
		#print(avg_push_pos)
		apply_force(vector_sum_direction, avg_force_pos)

func push(velocity: Vector2) -> void:
	move_and_slide(velocity, Vector2.ZERO)

func _on_Area2D_body_entered(body):
	
	if body as VectorMovement:
		print(body.name)
		pushers.append(body)
	if body as Chick:
		print(body.name)
		
func apply_force(motion, force_pos):
	if is_opposite_direction(motion, force_pos) && hor_vert_vector(motion):
		print("Apply Force")
		push(motion.normalized() * 200)
		
func get_vector_sum(forces) -> Vector2:
	var sum_vs = Vector2.ZERO
	var total = 0
	for f in forces:
		sum_vs = f.get_desired_direction_v()
		total = 1
		
	return (sum_vs / total).normalized()
		
func avg_global_pos(force_makers) -> Vector2:
	var sum_ps = Vector2.ZERO
	var total = 0
	for f in force_makers:
		sum_ps += f.get_global_position()
		total += 1
	return sum_ps / total

func hor_vert_vector(motion: Vector2) -> bool:
	if motion != null:
		if abs(motion.x) + abs(motion.y) > 1:
			return false
		else:
			return true
	else:
		return false

func is_opposite_direction(motion: Vector2, pusher_pos: Vector2) -> bool:
	var against_v = get_global_position() - pusher_pos	# Vector from pusher_pos to the centre of the box
	var dot_val = against_v.dot(motion)		# determines if the directed force vector is towards the cetner of the box 
	
	if dot_val <= 0:
		return false
	return true
	


func _on_Area2D_body_exited(body):
	if body as VectorMovement:
		pushers.erase(body)

func _process(delta):
	update()

func _draw():
	draw_circle(avg_force_pos - get_global_position(), 2, Color.pink)
