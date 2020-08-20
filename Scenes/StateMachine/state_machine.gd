extends Node

var current_state
var all_states = {}

export (NodePath) var START_STATE

func _ready():
	for child in get_children():
		all_states[child.NAME] = child
	initialize(START_STATE)

func _input(event):
	current_state.input_handler()

func tick(delta):
	var next_state = current_state.update(delta)
	if next_state != null:
		change_state(next_state)

func change_state(state):
	current_state.exit()
	current_state = all_states[state]
	current_state.enter()

func initialize(start_state):
	current_state = all_states[get_node(start_state).NAME]
	current_state.enter()
