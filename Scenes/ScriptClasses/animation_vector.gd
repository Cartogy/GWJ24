extends Node

class_name AnimationVector

var vector_entity : VectorMovement = get_owner()

func _ready():
	vector_entity.get_node("Animated")

func _process(delta):
	animation_direction()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func animation_direction
	
