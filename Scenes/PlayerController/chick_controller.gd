extends "../StateMachine/state.gd"

signal update_flock_center(dir, spd)
signal calculate_flock_center_average()

var player
var dir_v = Vector2.ZERO

func _ready():
	player = get_owner()

func enter():
	print("CHick COntrol")
	emit_signal("calculate_flock_center_average")
	
func exit():
	pass
	
func update(delta):
	pass

func input_handler():
	
	dir_v = get_input()
	if dir_v != Vector2.ZERO:
		emit_signal("update_flock_center", dir_v, player.speed)

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
