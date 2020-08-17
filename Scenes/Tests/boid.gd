extends KinematicBody2D

export (float) var AVOID_DISTANCE
export (float) var speed

export (Array, NodePath) var boids_path
var boids = []

var neighbours = []

var MAX_DISTANCE = 5

var goal = Vector2.ZERO
var velocity = Vector2.ZERO

var avg_group_distance = Vector2.ZERO

func _ready():
	pass

func _input(event):
	if event.is_action_pressed('left_click'):
		goal = get_global_mouse_position()

func _physics_process(delta):
	
	if goal != null:
		velocity = to_goal(get_global_position(), goal)

	move_and_slide(velocity)

func _process(delta):
	update()

func to_goal(cur_pos, goal_pos) -> Vector2:
	var v = (goal_pos - cur_pos)
	
	var dir_v
	if v.length() > MAX_DISTANCE:
		v = v.normalized()
		dir_v = v * speed
	else:
		dir_v = Vector2.ZERO
	
	return dir_v
	
func avoid_v(cur_pos, goal_pos) -> Vector2:
	var v_to_me = (cur_pos - goal_pos) 
	
	return v_to_me
	

func _draw():
	draw_circle(goal-position, 3, Color.green)
	
func stuff(delta):
	
	var vcentre = Vector2.ZERO
	var vavoid = Vector2.ZERO
	var groupSize = 0
	avg_group_distance = (goal - get_global_position()).length()
	for go in boids:
		vcentre += go.get_global_position()
		groupSize += 1
		
		var distance = (go.get_global_position() - get_global_position()).length()
		# Too close
		if (distance < 50.0):
			vavoid = vavoid + (get_global_position() - go.get_global_position())
		avg_group_distance += (goal - go.get_global_position()).length()
		
	vcentre = vcentre / groupSize
	var to_goal = goal - position
	velocity = (vcentre + vavoid + to_goal) - position
	
	if (avg_group_distance) / groupSize <= MAX_DISTANCE:
		velocity = Vector2.ZERO
		
	velocity = velocity.normalized() * 200
	move_and_slide(velocity)

func is_in_Boids(area) -> bool:
	if area.get_parent().is_in_group("Boids"):
		return true
	
	return false

func _on_Neighbours_area_entered(area):
	if is_in_Boids(area):
		neighbours.append(area.get_parent())


func _on_Neighbours_area_exited(area):
	if is_in_Boids(area):
		neighbours.erase(area.get_parent())
