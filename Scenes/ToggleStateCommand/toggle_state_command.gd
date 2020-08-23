extends Node

#manage dual states
# purpose is to avoid managing various states in a single script

# Early prototype

export (String) var state_0
export (String) var state_1

export (String) var start_state

var current_state

func _ready():
	current_state = start_state
	
func set_current_state(s):
	current_state = s
	
func get_current_state():
	return current_state
	
func toggle_state():
	if current_state == state_0:
		current_state = state_1
	else:
		current_state = state_0
