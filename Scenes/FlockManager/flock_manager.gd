extends Node

export (int) var gap_per_chick
export (float) var speed_chick
export (NodePath) var main_duck_path
var main_duck

signal update_flock_center
signal update_entity_position(pos)

var chicks = []

var current_chick_state

var average_flock_center
var goal = Vector2.ZERO

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
		

func _physics_process(delta):
	average_flock_center = calculate_average_center()
	for c in chicks:
		c.set_avg_center(average_flock_center)

func change_chick_state(state):
	if current_chick_state != state:
		for chick in chicks:
			chick.change_state(state)
		current_chick_state = state
	

func update_goals_dir(new_goal, dir):
	for chick in chicks:
		chick.goal_point = new_goal
		chick.set_desired_direction_v(dir)
		

func calculate_average_center() -> Vector2:
	var total_chicks = 0
	var sum = Vector2.ZERO
	for chick in chicks:
		sum += chick.get_global_position()
		total_chicks += 1
	
	var avg_pos = sum / total_chicks
	return avg_pos
	
	
	
	
func change_flock_speed(spd):
	for chick in chicks:
		chick.set_speed(spd)
	

func _on_ChickHordeMovement_update_flock_center(dir, spd):
	average_flock_center = calculate_average_center()
	var goal_direction = dir.normalized() * spd
	goal = average_flock_center + goal_direction
	emit_signal("update_entity_position", average_flock_center)
	update_goals_dir(goal, dir.normalized())
	


func _on_ChickHordeMovement_calculate_flock_center_average():
	calculate_average_center()


func _on_PlayerController_change_flock_state(state):
	change_chick_state(state)


func _on_PlayerController_change_chick_speed(spd):
	change_flock_speed(spd)
