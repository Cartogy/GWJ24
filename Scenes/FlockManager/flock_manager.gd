extends Node

export (int) var gap_per_chick
export (float) var speed_chick
export (NodePath) var main_duck_path
var main_duck

signal update_flock_center

var chicks = []

var current_chick_state

var average_flock_center

# Called when the node enters the scene tree for the first time.
func _ready():
	main_duck = get_node(main_duck_path)
	var previous_chick = null
	for chick in get_children():
		
		chick.set_gap(gap_per_chick)
		chick.set_speed(speed_chick)
		
		if main_duck != null:
			# Set leads for chicks
			if previous_chick == null:
				chick.set_lead(main_duck)
				previous_chick = chick
			else:
				chick.set_lead(previous_chick)
				previous_chick = chick
		else:
			chick.set_lead(null)
		
		
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
	

func update_goals(new_goal):
	for chick in chicks:
		chick.goal_point = new_goal

func calculate_average_center():
	var total_chicks = 0
	var sum = Vector2.ZERO
	for chick in chicks:
		sum += chick.get_global_position()
		total_chicks += 1
	
	var avg_pos = sum / total_chicks
	average_flock_center = avg_pos
	
	

func _on_ChickHordeMovement_update_flock_center(dir, spd):
	average_flock_center += dir.normalized() * spd
	print(average_flock_center)
	update_goals(average_flock_center)


func _on_ChickHordeMovement_calculate_flock_center_average():
	calculate_average_center()


func _on_PlayerController_change_flock_state(state):
	change_chick_state(state)
