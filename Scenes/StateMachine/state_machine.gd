extends Node

var current_state
var all_states

func _ready():
	for state in get_children():
		all_states[state.name] = state
	

func tick(delta):
	var next_state = current_state.update(delta)
	if next_state != null:
		change_state(next_state)
	
func change_state(state):
	current_state.exit()
	current_state = all_states[state.name]
	current_state.enter()
