extends KinematicBody2D

var speed = 30	# default
export (int) var radius
export (float) var steering

var forward_direction = Vector2(1, 0)	# Forward vector of the duck
var desired_direction = Vector2.ZERO	# Direction to move towards

func _ready():
	if steering < 0.0:
		steering = 0
	elif steering > 1.0:
		steering = 1.0

func change_direction(dir):
	forward_direction = dir
	
	$ForwardRay.set_point_position(1, forward_direction * 4)

func _process(delta):
	update()	# Draw Circle

func get_gap():
	return radius
	
func _draw():
	draw_circle(forward_direction * 10, 1, Color.green)

func get_direction():
	return forward_direction
	
func set_direction(val):
	forward_direction = val



func _on_DuckMovement_give_desired_direction(dir):
	desired_direction = dir


func _on_DuckMovement_stop_moving():
	desired_direction = Vector2.ZERO


func _on_PlayerController_change_duck_speed(spd):
	speed = spd
