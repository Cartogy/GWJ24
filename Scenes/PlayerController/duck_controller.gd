extends "../StateMachine/state.gd"

onready var player = get_owner()

signal give_desired_direction(dir)		# Connceted to Duck
signal stop_moving							# Connected to Duck

func enter():
	print("ENtering Duck Movement")
	
func exit():
	emit_signal("stop_moving")
	print("Leaving duck movement")
	
func update(delta):
	pass
	
func input_handler():
	var direction = get_input()
	
	emit_signal("give_desired_direction", direction)


func get_input() -> Vector2:
	var direction = Vector2()
	if Input.is_action_pressed("ui_up"):
		direction += Vector2(0,-1)
	if Input.is_action_pressed("ui_down"):
		direction += Vector2(0,1)
	if Input.is_action_pressed("ui_right"):
		direction += Vector2(1,0)
	if Input.is_action_pressed("ui_left"):
		direction += Vector2(-1,0)
		
	return direction
		
	#if direction.x != 0 || direction.y != 0:	# change direction when moving
	#	duck.change_direction(direction)
