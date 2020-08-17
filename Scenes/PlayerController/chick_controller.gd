extends "../StateMachine/state.gd"

var player

var dir_v = Vector2.ZERO

func _ready():
	player = get_owner()

func enter():
	pass
	
func exit():
	pass
	
func update(delta):
	if dir_v != Vector2.ZERO:
		emit_signal("update_flock_center", dir_v, player.speed)

func input_handler():
	dir_v = get_input().normalized()

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
