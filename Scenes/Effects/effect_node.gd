extends Node

class_name EffectNode

export (String) var effect_node_name


var parent

func _ready():
	parent = get_owner()
	print(parent.name)

func play_effect():
	pass

func get_effect_node_name():
	return effect_node_name
