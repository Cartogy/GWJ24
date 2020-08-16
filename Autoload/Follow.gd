extends Node

func target_point(
	global_target_position: Vector2,
	direction: Vector2,
	offset: int
) -> Vector2:
	var target = global_target_position - direction.normalized() * offset
	return target

func follow(
	global_target_position: Vector2,
	global_position: Vector2,
	speed: float,
	offset: int
) -> Vector2:
	var target = target_point(
					global_target_position,
					global_position,
					offset
				)
	var velocity = target - global_position
	var direction = velocity.normalized() * speed
	return direction
