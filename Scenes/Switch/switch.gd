extends Node2D

class_name Switch

enum State { OFF, ON }
var cur_state

var affect

func _ready():
	#affect = get_node(affect_path)
	cur_state = State.OFF
	$AnimatedSprite.play("Off")

func set_effect(aff):
	affect = aff


func _on_Area2D_body_entered(body):
	if cur_state != State.ON:
		cur_state = State.ON
		$AnimatedSprite.play("On")
		affect.switch_activated()

func _on_Area2D_body_exited(body):
	if cur_state == State.ON:
		cur_state = State.OFF
		$AnimatedSprite.play("Off")
		affect.switch_deactivated()
