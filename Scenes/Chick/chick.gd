extends KinematicBody2D

export (int) var gap
export (NodePath) var duck_path
var lead	# the entity that it will follow

var circle_point = Vector2()

var direction

var speed = 10

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
	
	
func set_circle_center(point):
	circle_point = point
	
func _draw():
	draw_circle(circle_point, 5, Color.red)
	
func change_state(state):
	$StateMachine.change_state(state)

func change_leader(chick):
	var chick_distance_away = abs((chick.position - chick.get_lead().position).length())
	var distance_away = abs((position - lead.position).length())
	
	# change leaedr if the chick we collided is closer
	if chick_distance_away < distance_away:
		lead = chick
	
	
	

func _on_Area2D_body_entered(body):
	var kin = body
	print("Collision")
	print(kin.name)
	if kin.is_in_group("Chick"):
		print("Is a chick")
		if kin.lead == lead:
			change_leader(kin)
