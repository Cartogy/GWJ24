extends KinematicBody2D

export (int) var speed
export (int) var radius


var direction = Vector2(0, 0)

var gap_per_chick = 2

func _ready():
	pass # Replace with function body.

func change_direction(dir):
	direction = dir
	
	$ForwardRay.set_point_position(1, direction * 4)

func _process(delta):
	update()	# Draw Circle

func get_gap():
	return radius
	
func _draw():
	draw_circle(direction * 10, 1, Color.green)
