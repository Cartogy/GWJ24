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

func change_direction(dir):
	pass

func move_forward(forward_v, desired_v, entity, steer) -> Vector2:
	var i_v = Vector2(0,0)
	if desired_v != Vector2(0,0):
		i_v = forward_v
		if desired_v.x != 0 || desired_v.y != 0:
			i_v = lerp(forward_v, desired_v, steer)
			entity.change_direction(i_v)
	return i_v
