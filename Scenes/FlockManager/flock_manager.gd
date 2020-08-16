extends Node

export (int) var gap_per_chick
export (float) var speed_chick
export (NodePath) var main_duck_path
var main_duck

var chicks = []

var current_chick_state

# Called when the node enters the scene tree for the first time.
func _ready():
	main_duck = get_node(main_duck_path)
	var previous_chick = null
	for chick in get_children():
		
		chick.set_gap(gap_per_chick)
		chick.set_speed(speed_chick)
		
		# Set leads for chicks
		if previous_chick == null:
			chick.set_lead(main_duck)
			previous_chick = chick
		else:
			chick.set_lead(previous_chick)
			previous_chick = chick
		chicks.append(chick)
		
# Responsible for commands
func _input(event):
	if event.is_action_pressed("stay_cmd"):		# H
		if current_chick_state != "Stay":
			change_chick_state("Stay")
	elif event.is_action_pressed("follow_cmd"):		# M
		if current_chick_state != "Follow":
			change_chick_state("Follow")
	
func change_chick_state(state):
	for chick in chicks:
		chick.change_state(state)
	current_chick_state = state
	

