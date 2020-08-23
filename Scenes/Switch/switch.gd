extends Node2D

class_name Switch

enum State { OFF, ON }
var cur_state

var affect = []

var weights = []	# Stores the amount of bodys on the switch

func _ready():
	#affect = get_node(affect_path)
	cur_state = State.OFF
	$AnimatedSprite.play("Off")

func set_effect(aff):
	#affect = aff
	affect.append(aff)


func _on_Area2D_body_entered(body):
	weights.append(body)
	if cur_state != State.ON:
		cur_state = State.ON
		$AnimatedSprite.play("On")
		SoundManager.play_game_switch()
		if affect.size() > 0:
			for a in affect:
				a.switch_activated()

func _on_Area2D_body_exited(body):
	weights.erase(body)
	if cur_state == State.ON && weights.size() == 0:
		cur_state = State.OFF
		$AnimatedSprite.play("Off")
		if affect.size() > 0:
			for a in affect:
				a.switch_deactivated()
