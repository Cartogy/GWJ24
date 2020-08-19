extends Node

export (float) var towards

var boids = []
var average_center = Vector2.ZERO

var t = 0

var interpolate

func _ready():
	
	for child in get_children():
		if child as Boid:
			child.goal = average_center
			boids.append(child)
		
func get_input() -> Vector2:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		velocity += Vector2.DOWN
	if Input.is_action_pressed("ui_up"):
		velocity += Vector2.UP
	if Input.is_action_pressed("ui_right"):
		velocity += Vector2.RIGHT
	if Input.is_action_pressed("ui_left"):
		velocity += Vector2.LEFT
		
	return velocity
		
func _physics_process(delta):
	var dir = get_input().normalized()
	var avg_cntr = calc_avg_center()
	$Position2D.position = avg_cntr
	var v_dir = dir  * 50
	
	t += delta * 0.4	
	
	var goal_from_avg_center = avg_cntr + v_dir
	var interpolate = avg_cntr.linear_interpolate(goal_from_avg_center, 0.9)
	
	average_center += dir * 2
	var goal_v = average_center + (dir * 2)

	update_boids(goal_from_avg_center)

	
	
func update_boids(new_goal):
	for bs in boids:
		bs.goal = new_goal
		
func update_boids_direction(v):
	for bs in boids:
		bs.desired_direction_v = v
		
func update_boids_avg_cntr(avg):
	for b in boids:
		b.group_avg = avg
		
func get_average_center():
	pass

func calc_avg_center():
	var sum : Vector2 = Vector2.ZERO
	var total = 0
	for b in boids:
		sum += b.get_global_position()
		total += 1
	return sum / total
	

			
	

	
		
	
