extends Node2D

# Responsible for input from the player to play the game

signal change_flock_state(state)
signal change_duck_speed(spd)
signal change_chick_speed(spd)

signal change_item_entity(state)

signal unlocking

signal deactivate_duck
signal activate_duck

var cur_state = ""	# For chick commands
var chick_state = ""

func _ready():
	emit_signal("change_duck_speed", $Data.duck_attached_speed)
	emit_signal("change_item_entity", "Duck")

# Change state of Chicks
func _input(event):
	# Commands only available on DuckController
	if cur_state == "DuckController":
		if event.is_action_pressed("stay_cmd"):		# H
			chick_state = "Stay"
			emit_signal("change_flock_state", "Stay")
			emit_signal("change_duck_speed", $Data.duck_dettached_speed)
		elif event.is_action_pressed("follow_cmd"):		# M
			chick_state = "Follow"
			emit_signal("change_flock_state", "Follow")
			emit_signal("change_duck_speed", $Data.duck_attached_speed)
			emit_signal("change_chick_speed", $Data.chick_attached_speed)
	# Command for both Duck Controller and Chick Controller
	if event.is_action_pressed("unlocking"):
		emit_signal("unlocking")

# Direct control of Movement entities
func get_input_v2():
	if Input.is_action_pressed("duck_cmd"):
		if cur_state != "DuckController":
			$StateMachine.change_state("DuckController")
			emit_signal("change_flock_state", "Stay")
			cur_state = "DuckController"
			emit_signal("change_item_entity", "Duck")
			emit_signal("activate_duck")
			emit_signal("change_duck_speed", $Data.duck_dettached_speed)
		else:
			if chick_state == "Follow":
				emit_signal("change_flock_state", "Follow")
				emit_signal("change_duck_speed", $Data.duck_dettached_speed)
				chick_state = "Follow"
	elif Input.is_action_pressed("chick_cmd") && cur_state != "ChickController":		#T
		$StateMachine.change_state("ChickController")
		emit_signal("change_flock_state", "Flock")
		emit_signal("change_chick_speed", $Data.chick_horde_speed)
		cur_state = "ChickController"
		emit_signal("change_item_entity", "Flock")
		emit_signal("deactivate_duck")
		chick_state = "Flock"




func _physics_process(delta):
	get_input_v2()
	$StateMachine.tick(delta)
