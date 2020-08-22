extends Node

enum State { INGAME, PAUSE }
var current_state

var pause_ui

var current_level

# Called when the node enters the scene tree for the first time.
func _ready():
	current_state = State.INGAME
	pause_ui = get_node("PauseMenu")
	pause_ui.focus_mode = pause_ui.FOCUS_NONE
	remove_child(pause_ui)
	current_level = get_node("Level_1")

func _input(event):
	if Input.is_action_just_pressed("pause_menu"):
		change_state()
			
func enable_game():
	set_level(false)
	
func disable_game():
	set_level(true)
	
func set_level(status: bool):
	get_tree().paused = status
	#current_level.set_process(status)
	#current_level.set_physics_process(status)
	#current_level.set_process_input(status)
	#current_level.get_tree().paused = status

func change_state():
	if current_state == State.INGAME:
		add_child(pause_ui)
		current_state = State.PAUSE
		disable_game()
	else:
		remove_child(pause_ui)
		current_state = State.INGAME
		enable_game()

func _on_World_Complete(next_level_path):
	var next_level_pack = load(next_level_path)
	var next_level = next_level_pack.instance()
	var prev_level = current_level
	current_level = next_level
	
	#remove_child(prev_level)
	prev_level.queue_free()
	add_child(current_level)
	
