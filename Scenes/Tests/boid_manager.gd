extends Node

export (float) var towards

var boids = []
var average_center = Vector2.ZERO

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
	var avg_cnr = calc_avg_center()
	$Position2D.position = avg_cnr
	average_center += dir * 2
	var goal_v = average_center + (dir * 2)
	#update_boids(average_center)
	#update_boids(goal_v)
	update_boids_direction(dir * 130)
	update_boids_avg_cntr(avg_cnr)
	
	
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
	

			
	

	
		
	
