extends Node2D

# Responsible for input from the player to play the game

signal change_flock_state(state)
signal change_duck_speed(spd)
signal change_chick_speed(spd)

signal change_item_entity(state)

signal unlocking

signal deactivate_duck
signal activate_duck

func _ready():
	emit_signal("change_duck_speed", $Data.duck_attached_speed)
	emit_signal("change_item_entity", "Duck")

# Change state of Chicks
func _input(event):
	# Commands only available on DuckController
	if $ControlToggleCmd.get_current_state() == "Duck":
		if event.is_action_pressed("quack_cmd"):		# H
			if $DucklingQuackCmd.get_current_state() == "Attached":
				emit_signal("change_flock_state", "Stay")
				emit_signal("change_duck_speed", $Data.duck_dettached_speed)
				SoundManager.play_quack_neutral()
			else:	# dettached
				emit_signal("change_flock_state", "Follow")
				emit_signal("change_duck_speed", $Data.duck_attached_speed)
				emit_signal("change_chick_speed", $Data.chick_attached_speed)
				SoundManager.play_quack_angry()
			$DucklingQuackCmd.toggle_state()
	# Command for both Duck Controller and Chick Controller


# Direct control of Movement entities
func get_input_v2():
	if Input.is_action_just_pressed("control_cmd"):
		# may have to refactor
		if $ControlToggleCmd.get_current_state() == "Flock":
			$StateMachine.change_state("DuckController")
			emit_signal("change_flock_state", "Stay")
			emit_signal("change_item_entity", "Duck")
			emit_signal("activate_duck")
			emit_signal("change_duck_speed", $Data.duck_dettached_speed)
			$ControlToggleCmd.toggle_state()
		else:	# Duck
			if $DucklingQuackCmd.get_current_state() == "Attached":
				emit_signal("change_flock_state", "Stay")
				emit_signal("change_duck_speed", $Data.duck_dettached_speed)
				$DucklingQuackCmd.toggle_state()
			else: # dettached
				$StateMachine.change_state("ChickController")
				emit_signal("change_flock_state", "Flock")
				emit_signal("change_chick_speed", $Data.chick_horde_speed)
				emit_signal("change_item_entity", "Flock")
				emit_signal("deactivate_duck")
				$ControlToggleCmd.toggle_state()
				print_debug("controlling chicks?")





func _physics_process(delta):
	get_input_v2()
	$StateMachine.tick(delta)
