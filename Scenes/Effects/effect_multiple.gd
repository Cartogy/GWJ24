extends "effect.gd"

enum Type { SINGLE, CONSTANT }
export (Type) var effect_type

export (Array, NodePath) var switch_path
var switches = []
var total_switches = 0
var current_switches_on = 0

func _ready():
	state = State.DEACTIVATED
	var index = 0
	for path in switch_path:
		var switch = get_node(path)
		switch.set_effect(self)
		switches.append(switch)
		
		index += 1
	total_switches = index

func apply_effect_when_on():
	pass
	
func apply_effect_when_off():
	pass
	
func switch_activated():
	current_switches_on += 1
	if current_switches_on == total_switches:
		apply_effect_when_on()
	
func switch_deactivated():
	if current_switches_on == total_switches:
		if effect_type == Type.CONSTANT:
			apply_effect_when_off()
	current_switches_on -= 1

	
