extends Node

export (float) var towards

var boids = []
var average_center = Vector2.ZERO

func _ready():
	
	for child in get_children():
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
	
	average_center += dir * 2
	update_boids(average_center)
	
func update_boids(new_goal):
	for bs in boids:
		bs.goal = new_goal
		
func get_average_center():
	pass
	
	

	
		
	
