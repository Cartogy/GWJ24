extends "../ScriptClasses/vector_movement.gd"

class_name Duck

signal update_position_entity(pos)

var speed = 30	# default
export (int) var radius
export (float) var steering

func _ready():
	var item_manager = get_owner().get_parent().get_node("ItemManager")
	self.connect("update_position_entity", item_manager, "_on_Duck_update_position_entity")
	$CollisionShape2D.position = Vector2(0.3, -3)
	if steering < 0.0:
		steering = 0
	elif steering > 1.0:
		steering = 1.0

func change_direction(dir):
	set_forward_v(dir)

	$ForwardRay.set_point_position(1, get_forward_v() * 4)

func _process(delta):
	if get_desired_direction_v() == Vector2.ZERO && $AnimationPlayer.is_playing():
		$AnimatedSprite.stop()
		$AnimationPlayer.stop()
	#update()	# Draw Circle

func get_gap():
	return radius

func _draw():
	pass
	#draw_circle(get_forward_v() * 10, 1, Color.green)



func _on_DuckMovement_give_desired_direction(dir):
	set_desired_direction_v(dir)


func _on_DuckMovement_stop_moving():
	set_desired_direction_v(Vector2.ZERO)


func _on_PlayerController_change_duck_speed(spd):
	speed = spd


func _on_PlayerController_deactivate_duck():
	$Movement.deactivate_movement()


func _on_PlayerController_activate_duck():
	$Movement.activate_movement()
