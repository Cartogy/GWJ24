extends KinematicBody2D

class_name VectorMovement

onready var forward_v = Vector2(1,0)
onready var desired_direction_v = Vector2.ZERO

func set_forward_v(val: Vector2):
	forward_v = val
	
func get_forward_v() -> Vector2:
	return forward_v
	
func get_desired_direction_v() -> Vector2:
	return desired_direction_v
	
func set_desired_direction_v(val: Vector2):
	desired_direction_v = val
