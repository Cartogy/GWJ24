extends Node2D

class_name Effect

enum State { ACTIVATED, DEACTIVATED }
var state

export (String) var start_effect
export (String) var on_effect
export (String) var off_effect

var effects_available = {}

func _ready():
	# This was a pain
	print(get_child_count())
	for names in get_children():
		print(names)
	for effect in get_child(0).get_children():
		effects_available[effect.effect_node_name] = effect
		print(effect.effect_node_name)
	effects_available[start_effect].play_effect()

func apply_effect_when_on():
	effects_available[on_effect].play_effect()

func apply_effect_when_off():
	effects_available[off_effect].play_effect()

func switch_activated():
	pass

func switch_deactivated():
	pass

func _on_EffectNode_add(name, effect_node):
	effects_available[name] = effect_node
