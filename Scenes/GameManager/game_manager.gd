extends Node

enum State { INGAME, PAUSE }
var current_state

var pause_ui


# Called when the node enters the scene tree for the first time.
func _ready():
	current_state = State.INGAME
	pause_ui = get_child(0)
	pause_ui.focus_mode = pause_ui.FOCUS_NONE
	remove_child(pause_ui)

func _input(event):
	if Input.is_action_just_pressed("pause_menu"):
		if current_state == State.INGAME:
			add_child(pause_ui)
			current_state = State.PAUSE
		else:
			remove_child(pause_ui)
			current_state = State.INGAME
			
func enable_game():
	pass
	
func disable_game():
	pass
