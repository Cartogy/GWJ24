extends "../StateMachine/state.gd"

export (float) var duck_speed
export (float) var chick_speed
export (float) var horde_speed	# When controlling the chicks

func _ready():
	pass 

func get_duck_speed() -> float:
	return duck_speed
	
func get_chick_speed() -> float:
	return chick_speed
	
func get_horde_speed() -> float:
	return horde_speed
