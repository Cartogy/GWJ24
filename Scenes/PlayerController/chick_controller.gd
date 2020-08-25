extends "../StateMachine/state.gd"

signal update_flock_center(dir, spd)		# FlockManager
signal calculate_flock_center_average()		# FlockManager

var player
var data
var dir_v = Vector2.ZERO

func _ready():
	player = get_owner()
	var flock = player.get_parent().get_node("FlockManager")
	data = player.get_node("Data")
	self.connect("update_flock_center", flock, "_on_ChickHordeMovement_update_flock_center")
	self.connect("calculate_flock_center_average", flock, "_on_ChickHordeMovement_calculate_flock_center_average")

func enter():
	print("CHick COntrol")
	emit_signal("calculate_flock_center_average")
	
func exit():
	pass
	
func update(delta):
	dir_v = get_input().normalized()
	
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
