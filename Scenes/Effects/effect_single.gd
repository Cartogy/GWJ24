extends "effect.gd"

enum Type { SINGLE, CONSTANT }
export (Type) var effect_type

export (NodePath) var switch_path
var switch_for_effect: Switch

func _ready():
	print("Ready")
	state = State.DEACTIVATED
	switch_for_effect = get_node(switch_path)
	switch_for_effect.set_effect(self)


func switch_activated():
	state = State.ACTIVATED
	apply_effect_when_on()

func switch_deactivated():
	if effect_type == Type.CONSTANT:
		apply_effect_when_off()
