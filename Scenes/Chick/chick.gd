extends KinematicBody2D


export (NodePath) var duck_path
var lead	# the entity that it will follow
onready var goal_point = Vector2.ZERO	# horde behaviour
var gap

var MAX_DISTANCE = 10	# Distance to avoid chicks
var speed = 2 # Default

var circle_point = Vector2()

var direction

func _ready():
	pass
	
func _process(delta):
	update()
	
func _physics_process(delta):
	$StateMachine.tick(delta)
	
func get_lead():
	return lead
	
func set_lead(new_lead):
	lead = new_lead
	
func get_gap():
	return gap	

func set_gap(val):
	gap = val
	
func set_speed(val):
	speed = val
	
func set_circle_center(point):
	circle_point = point
	
func _draw():
	draw_circle(circle_point, 5, Color.red)
	draw_circle(goal_point - position, 5, Color.pink)
	
func change_state(state):
	$StateMachine.change_state(state)

func change_leader(chick):
	# chick that was collided with
	var chick_distance_away = abs((chick.position - chick.lead.position).length())
	# current chick
	var distance_away = abs((position - lead.position).length())
	
	# change leader if the chick we collided is closer to the main leader
	if chick_distance_away < distance_away:
		lead = chick
	
func get_direction():
	return direction
	
func set_direction(val):
	direction = val
	

func _on_Area2D_body_entered(body):
	var kin = body

	#if kin.is_in_group("Chick"):
	#	print("Is a chick")
	#	if kin.lead == lead:
	#		change_leader(kin)
		

