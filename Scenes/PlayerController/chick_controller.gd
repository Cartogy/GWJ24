extends "../StateMachine/state.gd"

signal update_flock_center(dir, spd)
signal calculate_flock_center_average()

var player
var data
var dir_v = Vector2.ZERO

func _ready():
	player = get_owner()
	data = player.get_node("Data")

func enter():
	print("CHick COntrol")
	emit_signal("calculate_flock_center_average")
	
func exit():
	pass
	
func update(delta):
	dir_v = get_input().normalized()
	if dir_v != Vector2.ZERO:
		emit_signal("update_flock_center", dir_v, data.chick_center_speed)

func input_handler():
	
	#dir_v = get_input()
	pass
	

func get_input() -> Vector2:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		velocity += Vector2(0,1)
	if Input.is_action_pressed("ui_up"):
		velocity += Vector2(0,-1)
	if Input.is_action_pressed("ui_right"):
		velocity += Vector2(1,0)
	if Input.is_action_pressed("ui_left"):
		velocity += Vector2(-1,0)
		
		
	return velocity
