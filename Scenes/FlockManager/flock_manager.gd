extends Node

export (NodePath) var main_duck_path
var main_duck

var chicks = []

var current_chick_state

# Called when the node enters the scene tree for the first time.
func _ready():
	main_duck = get_node(main_duck_path)
	for chick in get_children():
		chick.duck = main_duck
		chicks.append(chick)
		
func _input(event):
	if event.is_action_pressed("stay_cmd"):
		if current_chick_state != "Stay":
			change_chick_state("Stay")
	elif event.is_action_pressed("follow_cmd"):
		if current_chick_state != "Follow":
			change_chick_state("Follow")
	
func change_chick_state(state):
	for chick in chicks:
		chick.change_state(state)
	current_chick_state = state
	

